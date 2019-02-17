<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="pipitos.Donante.index" %>

<%--El contenedor del HTML de lo que se muestra en la vista index de Web Form Contacto--%> 
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <%--Librerias de jquery--%>
    <%--toastr libreria es para la notificacionkc--%>
    <script src="../../Scripts/toastr.js"></script>
    <%--sweetalert libreria para notificaiones en cual el usario interectua, mensaje que cubre toda la pantalla--%>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="funciones.js"></script>
    <script>
        $(document).ready(function () {
    $('[id*=gvdonante]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
        "bDestroy": true,
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        },
        fixedHeader: {
            header: true,
            footer: true
        }
    });
});
    </script>
    
     <ol class="breadcrumb">
	    <li class="breadcrumb-item">
	      <a href="#">Sistema</a>
	    </li>
	    <li class="breadcrumb-item active">Donante</li>
    </ol>

    <div class="card">
        <div class="card-body">
            <div class="row">
                <%--<asp:Button runat="server" ID="btnNewContacto" cssclass="btn btn-primary btn-lg btn-block" OnClick="btnNewContact_Click"  Text="Agrega Contacto"></asp:Button>--%>
                <asp:LinkButton runat="server" id="btnNewDonante" OnClick="btnNewDonante_Click"
                    class="btn btn-primary">
                    <i class="fas fa-plus"></i> Agregar
                </asp:LinkButton>
            </div>
            <hr />
            <div class="table-responsive">
                <asp:GridView CssClass="table table-hover" ClientIDMode= Static
                    runat="server" ID="gvdonante" BorderColor="Transparent" 
                    AutoGenerateColumns="false" DataKeyNames="iddonante" OnRowDataBound="gvdonante_RowDataBound">
                    <Columns>
                    <asp:BoundField ReadOnly="True" HeaderText="Fecha de Ingreso" 
                        InsertVisible="False" DataField="fechaing"
                        SortExpression="fechaing" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" >
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ReadOnly="True" HeaderText="Nombre Donante" 
                        InsertVisible="False" DataField="nombredon"
                        SortExpression="nombredon">
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="Categoria" 
                        InsertVisible="False" DataField="categoriadon"
                        SortExpression="categoriadon">
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ReadOnly="True" HeaderText="Gerente" 
                        InsertVisible="False" DataField="gerente"
                        SortExpression="gerente">
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ReadOnly="True" HeaderText="Persona de Contacto" 
                        InsertVisible="False" DataField="contacto"
                        SortExpression="contacto">
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <asp:CheckBox runat="server" id="ckestado" 
                            AutoPostBack="false" Checked='<%# DataBinder.Eval(Container.DataItem,"estado") %>' 
                            Enabled="false"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField ReadOnly="True" HeaderText="Dirección" 
                        InsertVisible="False" DataField="direccion"
                        SortExpression="direccion">
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="Ruta" 
                        InsertVisible="False" DataField="ruta"
                        SortExpression="ruta">
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ReadOnly="True" HeaderText="Periocidad" 
                        InsertVisible="False" DataField="preciodidad"
                        SortExpression="preciodidad">
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                    <%--botones de acción sobrte los registros...--%>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <%--Botones de eliminar y editar contacto...--%>

                            <asp:linkButton ID="btnEdit" oncommand="btnEdit_Command" CommandName="Edit" runat="server" Text="Editar" 
                            CssClass="btn btn-outline-info btn-xs" CommandArgument='<%# Container.DataItemIndex %>'
                                data-toggle="tooltip" data-placement="top" 
                                    title="Editar">
                                    <i class="far fa-edit"></i>
                            </asp:linkbutton>
                              
                            
                                <asp:LinkButton ID="btnDelete" runat="server"  
                                    OnClientClick='<%# " return confirmardelete("+ DataBinder.Eval(Container.DataItem,"iddonante") + ");" %>'
                                    CssClass="btn btn-outline-danger btn-xs" data-toggle="tooltip" data-placement="top" 
                                    title="Eliminar" >
                                        <i class="fas fa-trash-alt"></i>
                                    </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:content>
