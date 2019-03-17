<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="periocidadcreate.aspx.cs" Inherits="pipitos.modales.periocidadcreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
                <h5 class="card-title">Agregar periocidad</h5>
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
                        <label for="txtnombre">Nombre</label>
                        <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtnombre" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtnombre"
                        CssClass="text-small text-danger" ErrorMessage="Campo obligatorio" />
                      </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <asp:CheckBox Text="Activo" runat="server" ID="ckactiva" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
