using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.catalogos.Contacto
{
    public partial class index : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            //vamos a llenar el grid con las rutas.
            var r = bd.contacto.Select(c => new
            {
               idcontacto = c.id_contacto,
                Nombre = c.nombre_contacto,
                Telefono = c.num_telefono,
                Correo  = c.correo_electronico
            }).ToList();

            gvcontacto.DataSource = r;
            gvcontacto.DataBind();
        }

        protected void btnNewContact_Click(object sender, EventArgs e)
        {
            Response.Redirect("create.aspx");
        }
    }
}