using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.modales
{
    public partial class entidadescreate : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            //vamos a cargar las categorias
            var c = bd.donante_categoria.Select(cc => new {
                cc.id_categoriadon, cc.tipo_donante
            }).ToList();
            cbcategoria.DataSource = c;
            cbcategoria.DataValueField = "id_categoriadon";
            cbcategoria.DataTextField = "tipo_donante";
            cbcategoria.DataBind();
            txtnombre.Focus();

        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                var datos = new entidad();
                datos.id_categoriadon = int.Parse(cbcategoria.SelectedItem.Value);
                datos.Nombre = txtnombre.Text;
                datos.Activo = true;
                bd.entidad.Add(datos);
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