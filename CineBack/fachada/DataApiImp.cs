using CineBack.acceso_a_datos;
using CineBack.acceso_a_datos.implementacion;
using CineBack.acceso_a_datos.interfaz;
using CineBack.dominio;
using CineBack.soporte;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.fachada
{
    public class DataApiImp : IDataApi
    {
        private IComprobanteDao dao;
        private IPeliculaDao daoP;

        public DataApiImp()
        {
            dao = new ComprobanteDao();
            daoP = new PeliculaDao();
        }


        //MAESTRO
        public List<Entrada> GetEntradas()
        {
            return dao.GetEntradas();
        }

        public bool SaveComprobante(Comprobante comprobante)
        {
            return dao.Crear(comprobante);
        }

        public bool DeleteComprobante(int nro)
        {
            return dao.Borrar(nro);
        }

        public bool UpdateComprobante(Comprobante comprobante) 
        {
            return dao.Actualizar(comprobante);

        }


        //SOPORTE
        public List<Pelicula> GetPeliculas()
        {
            return daoP.GetPeliculas();
        }

        public bool SavePelicula(Pelicula pelicula)
        {
            
            return daoP.Crear(pelicula);
            
        }

        public bool DeletePelicula(int nro)
        {
            return daoP.Borrar(nro);
        }

        public bool UpdatePelicula(Pelicula pelicula)
        {
            return daoP.Actualizar(pelicula);
        }


        




    }
}
