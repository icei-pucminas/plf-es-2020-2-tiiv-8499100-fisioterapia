using Microsoft.EntityFrameworkCore.Migrations;

namespace Fisioterapia.Models.Migrations.SqlServerMigrations
{
    public partial class MigAtualizarDb : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "OcoContusao",
                table: "Atletas");

            migrationBuilder.AddColumn<bool>(
                name: "Active",
                table: "Usuarios",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<byte>(
                name: "OcorreuContusao",
                table: "Atletas",
                nullable: false,
                defaultValue: (byte)0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Active",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "OcorreuContusao",
                table: "Atletas");

            migrationBuilder.AddColumn<bool>(
                name: "OcoContusao",
                table: "Atletas",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }
    }
}
