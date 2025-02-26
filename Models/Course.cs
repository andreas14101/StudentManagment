using System.ComponentModel.DataAnnotations;

namespace StudentManagment.Models;

public class Course
{
    [Key]
    public Guid Id { get; set; }
    public string Title { get; set; }
    public Instructor? Instructor { get; set; }
    public float Credits { get; set; }
}