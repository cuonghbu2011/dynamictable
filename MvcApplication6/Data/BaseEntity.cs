using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MvcApplication6.Data
{
    public class BaseEntity
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Data { get; set; }
    }

    public class tblRatingCategoriesContext : DbContext
    {
        public tblRatingCategoriesContext()
            : base("DefaultConnection")
        {
        }

        public DbSet<tblRatingCategories> Categories { get; set; }
    }

    [Table("tblRatingCategories")]
    public class tblRatingCategories : BaseEntity
    {

    }

    [Table("tblUserRating")]
    public class tblUserRating : BaseEntity
    {

    }

    public class tblUserRatingContext : DbContext
    {
        public tblUserRatingContext()
            : base("DefaultConnection")
        {
        }

        public DbSet<tblUserRating> UserRatings { get; set; }
    }
}