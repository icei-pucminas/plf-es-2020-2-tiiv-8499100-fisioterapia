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
        public DbSet<Atleta> Atletas { get; set; }
        public DbSet<Auxiliar> Auxiliars { get; set; }
        public DbSet<Exames> Exames { get; set; }

        public DbSet<Pedido> Pedidos { get; set; }
        public DbSet<Exercicios> Exercicios { get; set; }
        public DbSet<Logs> Logs { get; set; }
        public DbSet<ExameExercicios> ExameExercicios { get; set; }
        public DbSet<AuxiliarUsuarios> AuxiliarUsuarios { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder) {
            modelBuilder.Entity<ExameExercicios>()
                .HasKey(x => new { x.IdExame, x.IdExercios});
            modelBuilder.Entity<AuxiliarUsuarios>()
               .HasKey(x => new { x.IdUsuario, x.IdAuxiliar });
        }
       
    }
}
