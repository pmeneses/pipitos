//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace pipitos.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class donante
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public donante()
        {
            this.planificar_donante = new HashSet<planificar_donante>();
            this.comprobante_recoleccion = new HashSet<comprobante_recoleccion>();
        }
    
        public int id_donante { get; set; }
        public int id_contacto { get; set; }
        public int identidad { get; set; }
        public System.DateTime fecha_ingreso { get; set; }
        public string nombre_donante { get; set; }
        public string gerente { get; set; }
        public bool estado { get; set; }
        public string direccion { get; set; }
        public int id_ruta { get; set; }
        public int idperiocidad { get; set; }
    
        public virtual contacto contacto { get; set; }
        public virtual rutas rutas { get; set; }
        public virtual entidad entidad { get; set; }
        public virtual periocidad periocidad { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<planificar_donante> planificar_donante { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<comprobante_recoleccion> comprobante_recoleccion { get; set; }
    }
}
