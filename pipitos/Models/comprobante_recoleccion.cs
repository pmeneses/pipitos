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
    
    public partial class comprobante_recoleccion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public comprobante_recoleccion()
        {
            this.recolecta = new HashSet<recolecta>();
        }
    
        public int no_recibo { get; set; }
        public string recibimos_de { get; set; }
        public string a_nombre_de { get; set; }
        public string en_concepto_de { get; set; }
        public string entregado_por { get; set; }
        public string recibido_por { get; set; }
        public int id_donante { get; set; }
        public System.DateTime fecha { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<recolecta> recolecta { get; set; }
        public virtual donante donante { get; set; }
    }
}
