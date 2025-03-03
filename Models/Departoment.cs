using System.ComponentModel.DataAnnotations;

namespace StudentManagment.Models;

public class Departoment
{
    [Key]
    public Guid Id { get; set; }
    public string Name { get; set; }
    public double Dudget { get; set; }
    public DateOnly StartDate { get; set; }
    public Instructor DepartmentHead { get; set; }
}