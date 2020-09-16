using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using Fisioterapia.Models.Entidades;

namespace Fisioterapia.Models {
    public class DataContext: DbContext {
        protected readonly IConfiguration _configuration;
        public DataContext(IConfiguration configuration) {
            _configuration = configuration;
        }
        public DbSet<Usuarios> Usuarios { get; set; }
        public DbSet<Atleta> Atleta { get; set; }

       // public DbSet<Logs> Logs { get; set; }
    }
}
