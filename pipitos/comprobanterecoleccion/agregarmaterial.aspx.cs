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
    public partial class agregarmaterial : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack == false)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["recibono"]))
                {
                    recibono.Value = Request.QueryString["recibono"];
                    //cargamos la informacion de los combobox
                    var m = bd.material.Select(c => new
                    {
                        c.id_material,
                        c.nombre_material
                    });

                    cbmaterial.DataSource = m.ToList();
                    cbmaterial.DataValueField = "id_material";
                    cbmaterial.DataTextField = "nombre_material";
                    cbmaterial.DataBind();
                    var r = int.Parse(recibono.Value);
                    lbcontador.InnerText = bd.recolecta.Where(c => c.no_recibo == r).Count().ToString();
                    cbmaterial.Focus();
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
                var rec = int.Parse(recibono.Value);
                var material = int.Parse(cbmaterial.SelectedValue);
                //vamos a buscar si el marterial agregado ya existe en el comprobante entonces 
                //vamos a aumentar la cantidad y no agregar un nuevo registro
                if (bd.recolecta.Where(c=> c.id_material == material && c.no_recibo == rec).Count() > 0)
                {
                    var rr = bd.recolecta.Where(c => c.id_material == material && c.no_recibo == rec).FirstOrDefault();
                    rr.cantidad = rr.cantidad + int.Parse(txtcantidad.Text);
                    bd.Entry(rr).State = EntityState.Modified;
                }
                else
                {
                    var r = new recolecta();
                    r.id_material = material;
                    r.no_recibo = rec;
                    r.cantidad = int.Parse(txtcantidad.Text);
                    r.precio = bd.material.Find(int.Parse(cbmaterial.SelectedValue)).precio_unitario;
                    bd.recolecta.Add(r);
                }
                bd.SaveChanges();
                cbmaterial.SelectedIndex = 0;
                txtcantidad.Text = string.Empty;
                lbcontador.InnerText = bd.recolecta.Where(c => c.no_recibo == rec).Count().ToString();
                cbmaterial.Focus();
            }
            catch(Exception ex)
            {
                cbmaterial.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }
    }
}