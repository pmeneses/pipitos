using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.controlusuarios
{
    public partial class index : System.Web.UI.Page
    {

        pipitosEntities bd = new pipitosEntities();

        private void cargarusuarios()
        {
            var busuarios = (from u in bd.AspNetUsers
                             join s in bd.Sucursal on u.idsucursal equals s.id
                             select new
                             {
                                 u.Id,
                                 usuario = u.UserName,
                                 sucursal = s.nombre,
                                 activo = u.activo == true ? "SI" : "NO",
                                 u.nombre,
                                 u.apellido
                             }).ToList();

            gvusuarios.DataSource = busuarios;
            gvusuarios.DataBind();

            //vamos a validar si mostramos el boton de marcar como visita realizada.
            for (int row = 0; row < busuarios.Count; row++)
            {
                GridViewRow gvr1 = (GridViewRow)gvusuarios.Rows[row];
                LinkButton btnactivar = (LinkButton)gvr1.FindControl("btnactivar");
                LinkButton btndesactivar = (LinkButton)gvr1.FindControl("btndesactivar");
                if (busuarios[row].activo == "SI")
                {
                    btnactivar.Visible = false;
                    btndesactivar.Visible = true;
                }
                else
                {
                    btnactivar.Visible = true;
                    btndesactivar.Visible = false;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                cargarusuarios();         
            }
        }

        protected void btnnewuser_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("create.aspx");
        }

        protected void btnactivar_Command(object sender, CommandEventArgs e)
        {
            try
            {
                var index = e.CommandArgument.ToString();
                var iduser = gvusuarios.DataKeys[int.Parse(index)].Values["Id"];
                var detalle = bd.AspNetUsers.Find(iduser);
                detalle.activo = true;
                bd.Entry(detalle).State = EntityState.Modified;
                bd.SaveChanges();
                modulo.ShowToastr(this, "La operación se realizo exitosamente", "Sistema", "success");
                cargarusuarios();
            }
            catch (Exception ex)
            {
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        protected void btndesactivar_Command(object sender, CommandEventArgs e)
        {
            try
            {
                var index = e.CommandArgument.ToString();
                var iduser = gvusuarios.DataKeys[int.Parse(index)].Values["Id"];
                var detalle = bd.AspNetUsers.Find(iduser);
                detalle.activo = false;
                bd.Entry(detalle).State = EntityState.Modified;
                bd.SaveChanges();
                modulo.ShowToastr(this, "La operación se realizo exitosamente", "Sistema", "success");
                cargarusuarios();
            }
            catch (Exception ex)
            {
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        protected void gvusuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //este evento se agrega para que no de error cuando se da en el boton editar.
        }

        protected void gvusuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            for (int i = 0; i < e.Row.Cells.Count; i++)
            {
                e.Row.Cells[i].ToolTip = e.Row.Cells[i].Text;
            }
        }
    }
}