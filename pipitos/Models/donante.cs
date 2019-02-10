//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
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
            this.comprobante_recoleccion = new HashSet<comprobante_recoleccion>();
            this.planificar_donante = new HashSet<planificar_donante>();
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
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<comprobante_recoleccion> comprobante_recoleccion { get; set; }
        public virtual contacto contacto { get; set; }
        public virtual rutas rutas { get; set; }
        public virtual entidad entidad { get; set; }
        public virtual periocidad periocidad { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<planificar_donante> planificar_donante { get; set; }
    }
}
