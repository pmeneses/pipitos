using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.modales
{
    public partial class contactocreate : System.Web.UI.Page
    {

        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                var contacto = new contacto();
                contacto.nombre_contacto = txtnombrecontacto.Text;
                contacto.num_telefono = txtnumerotelefono.Text;
                contacto.correo_electronico = txtemail.Text;
                contacto.notas = txtnotas.Text;
                bd.contacto.Add(contacto);
                bd.SaveChanges();
                limpiarcampos();
                txtnombrecontacto.Focus();
                modulo.ShowToastr(this, "Registro agregado exitosamente", "Sistema", "info");
            }
            catch (Exception ex)
            {
                txtnombrecontacto.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
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