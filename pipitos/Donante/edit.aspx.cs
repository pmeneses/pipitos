using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pipitos.Models;

namespace pipitos.Donante
{
    public partial class edit : System.Web.UI.Page
    {

        pipitosEntities bd = new pipitosEntities();


        private void llenarentidad(int idcategoriadon)
        {
            var entidad = bd.entidad.Where(c=> c.id_categoriadon == idcategoriadon).ToList();
            cbentidad.DataSource = entidad;
            cbentidad.DataValueField = "id";
            cbentidad.DataTextField = "Nombre";
            cbentidad.DataBind();
        }

        private void llernarcombobox() {
            var ruta = bd.rutas.ToList();
            cbruta.DataSource = ruta;
            cbruta.DataValueField = "id_ruta";
            cbruta.DataTextField = "nombre_ruta";
            cbruta.DataBind();

            var cat = bd.donante_categoria.ToList();
            cbcategoria.DataSource = cat;
            cbcategoria.DataValueField = "id_categoriadon";
            cbcategoria.DataTextField = "tipo_donante";
            cbcategoria.DataBind();

            var contacto = bd.contacto.ToList();
            cbcontacto.DataSource = contacto;
            cbcontacto.DataValueField = "id_contacto";
            cbcontacto.DataTextField = "nombre_contacto";
            cbcontacto.DataBind();

            var periocidad = bd.periocidad.ToList();
            cbperiocidad.DataSource = periocidad;
            cbperiocidad.DataValueField = "idperiocidad";
            cbperiocidad.DataTextField = "descripcion";
            cbperiocidad.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["iddonante"]))
                {
                    iddonante.Value = Request.QueryString["iddonante"];
                    var r = bd.donante.Find(int.Parse(iddonante.Value));
                    if (r != null)
                    {
                        llernarcombobox();
                        txtfecharegistro.Text = string.Format("{0:yyyy-MM-dd}", r.fecha_ingreso);
                        txtnombredon.Text = r.nombre_donante;
                        txtgerente.Text = r.gerente;
                        txtdireccion.Text = r.direccion;
                        cbcategoria.SelectedValue = r.entidad.donante_categoria.id_categoriadon.ToString();
                        cbcategoria_SelectedIndexChanged(null, null);
                        cbruta.SelectedValue = r.id_ruta.ToString();
                        cbperiocidad.SelectedValue = r.idperiocidad.ToString();
                        cbcontacto.SelectedValue = r.id_contacto.ToString();
                        cbentidad.SelectedValue = r.identidad.ToString();


                        var m = (modulo.mensaje)this.Session["mensaje"];
                        if (m != null)
                        {
                            modulo.ShowToastr(this, m.texto, "Sistema", m.tipo);
                            this.Session["mensaje"] = null;
                        }
                    }
                    else
                    {
                        this.Session["mensaje"] = new modulo.mensaje
                        {
                            texto = "El donante al que quiere acceder no existe",
                            tipo = "error"
                        };
                        Response.Redirect("index.aspx");
                    }
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
                var r = int.Parse(iddonante.Value);
                var c = bd.donante.Where(re => re.id_donante == r).FirstOrDefault();
                c.fecha_ingreso = Convert.ToDateTime(txtfecharegistro.Text);
                c.nombre_donante = txtnombredon.Text;
                c.identidad = int.Parse(cbentidad.SelectedValue);
                c.id_ruta = int.Parse(cbruta.SelectedValue);
                c.gerente = txtgerente.Text;
                c.id_contacto = int.Parse(cbcontacto.SelectedValue);
                c.idperiocidad = int.Parse(cbperiocidad.SelectedValue);
                c.direccion = txtdireccion.Text;
                bd.Entry(c).State = EntityState.Modified;
                bd.SaveChanges();
                modulo.ShowToastr(this, "El donante se modifico exitosamente", "Sistema", "success");
            }
            catch (Exception ex)
            {
                txtfecharegistro.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }

        protected void cbcategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            llenarentidad(int.Parse(cbcategoria.SelectedItem.Value));
        }
    }
}