﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Factory_Managment_Website.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Factory_Managment_DBEntities1 : DbContext
    {
        public Factory_Managment_DBEntities1()
            : base("name=Factory_Managment_DBEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Department_table> Department_table { get; set; }
        public virtual DbSet<Employee_Shift_ID> Employee_Shift_ID { get; set; }
        public virtual DbSet<Employee_table> Employee_table { get; set; }
        public virtual DbSet<Shift_table> Shift_table { get; set; }
        public virtual DbSet<User_table> User_table { get; set; }
    }
}