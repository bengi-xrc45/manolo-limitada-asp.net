using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace manolo_limitada.Data
{
    public class Conexion
    {
        private string cadena = ConfigurationManager.ConnectionStrings["conexionDB"].ConnectionString;

        public SqlConnection ObtenerConexion()
        {
            SqlConnection conn = new SqlConnection(cadena);
            return conn;
        }
    }
}