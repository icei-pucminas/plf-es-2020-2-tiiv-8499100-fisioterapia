using Microsoft.EntityFrameworkCore.Migrations;

namespace Fisioterapia.Models.Migrations.SqlServerMigrations
{
    public partial class MigExerciciosResultados : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Resultado1",
                table: "ExameExercicios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Resultado2",
                table: "ExameExercicios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Valor1",
                table: "ExameExercicios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Valor2",
                table: "ExameExercicios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Valor3",
                table: "ExameExercicios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Valor4",
                table: "ExameExercicios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Valor5",
                table: "ExameExercicios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Valor6",
                table: "ExameExercicios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Valor7",
                table: "ExameExercicios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Valor8",
                table: "ExameExercicios",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Resultado1",
                table: "ExameExercicios");

            migrationBuilder.DropColumn(
                name: "Resultado2",
                table: "ExameExercicios");

            migrationBuilder.DropColumn(
                name: "Valor1",
                table: "ExameExercicios");

            migrationBuilder.DropColumn(
                name: "Valor2",
                table: "ExameExercicios");

            migrationBuilder.DropColumn(
                name: "Valor3",
                table: "ExameExercicios");

            migrationBuilder.DropColumn(
                name: "Valor4",
                table: "ExameExercicios");

            migrationBuilder.DropColumn(
                name: "Valor5",
                table: "ExameExercicios");

            migrationBuilder.DropColumn(
                name: "Valor6",
                table: "ExameExercicios");

            migrationBuilder.DropColumn(
                name: "Valor7",
                table: "ExameExercicios");

            migrationBuilder.DropColumn(
                name: "Valor8",
                table: "ExameExercicios");
        }
    }
}
