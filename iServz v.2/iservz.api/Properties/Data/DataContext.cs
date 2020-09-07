using Microsoft.EntityFrameworkCore;
using iservz.api.Properties.Models;
using Iservz.API.Properties.Models;

namespace iservz.api.Properties.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base (options){}

        public DbSet<Value> Values { get; set; }
        public DbSet<User> Users {get; set;}
        public DbSet<Photo> Photos {get; set;}
       
    }
}