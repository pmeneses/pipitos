<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="pipitos.catalogos.Rutas.Edit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--esto es para las notificaciones--%>
    <script src="../../Scripts/toastr.js"></script>

    <ol class="breadcrumb">
	    <li class="breadcrumb-item">
	      <a href="#">Sistema</a>
	    </li>
	    <li class="breadcrumb-item active">Rutas</li>
	    <li class="breadcrumb-item active">Editar</li>
    </ol>

    <asp:HiddenField ID="idruta" runat="server" />
    <div class="card">
        <div class="card-header">
          Datos para la ruta
        </div>
        <div class="card-body">
            <div class="row col-md-12" style="margin-bottom: 20px;">
                <%--<div class="btn-group" role="group">--%>
                    <asp:Button runat="server" ID="btnguardar" OnClick  ="btnguardar_Click" cssclass="btn btn-outline-primary btn-sm" autopostback="true" Text="Guardar" >
                    </asp:Button>
                    <asp:Button runat="server" ID="btncancelar" cssclass="btn btn-outline-danger btn-sm" Text="Cancelar" >
                    </asp:Button>
                <%--</div>--%>
            </div>
            <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="txtnombreruta">Nombre de la ruta:</label>
                    <asp:TextBox cssclass="form-control" runat="server" ID="txtnombreruta" />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtdepartamento">Departamento:</label>
                        <asp:TextBox cssclass="form-control" runat="server" ID="txtdepartamento" />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtmunicipio">Municipio:</label>
                        <asp:TextBox cssclass="form-control" runat="server" ID="txtmunicipio" />
                  </div>
                </div>
            </div>
            <div class="row">   
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="txtdistrito">Distrito:</label>
                    <asp:TextBox cssclass="form-control" runat="server" ID="txtdistrito" />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtbarrio">Barrio:</label>
                        <asp:TextBox cssclass="form-control" runat="server" ID="txtbarrio" />
                  </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
