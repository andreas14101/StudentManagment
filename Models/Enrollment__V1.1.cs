using System.ComponentModel.DataAnnotations;

namespace StudentManagment.Models;

public class Enrollment__V1_1
{
    [Key]
    public Guid Id { get; set; }
    public Student Student { get; set; }
    public Course Course { get; set; }
    public int? FinalGrade { get; set; }
}