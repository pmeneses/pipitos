﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class pipitosEntities : DbContext
    {
        public pipitosEntities()
            : base("name=pipitosEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<rutas> rutas { get; set; }
        public virtual DbSet<contacto> contacto { get; set; }
        public virtual DbSet<comprobante_recoleccion> comprobante_recoleccion { get; set; }
        public virtual DbSet<planificador_recoleccion> planificador_recoleccion { get; set; }
        public virtual DbSet<planificar_donante> planificar_donante { get; set; }
        public virtual DbSet<donante_categoria> donante_categoria { get; set; }
        public virtual DbSet<periocidad> periocidad { get; set; }
        public virtual DbSet<donante> donante { get; set; }
        public virtual DbSet<entidad> entidad { get; set; }
    }
}
