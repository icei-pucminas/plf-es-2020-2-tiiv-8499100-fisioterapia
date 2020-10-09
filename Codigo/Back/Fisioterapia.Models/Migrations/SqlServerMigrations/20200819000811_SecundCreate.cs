using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Fisioterapia.Models.Migrations.SqlServerMigrations
{
    public partial class SecundCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "FullNome",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "SenhaHansh",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "SenhaSal",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "UserNome",
                table: "Usuarios");

            migrationBuilder.AddColumn<bool>(
                name: "AceitoTermos",
                table: "Usuarios",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<DateTime>(
                name: "Atualizado",
                table: "Usuarios",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "Criado",
                table: "Usuarios",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Usuarios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Nome",
                table: "Usuarios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ResetToken",
                table: "Usuarios",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "ResetTokenExpires",
                table: "Usuarios",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Role",
                table: "Usuarios",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "SenhaHash",
                table: "Usuarios",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "SenhaReset",
                table: "Usuarios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Titulo",
                table: "Usuarios",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "VerificacaoToken",
                table: "Usuarios",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "Verificado",
                table: "Usuarios",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "RefreshToken",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UsuariosId = table.Column<int>(nullable: false),
                    Token = table.Column<string>(nullable: true),
                    Expires = table.Column<DateTime>(nullable: false),
                    Created = table.Column<DateTime>(nullable: false),
                    CreatedById = table.Column<string>(nullable: true),
                    Revoked = table.Column<DateTime>(nullable: true),
                    RevokedById = table.Column<string>(nullable: true),
                    ReplacedByToken = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RefreshToken", x => new { x.UsuariosId, x.Id });
                    table.ForeignKey(
                        name: "FK_RefreshToken_Usuarios_UsuariosId",
                        column: x => x.UsuariosId,
                        principalTable: "Usuarios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "RefreshToken");

            migrationBuilder.DropColumn(
                name: "AceitoTermos",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "Atualizado",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "Criado",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "Nome",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "ResetToken",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "ResetTokenExpires",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "Role",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "SenhaHash",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "SenhaReset",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "Titulo",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "VerificacaoToken",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "Verificado",
                table: "Usuarios");

            migrationBuilder.AddColumn<string>(
                name: "FullNome",
                table: "Usuarios",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<byte[]>(
                name: "SenhaHansh",
                table: "Usuarios",
                type: "varbinary(max)",
                nullable: true);

            migrationBuilder.AddColumn<byte[]>(
                name: "SenhaSal",
                table: "Usuarios",
                type: "varbinary(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UserNome",
                table: "Usuarios",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
