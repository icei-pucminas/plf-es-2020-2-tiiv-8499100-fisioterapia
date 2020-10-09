using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;

namespace Fisioterapia.Models {
    public class SqlLiteDataContext : DataContext {
        public SqlLiteDataContext(IConfiguration configuration) :base(configuration) {

        }
        protected override void OnConfiguring(DbContextOptionsBuilder option) {
            option.UseSqlite(_configuration.GetConnectionString("Procucao"));
        }
    }
}
