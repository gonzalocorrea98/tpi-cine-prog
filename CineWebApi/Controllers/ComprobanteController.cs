using CineBack.dominio;
using CineBack.fachada;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CineWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ComprobanteController : ControllerBase
    {

        private IDataApi dataApi; //punto de acceso a la API

        public ComprobanteController()
        {
            dataApi = new DataApiImp();
        }

        [HttpGet("/entradas")]
        public IActionResult GetProductos()
        {
            List<Entrada> lst = null;
            try
            {
                lst = dataApi.GetEntradas();
                return Ok(lst);

            }
            catch (Exception ex)
            {
                return StatusCode(500, "Error interno! Intente luego");
            }
        }


        [HttpPost("/comprobante")]
        public IActionResult PostComprobante(Comprobante comprobante)
        {
            try
            {
                if (comprobante == null)
                {
                    return BadRequest("Datos de comprobante incorrectos!");
                }

                return Ok(dataApi.SaveComprobante(comprobante));
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno! Intente luego");
            }
        }


        
        [HttpDelete("/borrarcomprobante")]
        public IActionResult DeleteComprobante(int nro)
        {
            return Ok(dataApi.DeleteComprobante(nro));
        }


        
        [HttpPut("/actualizarcomprobante")]
        public IActionResult UpdateComprobante(Comprobante comprobante)
        {
            return Ok(dataApi.UpdateComprobante(comprobante));
        }


        










    }
}
