using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.dominio
{
    public class DetalleComprobante
    {
        //public int IdDetalleComprobante { get; set; } 
        //public int IdEstado { get; set; }
        public Entrada Entrada { get; set; }
        public float Monto { get; set; }
        public int Cantidad { get; set; }


        public DetalleComprobante() {}

        public DetalleComprobante(Entrada entrada, int cantidad)
        {
            Entrada = entrada;
            Cantidad = cantidad;
        }

        public double CalcularSubTotal()
        {
            return Entrada.Precio * Cantidad;
        }


    }

}

