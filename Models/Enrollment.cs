using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StudentManagment.Models;

public class Enrollment
{
    [Key]
    public Guid Id { get; set; }
    public Student Student { get; set; }
    public Course Course { get; set; }
    public int? Grade { get; set; }
}

public class Enrollment_v1_1
{
    [Key]
    public Guid Id { get; set; }
    public Student Student { get; set; }
    public Course Course { get; set; }
    public int? FinalGrade { get; set; }
}

public class Enrollment_v1_2
{
    [Key]
    public Guid Id { get; set; }
    public Student Student { get; set; }
    public Course_v1_1 Course { get; set; }
    public int? FinalGrade { get; set; }
}