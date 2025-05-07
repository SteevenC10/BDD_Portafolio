using Microsoft.EntityFrameworkCore;
using WebApplicationPerson.Models;

namespace WebAppli_Person.Context
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {

        }
        public DbSet<Person> Persons { get; set; }
        public DbSet<WebApplicationPerson.Models.Productos> Productos { get; set; } = default!;
        public DbSet<WebApplicationPerson.Models.Pedidos> Pedidos { get; set; } = default!;


    }
}
