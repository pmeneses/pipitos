﻿//------------------------------------------------------------------------------
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
    
        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<AspNetRoles> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaims> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogins> AspNetUserLogins { get; set; }
        public virtual DbSet<contacto> contacto { get; set; }
        public virtual DbSet<donante> donante { get; set; }
        public virtual DbSet<donante_categoria> donante_categoria { get; set; }
        public virtual DbSet<entidad> entidad { get; set; }
        public virtual DbSet<material> material { get; set; }
        public virtual DbSet<periocidad> periocidad { get; set; }
        public virtual DbSet<planificador_recoleccion> planificador_recoleccion { get; set; }
        public virtual DbSet<planificar_donante> planificar_donante { get; set; }
        public virtual DbSet<recolecta> recolecta { get; set; }
        public virtual DbSet<rutas> rutas { get; set; }
        public virtual DbSet<comprobante_recoleccion> comprobante_recoleccion { get; set; }
        public virtual DbSet<Departamento> Departamento { get; set; }
        public virtual DbSet<Municipio> Municipio { get; set; }
        public virtual DbSet<Sucursal> Sucursal { get; set; }
        public virtual DbSet<variables> variables { get; set; }
        public virtual DbSet<AspNetUsers> AspNetUsers { get; set; }
    }
}
