using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.comprobanterecoleccion
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

                //vamos a llenar el grid del comprobante de recoleccion
                var r = bd.comprobante_recoleccion.Select(c => new
                {
                   norecibo = c.no_recibo,
                   c.fecha,
                   recibimosde = c.recibimos_de,
                   enconceptode = c.en_concepto_de,
                   recibidopor = c.recibido_por
                });

                gvcomprobantes.DataSource = r.ToList();
                gvcomprobantes.DataBind();
            }
        }

        protected void btnnewcomprobante_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("create.aspx");
        }

        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
            var index = e.CommandArgument.ToString();
            var norecibo = gvcomprobantes.DataKeys[int.Parse(index)].Values["norecibo"];
            Response.Redirect("Edit.aspx?norecibo=" + norecibo);
        }
    }
}