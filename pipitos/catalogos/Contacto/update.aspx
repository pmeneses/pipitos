<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="update.aspx.cs" Inherits="pipitos.catalogos.Contacto.update" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <%--esto es para las notificaciones--%>
    <script src="../../Scripts/toastr.js"></script>

    <ol class="breadcrumb">
	    <li class="breadcrumb-item">
	      <a href="#">Sistema</a>
	    </li>
	    <li class="breadcrumb-item active">Contactos</li>
	    <li class="breadcrumb-item active">Editar</li>
    </ol>

     <asp:HiddenField ID="idcontacto" runat="server" />
    <div class="card">
        <div class="card-header">
          Actualizar datos del contacto
        </div>
        <div class="card-body">
            <div class="row col-md-12" style="margin-bottom: 20px;">
                <%--<div class="btn-group" role="group">--%>
                    <asp:Button runat="server" ID="btnguardar" OnClick ="btnguardar_Click" cssclass="btn btn-outline-primary btn-sm" autopostback="true" Text="Guardar" >
                    </asp:Button>

                    <asp:Button runat="server" ID="btncancelar" cssclass="btn btn-outline-danger btn-sm" Text="Cancelar" >
                    </asp:Button>
                <%--</div>--%>
            </div>
            <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="txtnombre">Nombre Contacto:</label>
                    <asp:TextBox cssclass="form-control" runat="server" ID="txtnombre" />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtnumtelefono">Número de telefono:</label>
                        <asp:TextBox cssclass="form-control" runat="server" ID="txtnumtelefono" />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtemail">CorreoElectronico:</label>
                        <asp:TextBox cssclass="form-control" runat="server" ID="txtemail" />
                  </div>
                </div>
                 <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtnota">Notas:</label>
                        <asp:TextBox cssclass="form-control" runat="server" ID="txtnota" />
                  </div>
                </div>
            </div>
        </div>
    </div>
















  </asp:Content>