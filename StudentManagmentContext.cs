using Microsoft.EntityFrameworkCore;
using StudentManagment.Models;

namespace StudentManagment;

public class StudentManagmentContext: DbContext
{
    DbSet<Student> Students { get; set; }
    DbSet<Course_v1_1> Courses_v1_1 { get; set; }
    DbSet<Enrollment> Enrollments { get; set; }
    DbSet<Enrollment_v1_1> Enrollments_v1_1 { get; set; }
    DbSet<Enrollment_v1_2> Enrollments_v1_2 { get; set; }
    DbSet<Instructor> Instructors { get; set; }
    DbSet<Departoment> Departoments { get; set; }
    
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        try
        {
            string connectionString = Environment.GetEnvironmentVariable("DB_CONNECTION_STRING");
            if (!string.IsNullOrEmpty(connectionString))
            {
                optionsBuilder.UseSqlServer(connectionString);
            }
        }
        catch (Exception e)
        {
            throw new Exception("Context error: " + e.Message, e);
        }
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // creates the relation for Enrollment with Course and Student
        modelBuilder.Entity<Enrollment>().HasOne<Student>(s => s.Student);
        modelBuilder.Entity<Enrollment>().HasOne<Course>(c => c.Course);
        // creates the relation for Enrollment_v1_1 with Course and Student
        modelBuilder.Entity<Enrollment_v1_1>().HasOne<Student>(s => s.Student);
        modelBuilder.Entity<Enrollment_v1_1>().HasOne<Course>(c => c.Course);
        // creates the relation for Enrollment_v1_2 with Course_v1_1 and Student
        modelBuilder.Entity<Enrollment_v1_2>().HasOne<Student>(s => s.Student);
        modelBuilder.Entity<Enrollment_v1_2>().HasOne<Course_v1_1>(c => c.Course);
        // creates the relation for course with instructor
        modelBuilder.Entity<Course>().HasOne<Instructor>(i => i.Instructor);
        // creates the relation for department with instructor
        modelBuilder.Entity<Departoment>().HasOne<Instructor>(i => i.DepartmentHead);
    }
}