<%@ Page Language="C#" UnobtrusiveValidationMode="None" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="pipitos.Donante.create" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--esto es para las notificaciones--%>
    <script src="../Scripts/toastr.js"></script>

    <ol class="breadcrumb">
	    <li class="breadcrumb-item">
	      <a href="#">Sistema</a>
	    </li>
	    <li class="breadcrumb-item active">Donante</li>
        <li class="breadcrumb-item active">Nueva</li>
    </ol>

    <div class="card">
        <div class="card-header">
          Ingresar datos del Donante
        </div>
        <div class="card-body">
           <div class="row col-md-12" style="margin-bottom: 20px;">
                <div class="btn-group" role="group">
                   <asp:button runat="server" id="btnguardar" cssclass="btn btn-outline-primary btn-sm" onclick ="btnguardar_Click"  autopostback="true" text="Guardar" >
                    </asp:button>
                    <asp:button runat="server" id="btncancelar" cssclass="btn btn-outline-danger btn-sm" onclick ="btncancelar_Click" CausesValidation="false" Text="Cancelar" >
                    </asp:button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="txtfecharegistro">Fecha de registro:</label>
                    <asp:TextBox TextMode="Date" cssclass="form-control" runat="server" ID="txtfecharegistro" />
                      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtfecharegistro"
                    CssClass="text-danger" ErrorMessage="Seleccion fecha de registro."/>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="txtnombredonante">Nombre Donante</label>
                    <asp:TextBox cssclass="form-control" runat="server" ID="txtnombredonante" />
                      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtnombredonante"
                    CssClass="text-danger" ErrorMessage="Ingresar Nombre del donante."/>
                  </div>
                </div>
                <div class="col-md-4">
                <div class="form-group">
                    <label for="cbcategoria">Categoria:</label>
                    <asp:DropDownList runat="server" ID="cbcategoria" CssClass="form-control"/>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="cbcategoria"
                    CssClass="text-danger" ErrorMessage="Seleccione la categoria."/>
                    </div>
                 </div>

                 <div class="col-md-4">
                    <div class="form-group">
                        <label for="cbentidad">Entidad:</label>
                        <asp:DropDownList runat="server" ID="cbentidad" CssClass="form-control"/>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cbentidad"
                        CssClass="text-danger" ErrorMessage="Seleccione Entidad." />
                     </div>
                 </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label for="cbruta">Ruta:</label>
                        <asp:DropDownList runat="server" ID="cbruta" CssClass="form-control"/>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cbruta"
                        CssClass="text-danger" ErrorMessage="Seleccione la ruta." />
                     </div>
                 </div>
                    
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="txtgerente">Gerente</label>
                    <asp:TextBox cssclass="form-control" runat="server" ID="txtgerente" />
                      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtgerente"
                    CssClass="text-danger" ErrorMessage="Ingresar nombre del gerente."/>
                  </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label for="cbcontacto">Persona de Contacto:</label>
                        <asp:DropDownList runat="server" ID="cbcontacto" CssClass="form-control"/>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cbcontacto"
                        CssClass="text-danger" ErrorMessage="Seleccione Contacto." />
                     </div>
                 </div>

              

            <div class="col-md-4">
                    <div class="form-group">
                        <label for="cbperiocidad">Periocidad</label>
                        <asp:DropDownList runat="server" ID="cbperiocidad" CssClass="form-control"/>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cbperiocidad"
                        CssClass="text-danger" ErrorMessage="Seleccione Periocidad." />
                     </div>
                 </div>

                <div class="col-md-12">
                <div class="form-group">
                    <label for="txtdireccion">Dirección</label>
                    <asp:TextBox textmode="multiline" cssclass="form-control" runat="server" ID="txtdireccion" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtdireccion"
                    CssClass="text-danger" ErrorMessage="Ingresar direccion."/>
                  </div>
                </div>
            </div>
        </div>
    </div>

</asp:content>
