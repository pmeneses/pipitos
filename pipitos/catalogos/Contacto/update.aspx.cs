using pipitos.Models;
using System.Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.catalogos.Contacto
{
    public partial class update : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack == false)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["idcontacto"]))
                {
                    idcontacto.Value = Request.QueryString["idcontacto"];
                    var r = bd.contacto.Find(int.Parse(idcontacto.Value));
                    if (r != null)
                    {
                        txtnombre.Text = r.nombre_contacto;
                        txtnumtelefono.Text = r.num_telefono;
                        txtemail.Text = r.correo_electronico;
                        txtnota.Text = r.notas;
                        var m = (modulo.mensaje)this.Session["mensaje"];
                        if (m != null)
                        {
                            modulo.ShowToastr(this, m.texto, "Sistema", m.tipo);
                            this.Session["mensaje"] = null;
                        }
                    }
                }
                else
                {
                    this.Session["mensaje"] = new modulo.mensaje
                    {
                        texto="El contacto al que quiere acceder no existe",
                        tipo ="error"
                    };
                    Response.Redirect("index.aspx");
                }

            }
            else
            {
                //redirigimos a pagina de error.
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
                    txtnombre.Focus();
                    modulo.ShowToastr(this, validador, "Sistema", "info");
                    return;
                }
                //vamos a actualizar el contacto.
                var r = bd.contacto.Find(int.Parse(idcontacto.Value));

                r.nombre_contacto = txtnombre.Text;
                r.num_telefono = txtnumtelefono.Text;
                r.correo_electronico = txtemail.Text;
                r.notas = txtnota.Text;
                bd.Entry(r).State = EntityState.Modified;
                bd.SaveChanges();
                limpiarcampos();
                this.Session["mensaje"] = new modulo.mensaje
                {
                    texto = "Contacto actualizado exitosamente",
                    tipo = "success"
                };
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (Exception ex)
            {
                txtnombre.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }
            private string validarcampos()
            {
                string mensaje = "";

                if (txtnombre.Text == string.Empty)
                    mensaje += "Ingrese el nombre del contacto <br>";
                if (txtnumtelefono.Text == string.Empty)
                    mensaje += "Ingrese el numero de telefono <br>";
                if (txtemail.Text == string.Empty)
                    mensaje += "Ingrese el correo electronico <br>";
                if (txtnota.Text == string.Empty)
                    mensaje += "Ingrese Nota <br>";
         
                return mensaje;
            }

            void limpiarcampos()
            {
                txtnombre.Text = string.Empty;
                txtnumtelefono.Text = string.Empty;
                txtemail.Text = string.Empty;
                txtnota.Text = string.Empty;
            }

        }
    }