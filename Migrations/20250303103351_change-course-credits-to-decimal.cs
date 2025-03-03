using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StudentManagment.Migrations
{
    /// <inheritdoc />
    public partial class changecoursecreditstodecimal : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Courses_v1_1",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    InstructorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    Credits = table.Column<decimal>(type: "decimal(5,2)", precision: 5, scale: 2, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Courses_v1_1", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Courses_v1_1_Instructors_InstructorId",
                        column: x => x.InstructorId,
                        principalTable: "Instructors",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Enrollments_v1_2",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    StudentId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CourseId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    FinalGrade = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Enrollments_v1_2", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Enrollments_v1_2_Courses_v1_1_CourseId",
                        column: x => x.CourseId,
                        principalTable: "Courses_v1_1",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Enrollments_v1_2_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Courses_v1_1_InstructorId",
                table: "Courses_v1_1",
                column: "InstructorId");

            migrationBuilder.CreateIndex(
                name: "IX_Enrollments_v1_2_CourseId",
                table: "Enrollments_v1_2",
                column: "CourseId");

            migrationBuilder.CreateIndex(
                name: "IX_Enrollments_v1_2_StudentId",
                table: "Enrollments_v1_2",
                column: "StudentId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Enrollments_v1_2");

            migrationBuilder.DropTable(
                name: "Courses_v1_1");
        }
    }
}
