<%@ Page Language="C#" MasterPageFile="~/Site.Master"  UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="pipitos.Donante.edit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <%--esto es para las notificaciones--%>
    <script src="../../Scripts/toastr.js"></script>

    <ol class="breadcrumb">
	    <li class="breadcrumb-item">
	      <a href="#">Sistema</a>
	    </li>
	    <li class="breadcrumb-item active">Donante</li>
	    <li class="breadcrumb-item active">Editar</li>
    </ol>

     <asp:HiddenField ID="iddonante" runat="server" />
    <div class="card">
        <div class="card-header">
          Actualizar datos del donante
        </div>
        <div class="card-body">
            <div class="row col-md-12" style="margin-bottom: 20px;">
              <div class="btn-group" role="group">
                   <asp:Button runat="server" ID="btnguardar" OnClick="btnguardar_Click" cssclass="btn btn-outline-primary btn-sm" autopostback="true" Text="Guardar" >
                    </asp:Button>

                    <asp:Button runat="server" ID="btncancelar" cssclass="btn btn-outline-danger btn-sm" Text="Cancelar" >
                    </asp:Button>
                </div>
            </div>
            <div class="row">
                 <div class="col-md-4">
                  <div class="form-group">
                    <label for="txtfecharegistro">Fecha de Registro:</label>
                      <asp:TextBox TextMode="Date" cssclass="form-control form-control-sm" runat="server" ID="txtfecharegistro" />
                      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtfecharegistro"
                    CssClass="text-danger" ErrorMessage="Seleccion fecha de registro."/>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="txtnombredon">Nombre Donante:</label>
                    <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtnombredon" />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtcategoria">Categoria:</label>
                        <asp:DropDownList runat="server" ID="cbcategoria" AutoPostBack="True" 
                            OnSelectedIndexChanged="cbcategoria_SelectedIndexChanged" CssClass="form-control form-control-sm"/>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="cbcategoria"
                    CssClass="text-danger" ErrorMessage="Seleccione la categoria."/>
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtentidad">Entidad:</label>
                        <asp:DropDownList runat="server" ID="cbentidad" CssClass="form-control form-control-sm"/>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cbentidad"
                        CssClass="text-danger" ErrorMessage="Seleccione Entidad." />
                  </div>
                </div>
                 <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtruta">Ruta:</label>
                      <asp:DropDownList runat="server" ID="cbruta" CssClass="form-control form-control-sm"/>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cbruta"
                        CssClass="text-danger" ErrorMessage="Seleccione la ruta." />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtgerente">Gerente:</label>
                        <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtgerente" />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtpersonacontact">Persona de Contacto:</label>
                        <asp:DropDownList runat="server" ID="cbcontacto" CssClass="form-control form-control-sm"/>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cbcontacto"
                        CssClass="text-danger" ErrorMessage="Seleccione Contacto." />
                  </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtperiocidad">Periocidad:</label>
                        <asp:DropDownList runat="server" ID="cbperiocidad" CssClass="form-control form-control-sm"/>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cbperiocidad"
                        CssClass="text-danger" ErrorMessage="Seleccione Periocidad." />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtdireccion">Direccion:</label>
                        <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtdireccion" />
                  </div>
                </div>

                 
                
            </div>
        </div>
    </div>


  </asp:Content>