using WebAppli_Person.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.OpenApi;
using Microsoft.AspNetCore.Http.HttpResults;
namespace WebApplicationPerson.Models
{
    public class Person
    {
        public int Id { get; set; }
        public  required string Name { get; set; }
        public required int Age { get; set; }
    }

    //public class Pedido
    //{
    //    public int Id { get; set; }
    //    public required int Id_person { get; set; }
    //    public required int  Id_product { get; set; }

    //    public required string LastName { get; set; }
    //}
   

    //public class Product
    //{
    //    public int Id { get; set; }
    //    public required string Name { get; set; }
    //    public required string sd { get; set; }
    //}

public static class PersonEndpoints
{
	public static void MapPersonEndpoints (this IEndpointRouteBuilder routes)
    {
        var group = routes.MapGroup("/api/Person").WithTags(nameof(Person));

        group.MapGet("/", async (AppDbContext db) =>
        {
            return await db.Persons.ToListAsync();
        })
        .WithName("GetAllPeople")
        .WithOpenApi();

        group.MapGet("/{id}", async Task<Results<Ok<Person>, NotFound>> (int id, AppDbContext db) =>
        {
            return await db.Persons.AsNoTracking()
                .FirstOrDefaultAsync(model => model.Id == id)
                is Person model
                    ? TypedResults.Ok(model)
                    : TypedResults.NotFound();
        })
        .WithName("GetPersonById")
        .WithOpenApi();

        group.MapPut("/{id}", async Task<Results<Ok, NotFound>> (int id, Person person, AppDbContext db) =>
        {
            var affected = await db.Persons
                .Where(model => model.Id == id)
                .ExecuteUpdateAsync(setters => setters
                  .SetProperty(m => m.Id, person.Id)
                  .SetProperty(m => m.Name, person.Name)
                  .SetProperty(m => m.Age, person.Age)
                  );
            return affected == 1 ? TypedResults.Ok() : TypedResults.NotFound();
        })
        .WithName("UpdatePerson")
        .WithOpenApi();

        group.MapPost("/", async (Person person, AppDbContext db) =>
        {
            db.Persons.Add(person);
            await db.SaveChangesAsync();
            return TypedResults.Created($"/api/Person/{person.Id}",person);
        })
        .WithName("CreatePerson")
        .WithOpenApi();

        group.MapDelete("/{id}", async Task<Results<Ok, NotFound>> (int id, AppDbContext db) =>
        {
            var affected = await db.Persons
                .Where(model => model.Id == id)
                .ExecuteDeleteAsync();
            return affected == 1 ? TypedResults.Ok() : TypedResults.NotFound();
        })
        .WithName("DeletePerson")
        .WithOpenApi();
    }
}}
