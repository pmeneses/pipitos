<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="create.aspx.cs" Inherits="pipitos.controlusuarios.create" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../Scripts/toastr.js"></script>

    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Crear usuario</h5>
            <hr />
            <div class="row col-md-12">
                <asp:Button runat="server" ID="btnguardar" OnClick="btnguardar_Click" 
                cssclass="btn btn-outline-primary btn-sm" autopostback="true" Text="Guardar" >
                </asp:Button>
                <asp:Button runat="server" ID="btncancelar" 
                cssclass="btn btn-outline-danger btn-sm" Text="Cancelar" >
                </asp:Button>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="txtcodigo">Codigo:</label>
                    <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtcodigo" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcodigo"
                        CssClass="text-danger" ErrorMessage="Campo requerido"/>
                  </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="txtnombres">Nombres:</label>
                        <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtnombres" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtnombres"
                        CssClass="text-danger" ErrorMessage="Campo requerido"/>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="txtapellido">Apellidos:</label>
                    <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtapellido" />
                      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtapellido"
                        CssClass="text-danger" ErrorMessage="Campo requerido"/>
                  </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="cbsucursal">Sucursal:</label>
                        <asp:DropDownList runat="server" ID="cbsucursal" CssClass="form-control form-control-sm"/>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cbsucursal"
                        CssClass="text-danger" ErrorMessage="Campo requerido"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-check form-check-inline">
                        <asp:CheckBox CssClass="form-check-input" id="ckactivo" runat="server" Text="Activo">
                        </asp:CheckBox>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:content>
