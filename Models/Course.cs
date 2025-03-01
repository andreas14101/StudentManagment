using System.ComponentModel.DataAnnotations;
using Microsoft.EntityFrameworkCore;

namespace StudentManagment.Models;

public class Course
{
    [Key]
    public Guid Id { get; set; }
    public string Title { get; set; }
    public Instructor? Instructor { get; set; }
    public int Credits { get; set; }
}

public class Course_v1_1
{
    [Key]
    public Guid Id { get; set; }
    public string Title { get; set; }
    public Instructor? Instructor { get; set; }
    [Precision(5,2)]
    public decimal Credits { get; set; }
}