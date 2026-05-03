<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="manolo_limitada.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manolo Limitada</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="Content/Style.css" rel="stylesheet" />
</head>
<body class="login-body bg-login">
    <form id="form1" runat="server">
        <div class="container d-flex justify-content-center align-items-center min-vh-100">
            
            <div class="card shadow-lg p-4 p-md-5" style="width: 100%; max-width: 420px;">
                
                <div class="text-center mb-4">
                    <div class="bg-primary bg-opacity-10 rounded-circle p-3 d-inline-block mb-3">
                        <i class="fas fa-building fa-3x text-primary"></i>
                    </div>
                    <h2 class="fw-bold mb-0 text-primary fw-bold">Manolo Limitada</h2>
                    <p class="text-muted mt-1 mb-0">Sistema de Gestión de Contactos</p>
                </div>

                <hr class="mb-4" />

                <h3 class="text-center mb-4 fw-semibold">
                    <i class="fas fa-lock me-2 text-primary fw-bold"></i>Acceso Administrativo
                </h3>

                <div class="mb-4">
                    <label class="form-label fw-semibold mb-2">
                        <i class="fas fa-user me-2 text-primary fw-bold"></i>Usuario
                    </label>
                    <asp:TextBox ID="txtUsuario" runat="server" 
                                 CssClass="form-control form-control-lg" 
                                 placeholder="Ingrese su usuario" />
                </div>

                <div class="mb-4">
                    <label class="form-label fw-semibold mb-2">
                        <i class="fas fa-key me-2 text-primary fw-bold"></i>Contraseña
                    </label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" 
                                 CssClass="form-control form-control-lg" 
                                 placeholder="Ingrese su contraseña" />
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Ingresar al Sistema"
                            CssClass="btn btn-primary btn-login w-100 btn-lg fw-bold"
                            OnClick="btnLogin_Click" />

                <asp:Label ID="lblMensaje" runat="server" 
                           CssClass="text-danger mt-3 d-block text-center small" />

            </div>

        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>