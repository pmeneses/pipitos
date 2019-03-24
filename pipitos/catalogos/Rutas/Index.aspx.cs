using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.catalogos.Rutas
{
    public partial class Index : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(this.IsPostBack == false)
            {
                var m = (modulo.mensaje)this.Session["mensaje"];
                if (m != null)
                {
                    modulo.ShowToastr(this, m.texto, "Sistema", m.tipo);
                    this.Session["mensaje"] = null;
                }

                //vamos a llenar el grid con las rutas.
                var r = bd.rutas.Select(c => new
                {
                    Ruta = c.nombre_ruta,
                    Departamento = c.departamento,
                    Municipio = c.municipio,
                    Distrito = c.distrito,
                    Idruta = c.id_ruta,
                    Barrio = c.barrio
                });

                gvrutas.DataSource = r.ToList();
                gvrutas.DataBind();
            }
        }

        protected void btnnewruta_Click(object sender, EventArgs e)
        {
            Response.Redirect("create.aspx");
        }

        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
            var index = e.CommandArgument.ToString();
            var idruta = gvrutas.DataKeys[int.Parse(index)].Values["Idruta"];
            Response.Redirect("Edit.aspx?idruta=" + idruta);
        }

        [System.Web.Services.WebMethod]
        public static modulo.mensaje DeleteClick(int idruta)
        {
            try
            {
                pipitosEntities bd = new pipitosEntities();

                var r = bd.rutas.Find(idruta);

                if (r == null)
                {
                    return new modulo.mensaje
                    {
                        texto = "La ruta que desea eliminar no esta disponible",
                        tipo = "error"
                    };
                }

                bd.rutas.Remove(r);
                bd.SaveChanges();

                HttpContext.Current.Session["mensaje"] = new modulo.mensaje
                {
                    texto = "La ruta se elimino exitosamente",
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

        protected void gvrutas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            for (int i = 0; i < e.Row.Cells.Count; i++)
            {
                e.Row.Cells[i].ToolTip = e.Row.Cells[i].Text;
            }
        }

        protected void btnActualizar_ServerClick(object sender, EventArgs e)
        {
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
    }
}