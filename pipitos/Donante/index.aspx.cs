using pipitos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pipitos.Donante
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

                //vamos a llenar el grid con las rutas.
                //var r = bd.donante
                //.Where(c => c.estado == true)
                //.Select(c => new
                //{
                //    iddonante = c.id_donante,
                //    fechaing = c.fecha_ingreso,
                //    nombredon = c.nombre_donante,
                //    tipoent = c.id_categoriadon,
                //    gerente = c.gerente,
                //    contacto = c.id_contacto,
                //    estado = c.estado,
                //    direccion = c.direccion,
                //    ruta = c.id_ruta,
                //    peridon = c.periodicidad_donacion,
                //});

                var result = (
                         from d in bd.donante
                         join dc in bd.donante_categoria on d.id_categoriadon equals dc.id_categoriadon
                         join c in bd.contacto on d.id_contacto equals c.id_contacto
                         join p in bd.periocidad on d.idperiocidad equals p.idperiocidad
                         join r in bd.rutas on d.id_ruta equals r.id_ruta
                         where d.estado == true
                         select new {
                            iddonante = d.id_donante,
                            fechaing = d.fecha_ingreso,
                            nombredon = d.nombre_donante,
                            categoriadon = dc.tipo_donante,
                            gerente = d.gerente,
                            contacto = c.nombre_contacto,
                            estado = d.estado,
                            direccion = d.direccion,
                            preciodidad = p.descripcion,
                            ruta = r.nombre_ruta
                         }).ToList();

                gvdonante.DataSource = result;
                gvdonante.DataBind();
               
            }
        }

        protected void btnNewDonante_Click(object sender, EventArgs e)
        {

        }
    }
}