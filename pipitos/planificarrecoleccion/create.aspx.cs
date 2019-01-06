using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.planificarrecoleccion
{
    public partial class create : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack == false)
            {
                txtfecharegistro.Focus();
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
                if (validador != "")
                {
                    txtfecharegistro.Focus();
                    modulo.ShowToastr(this, validador, "Sistema", "info");
                    return;
                }

                var p = new planificador_recoleccion();
                p.fecha = Convert.ToDateTime(txtfecharegistro.Text);
                p.fechavisita = Convert.ToDateTime(txtfechavisita.Text);
                p.eliminada = false;

                bd.planificador_recoleccion.Add(p);
                bd.SaveChanges();
                limpiarcampos();
                this.Session["mensaje"] = new modulo.mensaje
                {
                    texto = "La planificación de recolección se creo exitosamente",
                    tipo = "success"
                };
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch(Exception ex)
            {
                txtfecharegistro.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
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

        void limpiarcampos()
        {
            txtfecharegistro.Text = string.Empty;
            txtfechavisita.Text = string.Empty;
        }
    }
}