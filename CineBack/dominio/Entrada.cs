using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.dominio
{
    public class Entrada
    {
        //private int idDetSala { get; set; }
        public int IdEntrada { get; set; }
        public int IdDetalleSala { get; set; }
        public int IdFuncion { get; set; }
        public int IdCliente { get; set; }
        public double Precio { get; set; } //esto lo agregue, falta ver la BD //AGREGADO EN LA BD
        public DateTime FechaEntrada { get; set; }


        public Entrada()
        {

        }

        public Entrada(int idEntrada, int idDetSala, int idFuncion, int idCliente, double precio, DateTime fechaEntrada)
        {
            IdEntrada = idEntrada;
            IdDetalleSala = idDetSala;
            IdFuncion = idFuncion;
            IdCliente = idCliente;
            Precio = precio;
            FechaEntrada = fechaEntrada;
        }

        public override string ToString()
        {
            return FechaEntrada.ToString();
        }
    }

}
