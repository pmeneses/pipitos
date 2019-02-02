using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.comprobanterecoleccion
{
    public partial class edit : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            try{
                if (IsPostBack == false)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["norecibo"]))
                    {
                        txtrecibono.Text = Request.QueryString["norecibo"];
                        var m = (modulo.mensaje)this.Session["mensaje"];
                        if (m != null)
                        {
                            modulo.ShowToastr(this, m.texto, "Sistema", m.tipo);
                            this.Session["mensaje"] = null;
                        }
                        //cargamos el combo de donantes.
                        var d = bd.donante.Where(c => c.estado == true)
                        .Select(c => new
                        {
                            c.id_donante,
                            c.nombre_donante
                        }).ToList();

                        //primero vamos a cargar los combo

                        cbdonantes.DataSource = d;
                        cbdonantes.DataValueField = "id_donante";
                        cbdonantes.DataTextField = "nombre_donante";
                        cbdonantes.DataBind();

                        //obtenemos la informacion del comporbante
                        var norec = int.Parse(txtrecibono.Text);

                        var r = bd.comprobante_recoleccion.Where(c => c.no_recibo == norec).FirstOrDefault();
                        txtrecibono.Text = r.no_recibo.ToString();
                        txtfecha.Text = string.Format("{0:yyyy-MM-dd}", r.fecha);
                        cbdonantes.SelectedValue = r.id_donante.ToString();
                        txtrecibidopor.Text = r.recibido_por;
                        txtentregadopor.Text = r.entregado_por;
                        txtporcuentade.Text = r.a_nombre_de;
                        txtenconceptode.Text = r.en_concepto_de;
                        //vamos a cargar el detalle del comprobante.
                        loaddetalle();
                        //habilitamos botones del detalle
                        btnadddetalle.Enabled = true;
                        btnrefresh.Enabled = true;

                    }
                    else
                    {
                        //redirigimos al index con mensaje
                        HttpContext.Current.Session["mensaje"] = new modulo.mensaje
                        {
                            texto = "El comprobante que desea cargar no existe",
                            tipo = "info"
                        };
                        Response.Redirect("index.aspx", false);
                    }
                }
            }
            catch(Exception ex)
            {
                HttpContext.Current.Session["mensaje"] = new modulo.mensaje
                {
                    texto = ex.Message.Replace("'", ""),
                    tipo = "error"
                };
                Response.Redirect("index.aspx", false);
            }
            
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                var r = int.Parse(txtrecibono.Text);
                var c = bd.comprobante_recoleccion.Where(re => re.no_recibo == r).FirstOrDefault();
                c.fecha = Convert.ToDateTime(txtfecha.Text);
                c.recibimos_de = cbdonantes.SelectedItem.Text;
                c.a_nombre_de = txtporcuentade.Text;
                c.en_concepto_de = txtenconceptode.Text;
                c.entregado_por = txtentregadopor.Text;
                c.recibido_por = txtrecibidopor.Text;
                c.id_donante = int.Parse(cbdonantes.SelectedValue);
                bd.Entry(c).State = EntityState.Modified;
                bd.SaveChanges();
                modulo.ShowToastr(this, "El comprobante de recolección se modifico exitosamente", "Sistema", "success");
            }
            catch (Exception ex)
            {
                txtfecha.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        public void loaddetalle()
        {
            try
            {
                var recibo = int.Parse(txtrecibono.Text);
                var d = (
                    from r in bd.recolecta
                    join m in bd.material on r.id_material equals m.id_material
                    where r.no_recibo == recibo
                    select new
                    {
                        r.id_recolecta,
                        m.nombre_material,
                        r.cantidad,
                        r.precio,
                        ptotal = (r.cantidad * r.precio)
                    }
                ).ToList();

                gvdetalle.DataSource = d;
                gvdetalle.DataBind();
            }
            catch (Exception ex)
            {
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        protected void btnrefresh_Click(object sender, EventArgs e)
        {
            loaddetalle();
        }

        [System.Web.Services.WebMethod]
        public static modulo.mensaje Deleterecolecta(int idrecolecta)
        {
            try
            {
                pipitosEntities bd = new pipitosEntities();

                var r = bd.recolecta.Find(idrecolecta);

                if (r == null)
                {
                    return new modulo.mensaje
                    {
                        texto = "El registro que desea eliminar no esta disponible",
                        tipo = "error"
                    };
                }

                bd.recolecta.Remove(r);
                bd.SaveChanges();

                return new modulo.mensaje
                {
                    texto = "El registro se elimino exitosamente",
                    tipo = "success"
                };
            }
            catch (Exception ex)
            {
                return new modulo.mensaje
                {
                    texto  = ex.Message,
                    tipo = "error"
                };
            }
        }
    }
}