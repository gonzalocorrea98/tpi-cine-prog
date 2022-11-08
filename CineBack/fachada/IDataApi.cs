using CineBack.dominio;
using CineBack.soporte;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.fachada
{
    public interface IDataApi
    {

        //MAESTRO
        public List<Entrada> GetEntradas();

        public bool SaveComprobante(Comprobante comprobante);

        public bool DeleteComprobante(int nro);

        public bool UpdateComprobante(Comprobante comprobante);

        
        //SOPORTE
        public List<Pelicula> GetPeliculas();

        public bool SavePelicula(Pelicula pelicula);

        public bool DeletePelicula(int nro);

        public bool UpdatePelicula(Pelicula pelicula);


    }
}
