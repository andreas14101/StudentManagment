using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StudentManagment.Migrations
{
    /// <inheritdoc />
    public partial class changecoursecredittodecimal : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Courses_Instructors_InstructorId",
                table: "Courses");

            migrationBuilder.DropForeignKey(
                name: "FK_Enrollment_v1_1_Courses_CourseId",
                table: "Enrollment_v1_1");

            migrationBuilder.DropForeignKey(
                name: "FK_Enrollment_v1_1_Students_StudentId",
                table: "Enrollment_v1_1");

            migrationBuilder.DropForeignKey(
                name: "FK_Enrollments_Courses_CourseId",
                table: "Enrollments");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Enrollment_v1_1",
                table: "Enrollment_v1_1");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Courses",
                table: "Courses");

            migrationBuilder.RenameTable(
                name: "Enrollment_v1_1",
                newName: "Enrollments_v1_1");

            migrationBuilder.RenameTable(
                name: "Courses",
                newName: "Course");

            migrationBuilder.RenameIndex(
                name: "IX_Enrollment_v1_1_StudentId",
                table: "Enrollments_v1_1",
                newName: "IX_Enrollments_v1_1_StudentId");

            migrationBuilder.RenameIndex(
                name: "IX_Enrollment_v1_1_CourseId",
                table: "Enrollments_v1_1",
                newName: "IX_Enrollments_v1_1_CourseId");

            migrationBuilder.RenameIndex(
                name: "IX_Courses_InstructorId",
                table: "Course",
                newName: "IX_Course_InstructorId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Enrollments_v1_1",
                table: "Enrollments_v1_1",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Course",
                table: "Course",
                column: "Id");

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

            migrationBuilder.AddForeignKey(
                name: "FK_Course_Instructors_InstructorId",
                table: "Course",
                column: "InstructorId",
                principalTable: "Instructors",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Enrollments_Course_CourseId",
                table: "Enrollments",
                column: "CourseId",
                principalTable: "Course",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Enrollments_v1_1_Course_CourseId",
                table: "Enrollments_v1_1",
                column: "CourseId",
                principalTable: "Course",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Enrollments_v1_1_Students_StudentId",
                table: "Enrollments_v1_1",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Course_Instructors_InstructorId",
                table: "Course");

            migrationBuilder.DropForeignKey(
                name: "FK_Enrollments_Course_CourseId",
                table: "Enrollments");

            migrationBuilder.DropForeignKey(
                name: "FK_Enrollments_v1_1_Course_CourseId",
                table: "Enrollments_v1_1");

            migrationBuilder.DropForeignKey(
                name: "FK_Enrollments_v1_1_Students_StudentId",
                table: "Enrollments_v1_1");

            migrationBuilder.DropTable(
                name: "Enrollments_v1_2");

            migrationBuilder.DropTable(
                name: "Courses_v1_1");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Enrollments_v1_1",
                table: "Enrollments_v1_1");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Course",
                table: "Course");

            migrationBuilder.RenameTable(
                name: "Enrollments_v1_1",
                newName: "Enrollment_v1_1");

            migrationBuilder.RenameTable(
                name: "Course",
                newName: "Courses");

            migrationBuilder.RenameIndex(
                name: "IX_Enrollments_v1_1_StudentId",
                table: "Enrollment_v1_1",
                newName: "IX_Enrollment_v1_1_StudentId");

            migrationBuilder.RenameIndex(
                name: "IX_Enrollments_v1_1_CourseId",
                table: "Enrollment_v1_1",
                newName: "IX_Enrollment_v1_1_CourseId");

            migrationBuilder.RenameIndex(
                name: "IX_Course_InstructorId",
                table: "Courses",
                newName: "IX_Courses_InstructorId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Enrollment_v1_1",
                table: "Enrollment_v1_1",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Courses",
                table: "Courses",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Courses_Instructors_InstructorId",
                table: "Courses",
                column: "InstructorId",
                principalTable: "Instructors",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Enrollment_v1_1_Courses_CourseId",
                table: "Enrollment_v1_1",
                column: "CourseId",
                principalTable: "Courses",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Enrollment_v1_1_Students_StudentId",
                table: "Enrollment_v1_1",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Enrollments_Courses_CourseId",
                table: "Enrollments",
                column: "CourseId",
                principalTable: "Courses",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
