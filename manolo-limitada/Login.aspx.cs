using manolo_limitada.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace manolo_limitada
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (usuario == "" || password == "")
            {
                lblMensaje.Text = "Completa todos los campos";
                return;
            }

            Conexion con = new Conexion();

            using (SqlConnection conn = con.ObtenerConexion())
            {
                conn.Open();

                string query = "SELECT COUNT(*) FROM Usuarios WHERE Username=@user AND Password=@pass";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@user", usuario);
                cmd.Parameters.AddWithValue("@pass", password);

                int count = (int)cmd.ExecuteScalar();

                if (count > 0)
                {
                    Session["usuario"] = usuario;

                    Response.Redirect("Contactos.aspx");
                }
                else
                {
                    lblMensaje.Text = "Usuario o contraseña incorrectos";
                }
            }
        }
    }
}