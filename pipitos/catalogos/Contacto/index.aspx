<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="pipitos.catalogos.Contacto.index" %>

<%--El contenedor del HTML de lo que se muestra en la vista index de Web Form Contacto--%> 
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <%--Librerias de jquery--%>
    <%--toastr libreria es para la notificacionkc--%>
    <script src="../../Scripts/toastr.js"></script>
    <%--sweetalert libreria para notificaiones en cual el usario interectua, mensaje que cubre toda la pantalla--%>
    <script src="../../Scripts/sweetalert.js"></script>
    
     <ol class="breadcrumb">
	    <li class="breadcrumb-item">
	      <a href="#">Sistema</a>
	    </li>
	    <li class="breadcrumb-item active">Contacto</li>
    </ol>

    <div class="card">
        <div class="card-body">
            <div class="row" style="margin-bottom:10px;">
                <asp:Button runat="server" ID="btnNewContacto" cssclass="btn btn-primary btn-lg btn-block" OnClick="btnNewContact_Click"  Text="Agrega Contacto"></asp:Button>
            </div>
            <div class="row">
                <asp:GridView runat="server">

                </asp:GridView>
                <div class="table-responsive">
                <asp:GridView CssClass="table table-hover table-sm"
                 runat="server" ID="gvcontacto" BorderColor="Transparent" AutoGenerateColumns="false" DataKeyNames="idcontacto">
                    <HeaderStyle BackColor="#337ab7" ForeColor="White" />
                    <RowStyle BorderColor ="#D8D8D8" Font-Size="Small" Height="20px" />
                    <EmptyDataRowStyle forecolor="Red" CssClass="table table-bordered" />
                    <emptydatatemplate>
                        ¡No hay clientes seleccionados!  
                    </emptydatatemplate>  

                    <Columns>
                        <asp:BoundField ReadOnly="True" HeaderText="Nombre Contacto" 
                          InsertVisible="False" DataField="Nombre"
                            SortExpression="Nombre">
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="Numero Telefono" 
                          InsertVisible="False" DataField="Telefono"
                            SortExpression="Telefono">
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="Correo Electronico" 
                          InsertVisible="False" DataField="correo"
                            SortExpression="correo">
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        </asp:BoundField>
                        <%--botones de acción sobre los registros...--%>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="200px">
                            <ItemTemplate>
                                <%--Botones de eliminar y editar cliente...--%>
                                <asp:Button ID="btnEdit" CommandName="Edit" runat="server" Text="Editar" 
                                CssClass="btn btn-outline-info btn-sm" />
                                <asp:Button ID="btnDelete" runat="server" Text="Eliminar" CssClass="btn btn-outline-danger btn-sm" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            </div>
        </div>
    </div>

</asp:content>
