<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="pipitos.catalogos.Contacto.index" %>

<%--El contenedor del HTML de lo que se muestra en la vista index de Web Form Contacto--%> 
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <%--Librerias de jquery--%>
    <%--toastr libreria es para la notificacionkc--%>
    <script src="../../Scripts/toastr.js"></script>
    <%--sweetalert libreria para notificaiones en cual el usario interectua, mensaje que cubre toda la pantalla--%>
    <script src="../../Scripts/sweetalert.js"></script>
    <script>
        $(document).ready(function () {
    $('[id*=gvcontacto]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });
});
    </script>
    
     <ol class="breadcrumb">
	    <li class="breadcrumb-item">
	      <a href="#">Sistema</a>
	    </li>
	    <li class="breadcrumb-item active">Contacto</li>
    </ol>

    <div class="card">
        <div class="card-body">
            <div class="row" style="margin-bottom:10px;">
                <%--<asp:Button runat="server" ID="btnNewContacto" cssclass="btn btn-primary btn-lg btn-block" OnClick="btnNewContact_Click"  Text="Agrega Contacto"></asp:Button>--%>
                  <asp:LinkButton runat="server" id="btnNewContacto" OnClick="btnNewContact_Click" 
                        class="btn btn-primary">
                        <i class="fas fa-plus"></i> Agregar
                    </asp:LinkButton>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView CssClass="table table-hover table-sm" ClientIDMode= Static
                 runat="server" ID="gvcontacto" BorderColor="Transparent" AutoGenerateColumns="false" DataKeyNames="idcontacto">
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
                                <%--Botones de eliminar y editar contacto...--%>

                                <asp:linkButton ID="btnEdit" oncommand="btnEdit_Command" CommandName="Edit" runat="server" Text="Editar" 
                                CssClass="btn btn-outline-info btn-sm" CommandArgument='<%# Container.DataItemIndex %>'
                                    data-toggle="tooltip" data-placement="top" 
                                        title="Editar">
                                     <i class="far fa-edit"></i>
                                </asp:linkbutton>
                              
                            <asp:LinkButton ID="btnDelete" runat="server"  
                                    OnClientClick='<%# " return confirmardelete("+ DataBinder.Eval(Container.DataItem,"idcontacto") + ");" %>'
                                    CssClass="btn btn-outline-danger btn-sm" data-toggle="tooltip" data-placement="top" 
                                        title="Eliminar">
                                        <i class="fas fa-trash-alt"></i>
                                </asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>
                
            </div>
        </div>
    </div>

</asp:content>
