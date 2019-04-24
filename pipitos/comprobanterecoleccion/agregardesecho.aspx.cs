using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.comprobanterecoleccion
{
    public partial class agregardesecho : System.Web.UI.Page
    {

        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["recibono"]) && !string.IsNullOrEmpty(Request.QueryString["idrecolecta"]))
                {
                    recibono.Value = Request.QueryString["recibono"];
                    idrecolecta.Value = Request.QueryString["idrecolecta"];
                    var idreco = int.Parse(idrecolecta.Value);
                    idmaterial.Value = bd.recolecta.Where(c => c.id_recolecta == idreco).FirstOrDefault().id_material.ToString();
                    var r = int.Parse(idmaterial.Value);
                    lbmaterial.InnerText = bd.material.Where(c => c.id_material == r).FirstOrDefault().nombre_material;
                    txtcantidad.Focus();
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
                //vamos a validar que si la cantidad del material ya es 0 entonces no permita desechar nada.
                //var rec = int.Parse(recibono.Value);
                var recolecta = int.Parse(idrecolecta.Value);
                if (bd.recolecta.Where(c => c.id_recolecta == recolecta).FirstOrDefault().cantidad < int.Parse(txtcantidad.Text))
                {
                    txtcantidad.Focus();
                    modulo.ShowToastr(this, "La cantidad ingresada no debe ser mayor a la cantidad recolectada", "Sistema", "error");
                    return;
                }

                if (bd.recolecta.Where(c=> c.id_recolecta == recolecta).FirstOrDefault().cantidad > 0)
                {
                    var r = new ComprobanteDesecho();
                    var rec = int.Parse(recibono.Value);
                    r.norecibo = int.Parse(recibono.Value);
                    r.idmaterial = int.Parse(idmaterial.Value);
                    r.cantidad = int.Parse(txtcantidad.Text);
                    r.fecha = DateTime.Now;
                    bd.ComprobanteDesecho.Add(r);

                    var rr = bd.recolecta.Where(c => c.id_recolecta == recolecta).FirstOrDefault();
                    rr.cantidad = rr.cantidad - int.Parse(txtcantidad.Text);
                    bd.Entry(rr).State = EntityState.Modified;

                    bd.SaveChanges();
                    txtcantidad.Text = string.Empty;
                    txtcantidad.Focus();
                }
                else
                {
                    txtcantidad.Focus();
                    modulo.ShowToastr(this, "No hay existencias disponibles para desechar", "Sistema", "error");
                }
            }
            catch (Exception ex)
            {
                txtcantidad.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }
    }
}