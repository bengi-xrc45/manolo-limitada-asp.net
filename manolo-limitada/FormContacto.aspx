<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormContacto.aspx.cs" Inherits="manolo_limitada.FormContacto" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Registrar Contacto - Manolo Limitada</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="Content/Style.css" rel="stylesheet" />
</head>
<body class="form-page-bg">
    <form id="form1" runat="server">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="card card-custom shadow-lg">
                        <div class="card-header bg-white border-0 pt-4 pb-0">
                            <div class="text-center mb-3">
                                <div class="bg-primary bg-opacity-10 rounded-circle p-3 d-inline-block mb-2">
                                    <i class="fas fa-user-plus fa-3x text-primary"></i>
                                </div>
                                <h2 runat="server" class="fw-bold mb-0" ID="tituloFormulario">Registrar Contacto</h2>
                                <p class="text-muted mt-1">Complete los datos del nuevo contacto</p>
                            </div>
                            <hr />
                        </div>
                        
                        <div class="card-body p-4">
                            <asp:Label ID="lblMensaje" runat="server" CssClass="alert d-block mb-5"/>
                            <div class="mb-3">
                                <label class="form-label fw-semibold">
                                    <i class="fas fa-id-card me-2 text-primary"></i>Cédula
                                </label>
                                <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control" 
                                             placeholder="Ej: 1194587043" />
                                <div class="mt-1">
                                    <asp:RequiredFieldValidator ControlToValidate="txtCedula" runat="server"
                                        ErrorMessage="<i class='fas fa-exclamation-circle me-1'></i>Campo obligatorio" 
                                        CssClass="text-danger small" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ControlToValidate="txtCedula"
                                        ValidationExpression="^\d+$"
                                        ErrorMessage="<i class='fas fa-exclamation-circle me-1'></i>Solo números"
                                        CssClass="text-danger small"
                                        Display="Dynamic"
                                        runat="server" />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-semibold">
                                    <i class="fas fa-user me-2 text-primary"></i>Nombre
                                </label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" 
                                             placeholder="Ej: Juan" />
                                <div class="mt-1">
                                    <asp:RequiredFieldValidator ControlToValidate="txtNombre"
                                        ErrorMessage="<i class='fas fa-exclamation-circle me-1'></i>Campo obligatorio"
                                        CssClass="text-danger small"
                                        Display="Dynamic"
                                        runat="server" />
                                    <asp:RegularExpressionValidator
                                        ControlToValidate="txtNombre"
                                        ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$"
                                        ErrorMessage="<i class='fas fa-exclamation-circle me-1'></i>Solo letras"
                                        CssClass="text-danger small"
                                        Display="Dynamic"
                                        runat="server" />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-semibold">
                                    <i class="fas fa-user-friends me-2 text-primary"></i>Apellidos
                                </label>
                                <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" 
                                             placeholder="Ej: Pérez Gómez" />
                                <div class="mt-1">
                                    <asp:RequiredFieldValidator ControlToValidate="txtApellidos"
                                        ErrorMessage="<i class='fas fa-exclamation-circle me-1'></i>Campo obligatorio"
                                        CssClass="text-danger small"
                                        Display="Dynamic"
                                        runat="server" />
                                    <asp:RegularExpressionValidator
                                        ControlToValidate="txtApellidos"
                                        ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$"
                                        ErrorMessage="<i class='fas fa-exclamation-circle me-1'></i>Solo letras"
                                        CssClass="text-danger small"
                                        Display="Dynamic"
                                        runat="server" />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-semibold">
                                    <i class="fas fa-calendar-alt me-2 text-primary"></i>Fecha de Nacimiento
                                </label>
                                <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control" />
                                <div class="mt-1">
                                    <asp:RequiredFieldValidator ControlToValidate="txtFecha"
                                        ErrorMessage="<i class='fas fa-exclamation-circle me-1'></i>Campo obligatorio"
                                        CssClass="text-danger small"
                                        Display="Dynamic"
                                        runat="server" />
                                    <small class="text-muted form-text">Debe ser mayor de 18 años</small>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-semibold">
                                    <i class="fas fa-phone me-2 text-primary"></i>Teléfono
                                </label>
                                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" 
                                             placeholder="Ej: 3246574589" />
                                <div class="mt-1">
                                    <asp:RegularExpressionValidator ControlToValidate="txtTelefono"
                                        ValidationExpression="^\d*$"
                                        ErrorMessage="<i class='fas fa-exclamation-circle me-1'></i>Solo números"
                                        CssClass="text-danger small"
                                        Display="Dynamic"
                                        runat="server" />
                                </div>
                            </div>

                            <div class="mb-4">
                                <label class="form-label fw-semibold">
                                    <i class="fas fa-map-marker-alt me-2 text-primary"></i>Dirección
                                </label>
                                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" 
                                             placeholder="Ej: Cll 90# 46 - 112" />
                            </div>

                            <div class="d-flex justify-content-between align-items-center mt-4 pt-2">
                                <a href="Contactos.aspx" class="btn btn-secondary btn-volver">
                                    <i class="fas fa-arrow-left me-2"></i>Volver
                                </a>

                                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Contacto"
                                    CssClass="btn btn-success btn-guardar"
                                    OnClick="btnGuardar_Click" />
                            </div> 

                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>