using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.planificarrecoleccion
{
    public partial class index : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack == false)
            {
                var m = (modulo.mensaje)this.Session["mensaje"];
                if (m != null)
                {
                    modulo.ShowToastr(this, m.texto, "Sistema", m.tipo);
                    this.Session["mensaje"] = null;
                }

                //vamos a llenar el grid con las rutas.
                var r = bd.planificador_recoleccion
                .Where(c=> c.eliminada == false)
                .Select(c => new
                {
                    numero = c.id_plan_rec,
                    fechar = c.fecha,
                    fechav = c.fechavisita,
                });

                gvplanificaciones.DataSource = r.ToList();
                gvplanificaciones.DataBind();
            }
        }

        protected void btnnewplanificacion_Click(object sender, EventArgs e)
        {
            Response.Redirect("create.aspx");
        }

        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
            var index = e.CommandArgument.ToString();
            var idplanificacion = gvplanificaciones.DataKeys[int.Parse(index)].Values["numero"];
            Response.Redirect("edit.aspx?idplanificacion=" + idplanificacion);
        }

        protected void gvplanificaciones_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            for (int i = 0; i < e.Row.Cells.Count; i++)
            {
                e.Row.Cells[i].ToolTip = e.Row.Cells[i].Text;
            }
        }
    }
}