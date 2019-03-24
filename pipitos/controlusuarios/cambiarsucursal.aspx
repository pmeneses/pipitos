<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="cambiarsucursal.aspx.cs" Inherits="pipitos.controlusuarios.cambiarsucursal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - Mi aplicación ASP.NET</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="../Content/toastr.css" rel="stylesheet"/>
    <link href="../Content/sweetalert.css" rel="stylesheet"/>

    <%--vamnos a agregar css de la plantilla SBADMIN--%>
    <link href="../sbadmin/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet"/>
    <link href="../sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link href="../Content/sbadmin/sb-admin.css" rel="stylesheet"/>

    <link href="../Content/Site.css" rel="stylesheet"/>

    <%--<script src="sbadmin/vendor/jquery/jquery.min.js"></script>--%>
    <script src='<%= ResolveUrl("../sbadmin/vendor/jquery/jquery.min.js") %>'></script>
    <script src='<%= ResolveUrl("../sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js") %>'></script>

    <!-- Core plugin JavaScript-->
    <script src='<%= ResolveUrl("../sbadmin/vendor/jquery-easing/jquery.easing.min.js") %>'></script>

    <!-- Page level plugin JavaScript-->
    <script src='<%= ResolveUrl("../sbadmin/vendor/datatables/jquery.dataTables.js") %>'></script>
    <script src='<%= ResolveUrl("../sbadmin/vendor/datatables/dataTables.bootstrap4.js") %>'></script>

    <!-- Custom scripts for all pages-->
    <script src='<%= ResolveUrl("../Scripts/sbadmin/sb-admin.min.js") %>'></script>
    <script src='<%= ResolveUrl("../Scripts/toastr.js") %>'></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="idusuario" runat="server" />
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Cambiar de sucursal</h5>
                <hr />
                <div class="row col-md-12">
                    <asp:LinkButton runat="server" ID="btnguardar" 
                    OnClick="btnguardar_Click" cssclass="btn btn-primary btn-sm">
                        <i class="fas fa-plus"></i> Aplicar
                    </asp:LinkButton>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="cbsucursales">Sucursales:</label>
                            <asp:DropDownList runat="server" ID="cbsucursales" CssClass="form-control form-control-sm"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="cbsucursales"
                            CssClass="text-small text-danger" ErrorMessage="Campo obligatorio" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
