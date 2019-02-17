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
            //vamos a llenar el grid con las contactos.
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

        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
            var index = e.CommandArgument.ToString();
            var idcontacto = gvcontacto.DataKeys[int.Parse(index)].Values["idcontacto"];
            Response.Redirect("update.aspx?idcontacto=" + idcontacto);
        }

        [System.Web.Services.WebMethod]
        public static modulo.mensaje DeleteClick(int idcontacto)
        {
            try
            {
                pipitosEntities bd = new pipitosEntities();

                var r = bd.contacto.Find(idcontacto);

                if (r == null)
                {
                    return new modulo.mensaje
                    {
                        texto = "El contacto que desea eliminar no esta disponible",
                        tipo = "error"
                    };
                }

                bd.contacto.Remove(r);
                bd.SaveChanges();

                HttpContext.Current.Session["mensaje"] = new modulo.mensaje
                {
                    texto = "El contacto se elimino exitosamente",
                    tipo = "success"
                };

                //solo usamos esto para retornar un valor pero lo que en realidad se muestra es lo seteado en la variable de sesion
                //porque se vuelve a recarga la pagina desde el java script
                return new modulo.mensaje
                {
                    texto = "nada",
                    tipo = "success"
                };
            }
            catch (Exception ex)
            {
                return new modulo.mensaje
                {
                    texto = ex.Message,
                    tipo = "error"
                };
            }
        }

        protected void gvcontacto_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            for (int i = 0; i < e.Row.Cells.Count; i++)
            {
                e.Row.Cells[i].ToolTip = e.Row.Cells[i].Text;
            }
        }
    }
}