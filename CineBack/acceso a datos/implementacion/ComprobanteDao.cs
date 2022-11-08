using CineBack.dominio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CineBack.acceso_a_datos
{
    class ComprobanteDao : IComprobanteDao
    {

        //ACTUALIZAR
        public bool Actualizar(Comprobante oComprobante)
        {
            //throw new NotImplementedException();
            bool ok = true;
            SqlConnection cnn = HelperDao.ObtenerInstancia().ObtenerConexion();
            SqlTransaction t = null;
            SqlCommand cmd = new SqlCommand();

            try
            {
                cnn.Open();
                t = cnn.BeginTransaction();
                cmd.Connection = cnn;
                cmd.Transaction = t;
                cmd.CommandText = "SP_MODIFICAR_MAESTRO";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idFormaPago", oComprobante.IdFormaPago);
                cmd.Parameters.AddWithValue("@idFormaCompra", oComprobante.IdFormaCompra);
                cmd.Parameters.AddWithValue("@idDescuento", oComprobante.IdDescuento);
                cmd.Parameters.AddWithValue("@idEstado", oComprobante.IdEstado);
                cmd.Parameters.AddWithValue("@descripcion", oComprobante.Descripcion);
                cmd.Parameters.AddWithValue("@comprobante_nro", oComprobante.IdComprobante);
                cmd.ExecuteNonQuery();

                SqlCommand cmdDetalle;
                
                foreach (DetalleComprobante item in oComprobante.Detalles)
                {                 
                    cmdDetalle = new SqlCommand("SP_INSERTAR_DETALLE", cnn, t);
                    cmdDetalle.CommandType = CommandType.StoredProcedure;
                    cmdDetalle.Parameters.AddWithValue("@idComprobante", oComprobante.IdComprobante);
                    cmdDetalle.Parameters.AddWithValue("@idEntrada", item.Entrada.IdEntrada);
                    cmdDetalle.Parameters.AddWithValue("@monto", item.Monto);
                    cmdDetalle.Parameters.AddWithValue("@cantidad", item.Cantidad);
                    cmdDetalle.ExecuteNonQuery();
            
                }
                t.Commit();
            }

            catch (Exception)
            {
                if (t != null)
                    t.Rollback();
                ok = false;
            }

            finally
            {
                if (cnn != null && cnn.State == ConnectionState.Open)
                    cnn.Close();
            }

            return ok;
        }


        //BORRAR COMPROBANTES
        public bool Borrar(int nro)
        {
            string sp = "BORRAR_COMPROBANTE";
            List<Parametro> lst = new List<Parametro>();
            lst.Add(new Parametro("@comprobante_nro", nro));
            int afectadas = HelperDao.ObtenerInstancia().EjecutarSQL(sp, lst);
            return afectadas > 0;
        }


        //CREAR COMPROBANTES
        public bool Crear(Comprobante oComprobante)
        {
            bool ok = true;
            SqlConnection cnn = HelperDao.ObtenerInstancia().ObtenerConexion();
            SqlTransaction t = null;
            SqlCommand cmd = new SqlCommand();
            try
            {

                cnn.Open();
                t = cnn.BeginTransaction();
                cmd.Connection = cnn;
                cmd.Transaction = t;
                cmd.CommandText = "SP_INSERTAR_MAESTRO";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idFormaPago", oComprobante.IdFormaPago);
                cmd.Parameters.AddWithValue("@idFormaCompra", oComprobante.IdFormaCompra);
                cmd.Parameters.AddWithValue("@idDescuento", oComprobante.IdDescuento);
                cmd.Parameters.AddWithValue("@idEstado", oComprobante.IdEstado);
                cmd.Parameters.AddWithValue("@descripcion", oComprobante.Descripcion);

                //parámetro de salida:
                SqlParameter pOut = new SqlParameter();
                pOut.ParameterName = "@comprobante_nro";
                pOut.DbType = DbType.Int32;
                pOut.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(pOut);
                cmd.ExecuteNonQuery();

                int comprobanteNro = (int)pOut.Value;

                SqlCommand cmdDetalle;
                
                foreach (DetalleComprobante item in oComprobante.Detalles)
                {
                    cmdDetalle = new SqlCommand("SP_INSERTAR_DETALLE", cnn, t);
                    cmdDetalle.CommandType = CommandType.StoredProcedure;
                    cmdDetalle.Parameters.AddWithValue("@idComprobante", comprobanteNro);
                    cmdDetalle.Parameters.AddWithValue("@idEntrada", item.Entrada.IdEntrada);
                    cmdDetalle.Parameters.AddWithValue("@monto", item.Monto);
                    cmdDetalle.Parameters.AddWithValue("@cantidad", item.Cantidad);
                    cmdDetalle.ExecuteNonQuery();

                    
                }
                t.Commit();
            }

            catch (Exception)
            {
                if (t != null)
                    t.Rollback();
                ok = false;
            }

            finally
            {
                if (cnn != null && cnn.State == ConnectionState.Open)
                    cnn.Close();
            }

            return ok;
        }




        //MOSTRAR ENTRADAS
        public List<Entrada> GetEntradas()
        {
            List<Entrada> lst = new List<Entrada>();

            string sp = "SP_CONSULTAR_ENTRADAS";
            DataTable t = HelperDao.ObtenerInstancia().ConsultaSQL(sp, null);

            foreach (DataRow dr in t.Rows)
            {
                //Mapear un registro a un objeto del modelo de dominio
                int IdEntrada = int.Parse(dr["id_entrada"].ToString());
                int IdDetSala = int.Parse(dr["id_detalle_sala"].ToString());
                int IdFuncion = int.Parse(dr["id_funcion"].ToString());
                int IdCliente = int.Parse(dr["id_cliente"].ToString());
                double precio = float.Parse(dr["precio"].ToString());
                DateTime FechaEntrada = DateTime.Parse(dr["fecha_entrada"].ToString());


                Entrada aux = new Entrada(IdEntrada ,IdDetSala, IdFuncion, IdCliente, precio, FechaEntrada);
                lst.Add(aux);
            }

            return lst;
        }
    }
}
