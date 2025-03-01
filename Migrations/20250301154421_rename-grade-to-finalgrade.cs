using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StudentManagment.Migrations
{
    /// <inheritdoc />
    public partial class renamegradetofinalgrade : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Enrollments_v1_1",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    StudentId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CourseId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Grade = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Enrollments_v1_1", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Enrollments_v1_1_Courses_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Enrollments_v1_1_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Enrollments_v1_1_CourseId",
                table: "Enrollments_v1_1",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_Enrollments_v1_1_StudentId",
                table: "Enrollments_v1_1",
                column: "StudentId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Enrollments_v1_1");
        }
    }
}
