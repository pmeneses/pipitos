using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.modales
{
    public partial class categioriadoncreate : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            txtnombre.Focus();
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                var datos = new donante_categoria();
                datos.tipo_donante = txtnombre.Text;
                bd.donante_categoria.Add(datos);
                bd.SaveChanges();
                txtnombre.Focus();
                modulo.ShowToastr(this,"Registro agregado exitosamente", "Sistema", "info");
            }
            catch(Exception ex)
            {
                txtnombre.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }
    }
}