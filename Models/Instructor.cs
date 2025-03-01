using System.ComponentModel.DataAnnotations;

namespace StudentManagment.Models;

public class Instructor
{
    [Key]
    public Guid Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Email { get; set; }
    public DateOnly HireDate { get; set; }
}