using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Objects;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Http.OData.Builder;
using MvcApplication6.Models;

namespace MvcApplication6.Data
{
    public class DataContext : DbContext
    {
        private DbContext _context;

        public DataContext()
            : base("DefaultConnection")
        {
            _context = new DbContext("DefaultConnection");
        }

        public DbSet<T> dbSet<T>() where T : BaseEntity
        {
            return _context.Set<T>();
        }

        public IQueryable<T> Query<T>() where T : BaseEntity
        {
            var dbSet = dbSet<T>();
            return dbSet.AsQueryable();
        }
    }

    //public class UserProfileMap : EntityTypeConfiguration<UserProfile>
    //{
    //    public UserProfileMap()
    //    {
    //        this.ToTable("UserProfile");
    //        this.HasKey(tax => tax.TaxRateID);
    //        this.Property(tax => tax.State).IsRequired().HasMaxLength(50);
    //        this.Property(tax => tax.County).IsOptional();
    //        this.Property(tax => tax.City).IsRequired().HasMaxLength(50);
    //        this.Property(tax => tax.Rate).IsRequired();
    //    }
    //}
}
