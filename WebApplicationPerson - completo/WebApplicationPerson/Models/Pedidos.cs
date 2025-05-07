namespace WebApplicationPerson.Models
{
    public class Pedidos
    {
        public int Id { get; set; }
        public required int Id_Person { get; set; }
        public Person? person { get; set; }
        public required int Id_Product { get; set; }
        public Productos? Product { get; set; }
        public required double Cantidad { get; set; }


    }
}
