using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.comprobanterecoleccion
{
    public partial class create : System.Web.UI.Page
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

                var d = bd.donante.Where(c => c.estado == true)
                .Select(c => new
                {
                    c.id_donante,
                    c.nombre_donante
                }).ToList();

                cbdonantes.DataSource = d;
                cbdonantes.DataValueField = "id_donante";
                cbdonantes.DataTextField = "nombre_donante";
                cbdonantes.DataBind();
                loaddetalle();
            }
        }

        public void loaddetalle()
        {
            try{
                var recibo = int.Parse(txtrecibono.Text == "" ? "0" : txtrecibono.Text);
                var d = (
                    from r in bd.recolecta
                    join m in bd.material on r.id_material equals m.id_material
                    where r.no_recibo == recibo
                    select new
                    {
                        r.id_recolecta,
                        m.nombre_material,
                        r.cantidad,
                        r.precio,
                        ptotal = (r.cantidad * r.precio)
                    }
                ).ToList();

                gvdetalle.DataSource = d;
                gvdetalle.DataBind();
            }
            catch(Exception ex)
            {
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                var p = new comprobante_recoleccion();
                p.no_recibo = int.Parse(txtrecibono.Text);
                p.fecha = Convert.ToDateTime(txtfecha.Text);
                p.recibimos_de = cbdonantes.SelectedItem.Text;
                p.a_nombre_de = txtporcuentade.Text;
                p.en_concepto_de = txtenconceptode.Text;
                p.entregado_por = txtentregadopor.Text;
                p.recibido_por = txtrecibidopor.Text;
                p.id_donante = int.Parse(cbdonantes.SelectedValue);
                bd.comprobante_recoleccion.Add(p);
                bd.SaveChanges();
                modulo.ShowToastr(this, "El comprobante de recolección se creo exitosamente", "Sistema", "success");
                btnguardar.Enabled = false;
                btncancelar.Enabled = false;
                txtrecibono.Enabled = false;
                txtfecha.Enabled = false;
                cbdonantes.Enabled = false;
                txtrecibidopor.Enabled = false;
                txtentregadopor.Enabled = false;
                txtenconceptode.Enabled = false;
                btnadddetalle.Enabled = true;
                btnrefresh.Enabled = true;
            }
            catch (Exception ex)
            {
                txtrecibono.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        protected void btnadddetalle_Click(object sender, EventArgs e)
        {
            string url = "agregarmaterial.aspx?recibono=" + txtrecibono.Text;
            string s = "window.open('" + url + "', 'popup_window', 'status=no,width=500,height=500,left=200,top=200, menubar=no,toolbar=no,location=no, resizable=no');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }

        protected void btnrefresh_Click(object sender, EventArgs e)
        {
            loaddetalle();
        }

        protected void gvdetalle_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            for (int i = 0; i < e.Row.Cells.Count; i++)
            {
                e.Row.Cells[i].ToolTip = e.Row.Cells[i].Text;
            }
        }
    }
}