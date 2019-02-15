using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.modales
{
    public partial class rutascreate : System.Web.UI.Page
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
                var datos = new rutas();
                datos.nombre_ruta = txtnombre.Text;
                datos.municipio = txtmunicipio.Text;
                datos.departamento = txtdepartamento.Text;
                datos.distrito = txtdistrito.Text;
                datos.barrio = txtbarrio.Text;
                bd.rutas.Add(datos);
                bd.SaveChanges();
                txtnombre.Focus();
                modulo.ShowToastr(this, "Registro agregado exitosamente", "Sistema", "info");
            }
            catch (Exception ex)
            {
                txtnombre.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }
    }
}