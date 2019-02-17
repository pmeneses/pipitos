using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.planificarrecoleccion
{
    public partial class edit : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack == false)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["idplanificacion"]))
                {
                    idplanificacion.Value = Request.QueryString["idplanificacion"];

                    var idplanifi = int.Parse(idplanificacion.Value);
                    //vamos a cargar la informacion de la ruta.
                    var r = bd.planificador_recoleccion.Find(idplanifi);
                    if (r != null)
                    {
                        txtfecharegistro.Text = string.Format("{0:yyyy-MM-dd}", r.fecha);
                        txtfechavisita.Text = string.Format("{0:yyyy-MM-dd}", r.fechavisita);

                        txtfecharegistro.Focus();
                        var m = (modulo.mensaje)this.Session["mensaje"];
                        if (m != null)
                        {
                            modulo.ShowToastr(this, m.texto, "Sistema", m.tipo);
                            this.Session["mensaje"] = null;
                        }
                        cargardatos();
                        limpiarcamposdetalle();
                        cargardetalleplanificacion(idplanifi);

                    }
                    else
                    {
                        this.Session["mensaje"] = new modulo.mensaje
                        {
                            texto = "La planificacion de recolección a la que quiere acceder ya no existe",
                            tipo = "error"
                        };
                        Response.Redirect("index.aspx");
                    }
                }
                else
                {
                    //redirigimos a pagina de error.
                }
            }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                //vamos a validar los campos
                var validador = validarcampos();
                if (validador != "")
                {
                    txtfecharegistro.Focus();
                    modulo.ShowToastr(this, validador, "Sistema", "info");
                    return;
                }

                var p = bd.planificador_recoleccion.Find(int.Parse(idplanificacion.Value));
                p.fecha = Convert.ToDateTime(txtfecharegistro.Text);
                p.fechavisita = Convert.ToDateTime(txtfechavisita.Text);
                p.eliminada = false;

                bd.Entry(p).State = EntityState.Modified;
                bd.SaveChanges();

                limpiarcampos();
                this.Session["mensaje"] = new modulo.mensaje
                {
                    texto = "Planificación de recolección guardada exitosamente",
                    tipo = "success"
                };
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (Exception ex)
            {
                txtfecharegistro.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        private void cargardetalleplanificacion(int idplanifi)
        {
            //vamos a cargar el detalle de la planificacion
            var detalle = (from pd in bd.planificar_donante
                           join d in bd.donante on pd.id_donante equals d.id_donante
                           join ru in bd.rutas on pd.id_ruta equals ru.id_ruta
                           where pd.id_plan_rec == idplanifi
                           orderby pd.id_planificar_don descending
                           select new
                           {
                               iddetalle = pd.id_planificar_don,
                               fecharegistro = pd.fecha_registro,
                               donante = d.nombre_donante,
                               visitarealizada = pd.visitarealizada == null ? false : pd.visitarealizada.Value,
                               observaciones = pd.observaciones == null ? "Ninguna" : pd.observaciones,
                               ruta = ru.nombre_ruta
                           });

            gvplanificaciondetalle.DataSource = detalle.ToList();
            gvplanificaciondetalle.DataBind();

            //vamos a validar si mostramos el boton de marcar como visita realizada.
            for (int row = 0; row < gvplanificaciondetalle.Rows.Count; row++)
            {
                GridViewRow gvr1 = (GridViewRow)gvplanificaciondetalle.Rows[row];
                LinkButton hf1 = (LinkButton)gvr1.FindControl("btnvisitaR");
                LinkButton btnvp = (LinkButton)gvr1.FindControl("btnvisitaP");
                CheckBox ck1 = (CheckBox)gvr1.FindControl("ckvisitaR");
                if (ck1.Checked)
                {
                    hf1.Visible = false;
                    btnvp.Visible = true;
                }
                else
                {
                    hf1.Visible = true;
                    btnvp.Visible = false;
                }

                //if (Convert.ToBoolean(gvplanificaciondetalle.Rows[row].Cells[2].Text))
                //    gvplanificaciondetalle.Rows[row].Cells[6].Visible = false;
            }
        }

        private string validarcampos()
        {
            string mensaje = "";

            if (txtfecharegistro.Text == string.Empty)
                mensaje += "Ingrese la fecha de registro <br>";
            if (txtfechavisita.Text == string.Empty)
                mensaje += "Ingrese la fecha de visita <br>";

            return mensaje;
        }

        private void limpiarcampos()
        {
            txtfecharegistro.Text = string.Empty;
            txtfechavisita.Text = string.Empty;
        }

        private void limpiarcamposdetalle()
        {
            cbdonantes.SelectedIndex = -1;
            cbruta.SelectedIndex = -1;
            rbvisitaP.Checked = true;
            rbvisitaR.Checked = false;
            txtobservaciones.Text = string.Empty;
        }

        //load datos
        private void cargardatos()
        {
            var donantes = bd.donante.Where(c => c.estado == true)
            .Select(c => new {
                iddonante = c.id_donante,
                nombredonante = c.nombre_donante
            });

            cbdonantes.DataSource = donantes.ToList();
            cbdonantes.DataValueField = "iddonante";
            cbdonantes.DataTextField = "nombredonante";
            cbdonantes.DataBind();

            var rutas = bd.rutas.Select(c => new
            {
                idruta = c.id_ruta,
                nombreruta = c.nombre_ruta
            });

            cbruta.DataSource = rutas.ToList();
            cbruta.DataTextField = "nombreruta";
            cbruta.DataValueField = "idruta";
            cbruta.DataBind();
        }

        protected void btnguardardetalle_Click(object sender, EventArgs e)
        {
            try
            {

                bool visitarealizada = false;

                planificar_donante pd;

                if (iddetalleselect.Value == "0")
                    pd = new planificar_donante();
                else
                    pd = bd.planificar_donante.Find(int.Parse(iddetalleselect.Value));

                //pd = new planificar_donante();
                pd.id_donante = int.Parse(cbdonantes.SelectedValue.ToString());
                pd.id_plan_rec = int.Parse(idplanificacion.Value);
                pd.id_ruta = int.Parse(cbruta.SelectedValue.ToString());
                pd.fecha_registro = DateTime.Now;
                if (rbvisitaR.Checked)
                    visitarealizada = true;
                if (rbvisitaP.Checked)
                    visitarealizada = false;

                pd.visitarealizada = visitarealizada;
                pd.observaciones = txtobservaciones.Text == string.Empty ? "Ninguna" : txtobservaciones.Text;

                if (iddetalleselect.Value == "0")
                    bd.planificar_donante.Add(pd);
                else
                    bd.Entry(pd).State = EntityState.Modified;

                bd.SaveChanges();
                limpiarcamposdetalle();
                cbdonantes.Focus();

                var m = new modulo.mensaje
                {
                    texto = "Registro Guardado exitosamente",
                    tipo = "success"
                };

                modulo.ShowToastr(this, m.texto, "Sistema", m.tipo);
                
                cargardetalleplanificacion(int.Parse(idplanificacion.Value));
            }
            catch (Exception ex)
            {
                cbdonantes.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        protected void btnadddetalle_Click(object sender, EventArgs e)
        {
            paneldetalleplanifiacion.Visible = true;
            btnadddetalle.Visible = false;
        }

        protected void btncerraradddetalle_Click(object sender, EventArgs e)
        {
            paneldetalleplanifiacion.Visible = false;
            limpiarcamposdetalle();
            iddetalleselect.Value = "0";
            btnadddetalle.Visible = true;
        }

        protected void btnEditD_Command(object sender, CommandEventArgs e)
        {
            try
            {
                var index = e.CommandArgument.ToString();
                var iddetalle = gvplanificaciondetalle.DataKeys[int.Parse(index)].Values["iddetalle"];
                var detalle = bd.planificar_donante.Find(iddetalle);
                cbdonantes.SelectedValue = detalle.id_donante.ToString();
                cbruta.SelectedValue = detalle.id_ruta.ToString();
                txtobservaciones.Text = detalle.observaciones;
                rbvisitaP.Checked = detalle.visitarealizada == false ? true : detalle.visitarealizada.Value;
                rbvisitaR.Checked = detalle.visitarealizada == true ? true : detalle.visitarealizada.Value;
                iddetalleselect.Value = detalle.id_planificar_don.ToString();
                cbdonantes.Focus();
                paneldetalleplanifiacion.Visible = true;
            }
            catch (Exception ex)
            {
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
                paneldetalleplanifiacion.Visible = false;
            }

        }

        protected void gvplanificaciondetalle_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //este evento se agrega para que no de error cuando se da en el boton editar.
        }

        protected void btnvisitaR_Command(object sender, CommandEventArgs e)
        {
            try
            {
                var index = e.CommandArgument.ToString();
                var iddetalle = gvplanificaciondetalle.DataKeys[int.Parse(index)].Values["iddetalle"];
                var detalle = bd.planificar_donante.Find(iddetalle);
                detalle.visitarealizada = true;
                bd.Entry(detalle).State = EntityState.Modified;
                bd.SaveChanges();
                modulo.ShowToastr(this, "La operación se realizo exitosamente", "Sistema", "success");
                cargardetalleplanificacion(int.Parse(idplanificacion.Value));
            }
            catch (Exception ex)
            {
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        protected void btnvisitaP_Command(object sender, CommandEventArgs e)
        {
            try
            {
                var index = e.CommandArgument.ToString();
                var iddetalle = gvplanificaciondetalle.DataKeys[int.Parse(index)].Values["iddetalle"];
                var detalle = bd.planificar_donante.Find(iddetalle);
                detalle.visitarealizada = false;
                bd.Entry(detalle).State = EntityState.Modified;
                bd.SaveChanges();
                modulo.ShowToastr(this, "La operación se realizo exitosamente", "Sistema", "success");
                cargardetalleplanificacion(int.Parse(idplanificacion.Value));
            }
            catch (Exception ex)
            {
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static modulo.mensaje DeletedetalleClick(int iddetalle)
        {
            try
            {
                pipitosEntities bd = new pipitosEntities();

                var r = bd.planificar_donante.Find(iddetalle);

                if (r == null)
                {
                    return new modulo.mensaje
                    {
                        texto = "El registro que desea eliminar no esta disponible",
                        tipo = "error"
                    };
                }

                bd.planificar_donante.Remove(r);
                bd.SaveChanges();

                HttpContext.Current.Session["mensaje"] = new modulo.mensaje
                {
                    texto = "El registro se elimino exitosamente",
                    tipo = "success"
                };

                //solo usamos esto para retornar un valor pero lo que en realidad se muestra es lo seteado en la variable de sesion
                //porque se vuelve a recarga la pagina desde el java script
                return new modulo.mensaje
                {
                    texto = "nada",
                    tipo = "success"
                };
            }
            catch (Exception ex)
            {
                return new modulo.mensaje
                {
                    texto = ex.Message,
                    tipo = "error"
                };
            }
        }

        protected void gvplanificaciondetalle_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            for (int i = 0; i < e.Row.Cells.Count; i++)
            {
                e.Row.Cells[i].ToolTip = e.Row.Cells[i].Text;
            }
        }
    }
}