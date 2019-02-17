<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="pipitos.planificarrecoleccion.create" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--esto es para las notificaciones--%>
    <script src="../Scripts/toastr.js"></script>

    <ol class="breadcrumb">
	    <li class="breadcrumb-item">
	      <a href="#">Sistema</a>
	    </li>
	    <li class="breadcrumb-item active">Planificador de recolección</li>
        <li class="breadcrumb-item active">Nueva</li>
    </ol>

    <div class="card">
        <div class="card-header">
          Datos de la planificacion de recolección
        </div>
        <div class="card-body">
            <div class="row col-md-12">
                <asp:LinkButton runat="server" ID="btnguardar" OnClick="btnguardar_Click" cssclass="btn btn-outline-primary btn-sm" autopostback="true" >
                    <i class="fas fa-plus"></i> Crear
                </asp:LinkButton>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="txtfecharegistro">Fecha de registro:</label>
                    <asp:TextBox TextMode="Date" cssclass="form-control form-control-sm" runat="server" ID="txtfecharegistro" />
                  </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="txtfechavisita">Fecha de visita:</label>
                        <asp:TextBox TextMode="Date" cssclass="form-control form-control-sm" runat="server" ID="txtfechavisita" />
                  </div>
                </div>
            </div>
        </div>
    </div>
</asp:content>
