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
    
    public partial class entidad
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public entidad()
        {
            this.donante = new HashSet<donante>();
        }
    
        public int id { get; set; }
        public int id_categoriadon { get; set; }
        public string Nombre { get; set; }
        public bool Activo { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<donante> donante { get; set; }
        public virtual donante_categoria donante_categoria { get; set; }
    }
}
