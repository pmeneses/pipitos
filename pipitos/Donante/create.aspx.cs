﻿using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.Donante
{
    public partial class create : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();

        private void llenarentidad(int idcategoriadon)
        {
            var entidad = bd.entidad.Where(c => c.id_categoriadon == idcategoriadon).ToList();
            cbentidad.DataSource = entidad;
            cbentidad.DataValueField = "id";
            cbentidad.DataTextField = "Nombre";
            cbentidad.DataBind();
        }
        private void llenarcombobox()
        {
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

            var entidad = bd.entidad.ToList();
            cbentidad.DataSource = entidad;
            cbentidad.DataValueField = "id";
            cbentidad.DataTextField = "Nombre";
            cbentidad.DataBind();

            var periocidad = bd.periocidad.ToList();
            cbperiocidad.DataSource = periocidad;
            cbperiocidad.DataValueField = "idperiocidad";
            cbperiocidad.DataTextField = "descripcion";
            cbperiocidad.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var doncat = new donante_categoria();

            if (this.IsPostBack == false)
            {
                txtfecharegistro.Focus();
                var m = (modulo.mensaje)this.Session["mensaje"];
                if (m != null)
                {
                    modulo.ShowToastr(this, m.texto, "Sistema", m.tipo);
                    this.Session["mensaje"] = null;
                }

                llenarcombobox();
                cbcategoria.SelectedValue = doncat.id_categoriadon.ToString();
                cbcategoria_SelectedIndexChanged(null, null);

            }


        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                //vamos a validar los campos
                var validador = validarcampos();
                if (validador != "")
                {
                    txtfecharegistro.Focus();
                    modulo.ShowToastr(this, validador, "Sistema", "info");
                    return;
                }

                //vamos a guardar el donante
                var donante = new donante();
                var doncat = new donante_categoria();


                donante.fecha_ingreso = Convert.ToDateTime(txtfecharegistro.Text);
                donante.nombre_donante = txtnombredonante.Text;
                donante.gerente = txtgerente.Text;
                donante.direccion = txtdireccion.Text;
                //cbcategoria.SelectedValue = doncat.id_categoriadon.ToString();
                //cbcategoria_SelectedIndexChanged(null, null);
                donante.id_contacto = int.Parse(cbcontacto.SelectedValue);
                donante.identidad = int.Parse(cbentidad.SelectedValue);
                donante.estado = true;
                donante.direccion = txtdireccion.Text;
                donante.id_ruta = int.Parse(cbruta.SelectedValue);
                donante.idperiocidad = int.Parse(cbperiocidad.SelectedValue);



                bd.donante.Add(donante);
                bd.SaveChanges();

                limpiarcampos();
                this.Session["mensaje"] = new modulo.mensaje
                {
                    texto = "El contacto ha sido agregado exitosamente",
                    tipo = "success"
                };
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (Exception ex)
            {
                txtfecharegistro.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }

        }

        private string validarcampos()
        {
            string mensaje = "";

            if (txtfecharegistro.Text == string.Empty)
                mensaje += "Ingrese la fecha de registro <br>";
            //if (txtfechavisita.Text == string.Empty)
            //mensaje += "Ingrese la fecha de visita <br>";

            return mensaje;
        }

        void limpiarcampos()
        {
            txtfecharegistro.Text = string.Empty;
            //txtfechavisita.Text = string.Empty;
        }

        protected void btncancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void cbcategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            llenarentidad(int.Parse(cbcategoria.SelectedItem.Value));
            if (cbcategoria.SelectedIndex == 0)
            {
                //cbcontacto.Visible = false;
                //cbcontacto.SelectedItem.Text = "";
                cbcontacto.Enabled = false;
                txtgerente.Enabled = false;
                cbruta.Enabled = false;
                txtdireccion.Enabled = false;
                
                
            }
            else{
                //cbcontacto.Visible = true;
                cbcontacto.Enabled = true;
                txtgerente.Enabled = true;
                cbruta.Enabled = true;
                txtdireccion.Enabled = true;
            }

        }

    }
}