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
    
    public partial class planificar_donante
    {
        public int id_planificar_don { get; set; }
        public int id_donante { get; set; }
        public int id_ruta { get; set; }
        public int id_plan_rec { get; set; }
        public System.DateTime fecha_registro { get; set; }
        public Nullable<bool> visitarealizada { get; set; }
        public string observaciones { get; set; }
    
        public virtual donante donante { get; set; }
        public virtual planificador_recoleccion planificador_recoleccion { get; set; }
        public virtual rutas rutas { get; set; }
    }
}
