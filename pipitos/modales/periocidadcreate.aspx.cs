using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.modales
{
    public partial class periocidadcreate : System.Web.UI.Page
    {

        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                var p = new periocidad();
                p.descripcion = txtnombre.Text;
                p.activa = ckactiva.Checked;
                bd.periocidad.Add(p);
                bd.SaveChanges();
                limpiarcampos();
                txtnombre.Focus();
                modulo.ShowToastr(this, "Registro agregado exitosamente", "Sistema", "info");
            }
            catch (Exception ex)
            {
                txtnombre.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        private void limpiarcampos()
        {
            txtnombre.Text = string.Empty;
            ckactiva.Checked = false;
        }
    }
}