using System.ComponentModel.DataAnnotations;

namespace StudentManagment.Models;

public class Course
{
    [Key]
    public Guid Id { get; set; }
    public string Title { get; set; }
    public int Credits { get; set; }
}