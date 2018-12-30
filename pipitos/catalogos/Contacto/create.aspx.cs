using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.catalogos.Contacto
{
    public partial class create : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack == false)
            {
                txtnombrecontacto
                    .Focus();
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
                    txtnombrecontacto.Focus();
                    modulo.ShowToastr(this, validador, "Sistema", "info");
                    return;
                }
                //vamos a guardar la ruta.
                var contacto = new contacto();
                contacto.nombre_contacto = txtnombrecontacto.Text;
                contacto.num_telefono = txtnumerotelefono.Text;
                contacto.correo_electronico= txtemail.Text;
                contacto.notas = txtnotas.Text;

                bd.contacto.Add(contacto);
                bd.SaveChanges();

                limpiarcampos();
                this.Session["mensaje"] = new modulo.mensaje
                {
                    texto = "El contacto ha sido agregado exitosamente",
                    tipo = "success"
                };
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (Exception ex)
            {
                txtnombrecontacto.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        private string validarcampos()
        {
            string mensaje = "";

            if (txtnombrecontacto.Text == string.Empty)
                mensaje += "Ingrese el nombre del contacto <br>";
            if (txtnumerotelefono.Text == string.Empty)
                mensaje += "Ingrese el Numero de Telefono <br>";
            if (txtemail.Text == string.Empty)
                mensaje += "Ingrese el correo electronico <br>";
            

            return mensaje;
        }

        void limpiarcampos()
        {
            txtnombrecontacto.Text = string.Empty;
            txtnumerotelefono.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtnotas.Text = string.Empty;
        }
    }
}