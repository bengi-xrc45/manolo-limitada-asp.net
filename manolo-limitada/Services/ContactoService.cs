using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using manolo_limitada.Data;
using manolo_limitada.Models;

namespace manolo_limitada.Services
{
    public class ContactoService
    {
        Conexion con = new Conexion();

        public List<Contacto> ObtenerTodos()
        {
            List<Contacto> lista = new List<Contacto>();

            using (SqlConnection conn = con.ObtenerConexion())
            {
                conn.Open();

                string query = "SELECT * FROM Contactos";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new Contacto
                    {
                        Cedula = dr["Cedula"].ToString(),
                        Nombre = dr["Nombre"].ToString(),
                        Apellidos = dr["Apellidos"].ToString(),
                        FechaNacimiento = Convert.ToDateTime(dr["FechaNacimiento"]),
                        Telefono = dr["Telefono"].ToString(),
                        Direccion = dr["Direccion"].ToString()
                    });
                }
            }

            return lista;
        }

        public Contacto BuscarPorCedula(string cedula)
        {
            using (SqlConnection conn = con.ObtenerConexion())
            {
                conn.Open();

                string query = "SELECT * FROM Contactos WHERE Cedula=@cedula";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@cedula", cedula);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    return new Contacto
                    {
                        Cedula = dr["Cedula"].ToString(),
                        Nombre = dr["Nombre"].ToString(),
                        Apellidos = dr["Apellidos"].ToString(),
                        FechaNacimiento = Convert.ToDateTime(dr["FechaNacimiento"]),
                        Telefono = dr["Telefono"].ToString(),
                        Direccion = dr["Direccion"].ToString()
                    };
                }
            }

            return null;
        }

        public List<Contacto> BuscarPorApellido(string apellido)
        {
            using (SqlConnection conn = con.ObtenerConexion())
            {
                conn.Open();

                string query = @"SELECT * FROM Contactos 
                         WHERE Apellidos LIKE @apellido";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@apellido", "%" + apellido + "%");

                SqlDataReader dr = cmd.ExecuteReader();

                List<Contacto> lista = new List<Contacto>();

                while (dr.Read())
                {
                    lista.Add(new Contacto
                    {
                        Cedula = dr["Cedula"].ToString(),
                        Nombre = dr["Nombre"].ToString(),
                        Apellidos = dr["Apellidos"].ToString(),
                        FechaNacimiento = Convert.ToDateTime(dr["FechaNacimiento"]),
                        Telefono = dr["Telefono"].ToString(),
                        Direccion = dr["Direccion"].ToString()
                    });
                }

                return lista;
            }
        }

        public bool ExisteCedula(string cedula)
        {
            using (SqlConnection conn = con.ObtenerConexion())
            {
                conn.Open();

                string query = "SELECT COUNT(*) FROM Contactos WHERE Cedula=@cedula";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@cedula", cedula);

                int count = (int)cmd.ExecuteScalar();

                return count > 0;
            }
        }

        public void ValidarEdad(Contacto c)
        {
            int edad = DateTime.Now.Year - c.FechaNacimiento.Year;

            if (DateTime.Now.DayOfYear < c.FechaNacimiento.DayOfYear)
                edad--;

            if (edad < 18)
                throw new Exception("El contacto debe ser mayor de 18 años");
        }

        public void Insertar(Contacto c)
        {
            ValidarEdad(c);
            using (SqlConnection conn = con.ObtenerConexion())
            {
                conn.Open();

                string query = @"INSERT INTO Contactos 
        (Cedula, Nombre, Apellidos, FechaNacimiento, Telefono, Direccion)
        VALUES (@cedula, @nombre, @apellidos, @fecha, @tel, @dir)";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@cedula", c.Cedula);
                cmd.Parameters.AddWithValue("@nombre", c.Nombre);
                cmd.Parameters.AddWithValue("@apellidos", c.Apellidos);
                cmd.Parameters.AddWithValue("@fecha", c.FechaNacimiento);
                cmd.Parameters.AddWithValue("@tel", c.Telefono);
                cmd.Parameters.AddWithValue("@dir", c.Direccion);

                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (SqlException)
                {
                    throw new Exception("Error al insertar el contacto");
                }
            }
        }

        public void Actualizar(Contacto c)
        {
            ValidarEdad(c);
            using (SqlConnection conn = con.ObtenerConexion())
            {
                conn.Open();

                string query = @"UPDATE Contactos SET
                Nombre=@nombre,
                Apellidos=@apellidos,
                FechaNacimiento=@fecha,
                Telefono=@tel,
                Direccion=@dir
                WHERE Cedula=@cedula";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@cedula", c.Cedula);
                cmd.Parameters.AddWithValue("@nombre", c.Nombre);
                cmd.Parameters.AddWithValue("@apellidos", c.Apellidos);
                cmd.Parameters.AddWithValue("@fecha", c.FechaNacimiento);
                cmd.Parameters.AddWithValue("@tel", c.Telefono);
                cmd.Parameters.AddWithValue("@dir", c.Direccion);

                cmd.ExecuteNonQuery();
            }
        }

        public void Eliminar(string cedula)
        {
            using (SqlConnection conn = con.ObtenerConexion())
            {
                conn.Open();

                string query = "DELETE FROM Contactos WHERE Cedula=@cedula";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@cedula", cedula);

                cmd.ExecuteNonQuery();
            }
        }
    }
}