<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="agregarmaterial.aspx.cs" Inherits="pipitos.comprobanterecoleccion.agregarmaterial" %>

<!DOCTYPE html>
<html lang="en">
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
        <link href="../sbadmin/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <link href="../sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="../Content/sbadmin/sb-admin.css" rel="stylesheet">

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
    </head>
    <body>
        <form runat="server">
            <asp:HiddenField ID="recibono" runat="server" />
            <div class="card">
                <div class="card-body">
                    <div class="row col-md-12">
                        <asp:LinkButton runat="server" ID="btnguardar" 
                        OnClick="btnguardar_Click" cssclass="btn btn-primary btn-sm">
                            <i class="fas fa-plus"></i> agregar
                        </asp:LinkButton>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="cbdonantes">Material:</label>
                                <asp:DropDownList runat="server" ID="cbmaterial" CssClass="form-control"/>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cbmaterial"
                                CssClass="text-small text-danger" ErrorMessage="Campo obligatorio" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtcantidad">Cantidad:</label>
                                <asp:TextBox TextMode="Number" cssclass="form-control" runat="server" ID="txtcantidad" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcantidad"
                                CssClass="text-small text-danger" ErrorMessage="Campo obligatorio" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <h5><span class="badge badge-primary" runat ="server" id="lbcontador"></span> Materiales agregados</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
