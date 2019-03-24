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
    public partial class cambiarsucursal : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["idusuario"]))
                {
                    idusuario.Value = Request.QueryString["idusuario"];
                    //cargamos la informacion de los combobox
                    var suc = bd.Sucursal.Select(s => new
                    {
                        s.id,
                        s.nombre
                    }).ToList();
                    cbsucursales.DataSource = suc;
                    cbsucursales.DataTextField = "nombre";
                    cbsucursales.DataValueField = "id";
                    cbsucursales.DataBind();
                }
                else
                {
                    //redirigimos a pagina de error.
                }
            }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                var user = bd.AspNetUsers.Find(idusuario.Value);
                user.idsucursal = int.Parse(cbsucursales.SelectedValue);
                bd.Entry(user).State = EntityState.Modified;
                bd.SaveChanges();
                modulo.ShowToastr(this, "La operación se realizo exitosamente", "Sistema", "success");
            }
            catch(Exception ex)
            {
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }
    }
}