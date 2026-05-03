using manolo_limitada.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using manolo_limitada.Services;

namespace manolo_limitada
{
    public partial class Contactos : System.Web.UI.Page
    {
        ContactoService service = new ContactoService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.Redirect("Login.aspx");

            if (!IsPostBack)
                CargarContactos();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        private void CargarContactos()
        {
            var lista = service.ObtenerTodos();

            gvContactos.DataSource = lista;
            gvContactos.DataBind();

            lblTotal.Text = "Total contactos: " + lista.Count;
        }


        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string cedula = txtBuscar.Text.Trim();

            if (cedula == "")
            {
                lblMensaje.Text = "Ingresa una cédula";
                return;
            }

            var contacto = service.BuscarPorCedula(cedula);

            if (contacto != null)
            {
                gvContactos.DataSource = new[] { contacto }; 
                gvContactos.DataBind();
                lblMensaje.Text = "";
                lblTotal.Text = "Total contactos: 1";
            }
            else
            {
                gvContactos.DataSource = null;
                gvContactos.DataBind();
                lblTotal.Text = "Total contactos: 0";
                //lblMensaje.Text = "No se encontró el contacto";
            }
        }

        protected void btnBuscarApellido_Click(object sender, EventArgs e)
        {
            string apellido = txtBuscarApellido.Text.Trim();

            var resultado = service.BuscarPorApellido(apellido);

            gvContactos.DataSource = resultado;
            gvContactos.DataBind();

            lblTotal.Text = "Resultados: " + resultado.Count;
        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            txtBuscar.Text = "";
            txtBuscarApellido.Text = "";
            lblMensaje.Text = "";
            CargarContactos();
        }

        protected void gvContactos_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            string cedula = e.CommandArgument.ToString();

            if (e.CommandName == "Editar")
            {
                Response.Redirect("FormContacto.aspx?id=" + cedula);
            }

            if (e.CommandName == "Eliminar")
            {
                service.Eliminar(cedula);
                CargarContactos();
            }
        }
    }
}