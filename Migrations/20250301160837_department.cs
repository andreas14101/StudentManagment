using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StudentManagment.Migrations
{
    /// <inheritdoc />
    public partial class department : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Departoments",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Dudget = table.Column<double>(type: "float", nullable: false),
                    StartDate = table.Column<DateOnly>(type: "date", nullable: false),
                    DepartmentHeadId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Departoments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Departoments_Instructors_DepartmentHeadId",
                        column: x => x.DepartmentHeadId,
                        principalTable: "Instructors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Departoments_DepartmentHeadId",
                table: "Departoments",
                column: "DepartmentHeadId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Departoments");
        }
    }
}
