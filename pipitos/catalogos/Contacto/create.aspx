<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="pipitos.catalogos.Contacto.create" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--esto es para las notificaciones--%>
    <script src="../../Scripts/toastr.js"></script>

    <ol class="breadcrumb">
	    <li class="breadcrumb-item">
	      <a href="#">Sistema</a>
	    </li>
	    <li class="breadcrumb-item active">Contacto</li>
	    <li class="breadcrumb-item active">Nuevo</li>
    </ol>
    <div class="card">
        <div class="card-header">
          Datos del Contacto
        </div>
        <div class="card-body">
            <div class="row col-md-12">
                <%--<div class="btn-group" role="group">--%>
                    <asp:Button runat="server" ID="btnguardar" cssclass="btn btn-outline-primary btn-sm" OnClick="btnguardar_Click" autopostback="true" Text="Guardar" >
                    </asp:Button>
                    <asp:Button runat="server" ID="btncancelar" cssclass="btn btn-outline-danger btn-sm" Text="Cancelar" >
                    </asp:Button>
                <%--</div>--%>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="txtnombrecontacto">Nombre del Contacto</label>
                    <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtnombrecontacto" />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtnumerotelefono">Numbero de Telefono</label>
                        <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtnumerotelefono" />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtemail">Correo Electronico:</label>
                        <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtemail" />
                  </div>
                </div>
            </div>
            <div class="row">   
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="txtnotas">Notas:</label>
                    <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtnotas" />
                  </div>
                </div>
                </div>
            </div>
        </div>
</asp:content>