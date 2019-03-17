<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="rutascreate.aspx.cs" Inherits="pipitos.modales.rutascreate" %>

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
    <form runat="server">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Agregar rutas</h5>
                <hr />
                <div class="row col-md-12">
                    <asp:LinkButton runat="server" ID="btnguardar" 
                    OnClick="btnguardar_Click" cssclass="btn btn-primary btn-sm">
                        <i class="fas fa-plus"></i> agregar
                    </asp:LinkButton>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="cbdonantes">Nombre:</label>
                            <asp:TextBox runat="server" ID="txtnombre" CssClass="form-control form-control-sm"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtnombre"
                            CssClass="text-small text-danger" ErrorMessage="Campo obligatorio" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="cbdonantes">Departamento:</label>
                            <asp:TextBox runat="server" ID="txtdepartamento" CssClass="form-control form-control-sm"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtdepartamento"
                            CssClass="text-small text-danger" ErrorMessage="Campo obligatorio" />
                        </div>
                    </div>
                </div>
                 <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="cbdonantes">Municipio:</label>
                            <asp:TextBox runat="server" ID="txtmunicipio" CssClass="form-control form-control-sm"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtmunicipio"
                            CssClass="text-small text-danger" ErrorMessage="Campo obligatorio" />
                        </div>
                    </div>
                </div>
                 <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="cbdonantes">Distrito:</label>
                            <asp:TextBox runat="server" ID="txtdistrito" CssClass="form-control form-control-sm"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtdistrito"
                            CssClass="text-small text-danger" ErrorMessage="Campo obligatorio" />
                        </div>
                    </div>
                </div>
                 <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="cbdonantes">Barrio:</label>
                            <asp:TextBox runat="server" ID="txtbarrio" CssClass="form-control form-control-sm"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtbarrio"
                            CssClass="text-small text-danger" ErrorMessage="Campo obligatorio" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
