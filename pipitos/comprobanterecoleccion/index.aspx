<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="pipitos.comprobanterecoleccion.index" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/toastr.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script>
        $(document).ready(function () {
            $('[id*=gvcomprobantes]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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
	    <li class="breadcrumb-item active"> Comprobante recolección</li>
    </ol>

    <div class="card">
            <div class="card-body">
                <div class="row col-md-12">
                    <button runat="server" id="btnnewcomprobante" onserverclick="btnnewcomprobante_ServerClick" 
                        class="btn btn-primary">
                        <i class="fas fa-plus"></i> Agregar
                    </button>
                </div>
                <hr />
                <div class="row">
                   <div class="col-md-12">
                           <asp:GridView CssClass="table table-bordered dt-responsive" ClientIDMode= Static
                     runat="server" ID="gvcomprobantes" BorderColor="Transparent" 
                     AutoGenerateColumns="false" Width="100%" DataKeyNames="norecibo">
                        <Columns>
                            <asp:BoundField ReadOnly="True" HeaderText="Recibo No" 
                              InsertVisible="False" DataField="norecibo"
                                SortExpression="norecibo">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Fecha" 
                              InsertVisible="False" DataField="fecha"
                                SortExpression="fecha">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Recibimos de" 
                              InsertVisible="False" DataField="recibimosde"
                                SortExpression="recibimosde">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="En concepto de" 
                              InsertVisible="False" DataField="enconceptode"
                                SortExpression="enconceptode">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Recibido por" 
                              InsertVisible="False" DataField="recibidopor"
                                SortExpression="recibidopor">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <%--botones de acción sobre los registros...--%>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="200px">
                                <ItemTemplate>
                                    <%--Botones de eliminar y editar cliente...--%>
                                    <asp:LinkButton ID="btnEdit" CommandName="Edit" runat="server" 
                                    CssClass="btn btn-primary btn-sm" CommandArgument='<%# Container.DataItemIndex %>'
                                    OnCommand="btnEdit_Command" data-toggle="tooltip" data-placement="top" 
                                    title="Editar">
                                        <i class="far fa-edit"></i>
                                    </asp:LinkButton>
                                   <%-- <asp:LinkButton ID="btnDelete" runat="server"  
                                    OnClientClick='<%# " return confirmardelete("+ DataBinder.Eval(Container.DataItem,"Idruta") + ");" %>'
                                    CssClass="btn btn-outline-danger btn-sm" data-toggle="tooltip" data-placement="top" 
                                        title="Eliminar" >
                                        <i class="fas fa-trash-alt"></i>
                                    </asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
               </div>
                </div>
            </div>
        </div>
</asp:content>
