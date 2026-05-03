<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contactos.aspx.cs" Inherits="manolo_limitada.Contactos" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Lista de Contactos - Manolo Limitada</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="Content/css/contactos.css" rel="stylesheet" />
</head>
<body class="contactos-page">
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark bg-dark shadow-sm px-3 px-md-4 py-2">
            <div class="container-fluid">
                <span class="navbar-brand fs-4">
                    <i class="fas fa-address-book me-2"></i>
                    Manolo Limitada - Gestión de Contactos
                </span>
                <asp:Button ID="btnLogout" runat="server" Text="Cerrar sesión"
                    CssClass="btn btn-outline-danger rounded-pill px-4"
                    OnClick="btnLogout_Click" />
            </div>
        </nav>

        <div class="container py-4">
            <div class="card card-listado shadow-lg">
                <div class="card-header bg-white border-0 pt-4 pb-0">
                    <div class="d-flex justify-content-between align-items-center flex-wrap">
                        <div>
                            <h2 class="fw-bold mb-0">
                                <i class="fas fa-users text-primary me-2"></i>
                                Lista de Contactos
                            </h2>
                            <p class="text-muted mt-1 mb-0">Administre los contactos registrados en el sistema</p>
                        </div>
                        <a href="FormContacto.aspx" class="btn btn-success rounded-pill px-4 mt-2 mt-sm-0">
                            <i class="fas fa-plus me-2"></i>Nuevo Contacto
                        </a>
                    </div>
                    <hr class="mt-3" />
                </div>

                <div class="card-body p-4">
                    <div class="row g-3 mb-4 align-items-end">
                        <div class="col-md-8">
                            <label class="form-label fw-semibold mb-1">
                                <i class="fas fa-id-card me-1 text-primary"></i>Buscar por Cédula
                            </label>
                            <div class="input-group">
                                <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control"
                                    onkeydown="return event.key !== 'Enter';"
                                    placeholder="Ingrese cédula del contacto..." />
                                <asp:Button ID="btnBuscar" runat="server" Text="Buscar por Cédula"
                                    CssClass="btn btn-primary px-4"
                                    OnClick="btnBuscar_Click" />
                            </div>
                            <asp:RegularExpressionValidator ControlToValidate="txtBuscar"
                                ValidationExpression="^\d+$"
                                ErrorMessage="<i class='fas fa-exclamation-circle me-1'></i>Solo números"
                                CssClass="text-danger small"
                                Display="Dynamic"
                                runat="server" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-semibold mb-1 invisible">Acción</label>
                            <asp:Button ID="btnMostrarTodo" runat="server" Text="Mostrar todos"
                                CssClass="btn btn-secondary w-100 rounded-pill"
                                OnClick="btnMostrarTodo_Click" />
                        </div>
                    </div>

                    <div class="row g-3 mb-4 align-items-end">
                        <div class="col-md-8">
                            <label class="form-label fw-semibold mb-1">
                                <i class="fas fa-search me-1 text-primary"></i>Buscar por Apellidos
                            </label>
                            <div class="input-group">
                                <asp:TextBox ID="txtBuscarApellido" runat="server" CssClass="form-control"
                                    onkeydown="return event.key !== 'Enter';"
                                    placeholder="Ingrese apellido del contacto..." />
                                <asp:Button ID="btnBuscarApellido" runat="server" Text="Buscar por Apellido"
                                    CssClass="btn btn-primary px-4"
                                    OnClick="btnBuscarApellido_Click" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            
                        </div>
                    </div>
                    
                    <div class="d-flex justify-content-between align-items-center mb-3 flex-wrap">
                        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger small"></asp:Label>
                        <asp:Label ID="lblTotal" runat="server" CssClass="badge-total text-white">
                            <i class="fas fa-chart-line me-1"></i>
                            Total contactos
                        </asp:Label>
                    </div>
                    
                    <div class="table-responsive">
                        <asp:GridView ID="gvContactos" runat="server" 
                            CssClass="table table-modern table-hover align-middle"
                            AutoGenerateColumns="False" 
                            OnRowCommand="gvContactos_RowCommand"
                            GridLines="None">
                            
                            <Columns>
                                <asp:BoundField DataField="Cedula" HeaderText="Cédula" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center fw-semibold" />
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-CssClass="text-start" />
                                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" />
                                <asp:TemplateField HeaderText="Fecha Nacimiento " ItemStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <%# Eval("FechaNacimiento", "{0:dd/MM/yyyy}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Edad" HeaderText="Edad" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                    <ItemStyle CssClass="text-center" />
                                    <HeaderStyle CssClass="text-center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                                <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                                <asp:TemplateField HeaderText="Acciones" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Button runat="server" Text="✏️ Editar"
                                            CommandName="Editar"
                                            CommandArgument='<%# Eval("Cedula") %>'
                                            CssClass="btn btn-warning btn-sm btn-accion" />
                                        
                                        <asp:Button runat="server" Text="🗑️ Eliminar"
                                            CommandName="Eliminar"
                                            CommandArgument='<%# Eval("Cedula") %>'
                                            CssClass="btn btn-danger btn-sm btn-accion ms-1"
                                            OnClientClick="return confirm('¿Está seguro de eliminar este contacto?\nEsta acción no se puede deshacer.');" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            
                            <EmptyDataTemplate>
                                <div class="text-center py-5">
                                    
                                    <h5 class="text-muted">No hay contactos registrados</h5>
                                </div>
                            </EmptyDataTemplate>
                            
                        </asp:GridView>
                    </div>
                    
                </div>
            </div>
            
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>