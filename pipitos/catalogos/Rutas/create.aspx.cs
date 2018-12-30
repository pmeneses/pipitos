using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.catalogos.Rutas
{
    public partial class create : System.Web.UI.Page
    {

        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(this.IsPostBack == false)
            {
                txtnombreruta.Focus();
                var m = (modulo.mensaje)this.Session["mensaje"];
                if (m != null)
                {
                    modulo.ShowToastr(this, m.texto, "Sistema", m.tipo);
                    this.Session["mensaje"] = null;
                }
            }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                //vamos a validar los campos
                var validador = validarcampos();
                if(validador != "")
                {
                    txtnombreruta.Focus();
                    modulo.ShowToastr(this, validador, "Sistema", "info");
                    return;
                }
                //vamos a guardar la ruta.
                var ruta = new rutas();
                ruta.nombre_ruta = txtnombreruta.Text;
                ruta.municipio = txtmunicipio.Text;
                ruta.departamento = txtdepartamento.Text;
                ruta.distrito = txtdistrito.Text;
                ruta.barrio = txtbarrio.Text;
                bd.rutas.Add(ruta);
                bd.SaveChanges();
                limpiarcampos();
                this.Session["mensaje"] = new modulo.mensaje
                {
                    texto = "Ruta guardada exitosamente",
                    tipo = "success"
                };
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch(Exception ex)
            {
                txtnombreruta.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'",""), "Sistema", "error");
            }
        }

        private string validarcampos(){
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