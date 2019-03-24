<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="pipitos.planificarrecoleccion.index" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="funciones.js"></script>

    <script>
        $(document).ready(function () {
            $('[id*=gvplanificaciones]').prepend($("<thead></thead>").append($(this)
            .find("tr:first"))).DataTable({
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
	    <li class="breadcrumb-item active">Planificador de recolección</li>
    </ol>

    <div class="card">
        <div class="card-body">
            <div class="row col-md-12">
                <asp:LinkButton runat="server" ID="btnnewplanificacion" cssclass="btn btn-outline-primary btn-sm" OnClick="btnnewplanificacion_Click">
                    <i class="fas fa-plus"></i> Agregar
                </asp:LinkButton>
                 <asp:LinkButton runat="server" id="btnActualizar" onclick="btnActualizar_Click" cssclass="btn btn-outline-success btn-sm ">
                        <i class="fas fa-sync"></i>Actualizar
                        </asp:linkbutton>
            </div>
            <hr />
            <div class="table-responsive">
                <asp:GridView CssClass="table table-hover" ClientIDMode= Static
                     runat="server" ID="gvplanificaciones" BorderColor="Transparent" 
                     AutoGenerateColumns="false" DataKeyNames="numero" OnRowDataBound="gvplanificaciones_RowDataBound">
                        <Columns>
                            <%--<asp:BoundField ReadOnly="True" HeaderText="Planificación n" 
                              InsertVisible="False" DataField="numero"
                                SortExpression="numero">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>--%>
                            <asp:BoundField ReadOnly="True" HeaderText="Fecha de registro" 
                              InsertVisible="False" DataField="fechar"
                                SortExpression="fechar">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Fecha de visita" 
                              InsertVisible="False" DataField="fechav"
                                SortExpression="fechav">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <%--botones de acción sobre los registros...--%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <%--Botones de eliminar y editar cliente...--%>
                                    <asp:LinkButton ID="btnEdit" CommandName="Edit" runat="server" 
                                    CssClass="btn btn-outline-info btn-xs"
                                    data-toggle="tooltip" data-placement="top" title="Editar"
                                    CommandArgument='<%# Container.DataItemIndex %>'
                                    OnCommand="btnEdit_Command">
                                        <i class="far fa-edit"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
            </div>
        </div>
    </div>
</asp:content>
