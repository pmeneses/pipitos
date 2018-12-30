using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.catalogos.Rutas
{
    public partial class Edit : System.Web.UI.Page
    {

        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(this.IsPostBack == false)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["idruta"]))
                {
                    idruta.Value = Request.QueryString["idruta"];
                    //vamos a cargar la informacion de la ruta.
                    var r = bd.rutas.Find(int.Parse(idruta.Value));
                    if(r!= null)
                    {
                        txtnombreruta.Text = r.nombre_ruta;
                        txtdepartamento.Text = r.departamento;
                        txtmunicipio.Text = r.municipio;
                        txtdistrito.Text = r.distrito;
                        txtbarrio.Text = r.barrio;
                        txtnombreruta.Focus();
                        var m = (modulo.mensaje)this.Session["mensaje"];
                        if (m != null)
                        {
                            modulo.ShowToastr(this, m.texto, "Sistema", m.tipo);
                            this.Session["mensaje"] = null;
                        }
                    }
                    else
                    {
                        this.Session["mensaje"] = new modulo.mensaje
                        {
                            texto = "La ruta a la que quiere acceder no existe",
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
                    txtnombreruta.Focus();
                    modulo.ShowToastr(this, validador, "Sistema", "info");
                    return;
                }
                //vamos a actualizar la ruta.
                var r = bd.rutas.Find(int.Parse(idruta.Value));
                r.nombre_ruta = txtnombreruta.Text;
                r.municipio = txtmunicipio.Text;
                r.departamento = txtdepartamento.Text;
                r.distrito = txtdistrito.Text;
                r.barrio = txtbarrio.Text;
                bd.Entry(r).State = EntityState.Modified;
                bd.SaveChanges();
                limpiarcampos();
                this.Session["mensaje"] = new modulo.mensaje
                {
                        texto = "Ruta actualizada exitosamente",
                        tipo = "success"
                };
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (Exception ex)
            {
                txtnombreruta.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        private string validarcampos()
        {
            string mensaje = "";

            if (txtnombreruta.Text == string.Empty)
                mensaje += "Ingrese el nombre de la ruta <br>";
            if (txtdepartamento.Text == string.Empty)
                mensaje += "Ingrese el departamento <br>";
            if (txtmunicipio.Text == string.Empty)
                mensaje += "Ingrese el municipio <br>";
            if (txtdistrito.Text == string.Empty)
                mensaje += "Ingrese el distrito <br>";
            if (txtbarrio.Text == string.Empty)
                mensaje += "Ingrese el barrio <br>";

            return mensaje;
        }

        void limpiarcampos()
        {
            txtnombreruta.Text = string.Empty;
            txtmunicipio.Text = string.Empty;
            txtdepartamento.Text = string.Empty;
            txtdistrito.Text = string.Empty;
            txtbarrio.Text = string.Empty;
        }
    }
}