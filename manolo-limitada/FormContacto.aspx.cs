using manolo_limitada.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using manolo_limitada.Models;
using manolo_limitada.Services;

namespace manolo_limitada
{
    public partial class FormContacto : System.Web.UI.Page
    {
        ContactoService service = new ContactoService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.Redirect("Login.aspx");

            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];

                if (id != null)
                {
                    CargarContacto(id);
                    txtCedula.Enabled = false;
                    btnGuardar.Text = "Actualizar contacto";
                    tituloFormulario.InnerText = "Actualizar contacto";
                }
                else
                {
                    btnGuardar.Text = "Registrar contacto";
                    tituloFormulario.InnerText = "Registrar contacto";
                }
            }
        }

        private void CargarContacto(string cedula)
        {
            var contacto = service.BuscarPorCedula(cedula);

            if (contacto != null)
            {
                txtCedula.Text = contacto.Cedula;
                txtNombre.Text = contacto.Nombre;
                txtApellidos.Text = contacto.Apellidos;
                txtFecha.Text = contacto.FechaNacimiento.ToString("yyyy-MM-dd");
                txtTelefono.Text = contacto.Telefono;
                txtDireccion.Text = contacto.Direccion;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string id = Request.QueryString["id"];

            Contacto c = new Contacto
            {
                Cedula = txtCedula.Text.Trim(),
                Nombre = txtNombre.Text.Trim(),
                Apellidos = txtApellidos.Text.Trim(),
                FechaNacimiento = Convert.ToDateTime(txtFecha.Text),
                Telefono = txtTelefono.Text.Trim(),
                Direccion = txtDireccion.Text.Trim()
            };

            try
            {
                if (id == null)
                {
                    if (service.ExisteCedula(c.Cedula))
                    {
                        lblMensaje.Text = "La cédula ya está registrada";
                        lblMensaje.CssClass = "alert alert-danger d-block ";
                        lblMensaje.Visible = true;
                        return;
                    }

                    service.Insertar(c);
                    lblMensaje.Text = "Contacto guardado correctamente";
                    lblMensaje.CssClass = "alert alert-success d-block ";
                    lblMensaje.Visible = true;
                }
                else
                {
                    service.Actualizar(c);
                    lblMensaje.Text = "Contacto actualizado correctamente";
                    lblMensaje.CssClass = "alert alert-success d-block ";
                    lblMensaje.Visible = true;
                }

            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
                lblMensaje.CssClass = "alert alert-danger d-block";
                lblMensaje.Visible = true;
            }
        }
    }
}