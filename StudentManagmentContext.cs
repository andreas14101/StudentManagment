using Microsoft.EntityFrameworkCore;
using StudentManagment.Models;

namespace StudentManagment;

public class StudentManagmentContext: DbContext
{
    DbSet<Student> Students { get; set; }
    DbSet<Course> Courses { get; set; }
    DbSet<Enrollment> Enrollments { get; set; }
    DbSet<Enrollment_v1_1> enrollment_v1_1 { get; set; }
    DbSet<Instructor> Instructors { get; set; }
    
    
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
        // creates the relation for course with instructor
        modelBuilder.Entity<Course>().HasOne<Instructor>(i => i.Instructor);
    }
}