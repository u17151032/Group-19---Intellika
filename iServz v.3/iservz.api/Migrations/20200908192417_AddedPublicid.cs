using Microsoft.EntityFrameworkCore.Migrations;

namespace iservz.api.Migrations
{
    public partial class AddedPublicid : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Service",
                table: "Users",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PublicId",
                table: "Photos",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Service",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "PublicId",
                table: "Photos");
        }
    }
}
