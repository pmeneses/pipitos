<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="index.aspx.cs" Inherits="pipitos.controlusuarios.index" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>  

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/toastr.js"></script>
    <script>
        $(document).ready(function () {
            $('[id*=gvusuarios]').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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

        function ShowModalPopup(idusuario) {
            $find("mp1").show();
            console.log('llega aqui')
            var x = document.getElementById('irm1');
            x.src = "cambiarsucursal.aspx?idusuario=" + idusuario;
            return false;
        }
        function HideModalPopup() {
            $find("mp1").hide();
            return false;
        }

    </script>

    <cc1:ModalPopupExtender ID="mp1" BehaviorID="mp1" runat="server" PopupControlID="Panl1" 
    TargetControlID ="modalp"
    BackgroundCssClass="Background">  
    </cc1:ModalPopupExtender> 

    <asp:Panel ID="Panl1" runat="server" CssClass="Popup" align="center" style="display:none">  
          <iframe id="irm1" ClientIDMode="Static"
            runat="server" frameborder="0"
            style="border:0px; height: 100%; width:100%"></iframe>  
            <br />  
            <asp:Button ID="Button2" CssClass="btn btn-primary" 
            runat="server" Text="Cerrar" OnClientClick="return HideModalPopup()" />  
    </asp:Panel>
    
    <div id="modalp" runat="server"></div>

    <div class="card">
            <div class="card-body">
                <div class="row col-md-12">
                    <%--<asp:Button runat="server" ID="btnnewruta" cssclass="btn btn-primary btn-lg btn-block" onclick="btnnewruta_Click" Text="Agregar ruta"></asp:Button>--%>
                    <button runat="server" id="btnnewuser" onserverclick="btnnewuser_ServerClick" 
                        class="btn btn-primary btn-sm">
                        <i class="fas fa-plus"></i> Agregar
                    </button>
                </div>
                <hr />
                <%--<div class="table-responsive">--%>
                    <asp:GridView CssClass="table" ClientIDMode= Static
                     runat="server" ID="gvusuarios" BorderColor="Transparent" 
                     AutoGenerateColumns="false" DataKeyNames="Id" OnRowEditing="gvusuarios_RowEditing"
                     OnRowDataBound="gvusuarios_RowDataBound">
                        <Columns>
                            <asp:BoundField ReadOnly="True" HeaderText="Usuario" 
                              InsertVisible="False" DataField="usuario">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Sucursal" 
                              InsertVisible="False" DataField="sucursal">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Nombre" 
                              InsertVisible="False" DataField="nombre">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Apellido" 
                              InsertVisible="False" DataField="apellido">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Activo" 
                              InsertVisible="False" DataField="activo">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnactivar" CommandName="Edit" runat="server" 
                                    CssClass="btn btn-outline-success btn-xs" CommandArgument='<%# Container.DataItemIndex %>'
                                    OnCommand="btnactivar_Command" data-toggle="tooltip" data-placement="top" 
                                    title="Activar">
                                        <i class="fas fa-thumbs-up"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btndesactivar" CommandName="Edit" runat="server" 
                                    CssClass="btn btn-outline-success btn-xs" CommandArgument='<%# Container.DataItemIndex %>'
                                    OnCommand="btndesactivar_Command" data-toggle="tooltip" data-placement="top" 
                                    title="Dar de baja">
                                        <i class="fas fa-thumbs-down"></i>
                                    </asp:LinkButton>
                                    <a href="#" onclick="<%#"return ShowModalPopup("+ string.Concat("'", DataBinder.Eval(Container.DataItem,"Id").ToString(), "'") + ")" %>"
                                    class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="Cambiar sucursal">
                                        <i class="fas fa-exchange-alt"></i>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                <%--</div>--%>
            </div>
        </div>
</asp:content>
