using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.controlusuarios
{
    public partial class create : System.Web.UI.Page
    {
        pipitosEntities bd = new pipitosEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                var m = (modulo.mensaje)this.Session["mensaje"];
                if (m != null)
                {
                    modulo.ShowToastr(this, m.texto, "Sistema", m.tipo);
                    this.Session["mensaje"] = null;
                }

                var suc = bd.Sucursal.Select(s => new
                {
                    idsucursal=s.id,
                    nombresucursal=s.nombre
                }).ToList();
                cbsucursal.DataSource = suc;
                cbsucursal.DataTextField = "nombresucursal";
                cbsucursal.DataValueField = "idsucursal";
                cbsucursal.DataBind();

                cbsucursal.SelectedIndex = -1;
            }
        }

        private void limpiarcampos()
        {
            txtcodigo.Text = string.Empty;
            txtnombres.Text = string.Empty;
            txtapellido.Text = string.Empty;
            cbsucursal.SelectedValue = null;
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try{

                //vamos a validar que el nombre de usuario no exista
                if(bd.AspNetUsers.Where(us => us.UserName == txtcodigo.Text).ToList().Count > 0)
                {
                    txtcodigo.Focus();
                    modulo.ShowToastr(this, "Ya existe un usuario con el codigo especificado", "Sistema", "error");
                    return;
                }
                var pass = bd.variables.Where(v => v.nombre == "PASSDEFAULT").FirstOrDefault().descripcion;

                var u = new AspNetUsers();
                Guid obj = Guid.NewGuid();

                u.Id = obj.ToString();
                u.Email = txtcodigo.Text;
                u.EmailConfirmed = false;
                u.PhoneNumberConfirmed = false;
                u.TwoFactorEnabled = false;
                u.LockoutEnabled = false;
                u.AccessFailedCount = 0;
                u.UserName = txtcodigo.Text;
                u.idsucursal = int.Parse(cbsucursal.SelectedValue);
                u.activo = ckactivo.Checked;
                u.nombre = txtnombres.Text;
                u.apellido = txtapellido.Text;
                u.PasswordHash = pass;

                bd.AspNetUsers.Add(u);
                bd.SaveChanges();
                limpiarcampos();
                this.Session["mensaje"] = new modulo.mensaje
                {
                    texto = "El usuario se creo correctamente",
                    tipo = "success"
                };
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch(Exception ex)
            {
                txtcodigo.Focus();
                modulo.ShowToastr(this, ex.Message.Replace("'", ""), "Sistema", "error");
            }
        }
    }
}