using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace Fisioterapia.Models {
    public class SqlServerContext : DataContext {
        public SqlServerContext(IConfiguration configuration) : base(configuration) {

        }
        protected override void OnConfiguring(DbContextOptionsBuilder option) {
            option.UseSqlServer(_configuration.GetConnectionString("Procucao"));
        }
    }
}
