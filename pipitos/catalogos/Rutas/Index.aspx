<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false"  CodeBehind="Index.aspx.cs" Inherits="pipitos.catalogos.Rutas.Index" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--esto es para las notificaciones--%>
    <script src="../../Scripts/toastr.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="funciones.js"></script>
     
    <ol class="breadcrumb">
	    <li class="breadcrumb-item">
	      <a href="#">Sistema</a>
	    </li>
	    <li class="breadcrumb-item active">Rutas</li>
    </ol>

        <div class="card">
            <div class="card-body">
                <div class="row col-md-12">
                    <%--<asp:Button runat="server" ID="btnnewruta" cssclass="btn btn-primary btn-lg btn-block" onclick="btnnewruta_Click" Text="Agregar ruta"></asp:Button>--%>
                    <button runat="server" id="btnnewruta" onserverclick="btnnewruta_Click" 
                        class="btn btn-primary btn-sm">
                        <i class="fas fa-plus"></i> Agregar
                    </button>
                </div>
                <hr />
                <div class="table-responsive">
                    <asp:GridView CssClass="table" ClientIDMode= Static
                     runat="server" ID="gvrutas" BorderColor="Transparent" 
                     AutoGenerateColumns="false" DataKeyNames="Idruta" Width="100%" 
                        OnRowDataBound="gvrutas_RowDataBound">
                        <Columns>
                            <asp:BoundField ReadOnly="True" HeaderText="Nombre" 
                              InsertVisible="False" DataField="Ruta"
                                SortExpression="Ruta">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Departamento" 
                              InsertVisible="False" DataField="Departamento"
                                SortExpression="Departamento">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Municipio" 
                              InsertVisible="False" DataField="Municipio"
                                SortExpression="Municipio">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Distrito" 
                              InsertVisible="False" DataField="Distrito"
                                SortExpression="Distrito">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Barrio" 
                              InsertVisible="False" DataField="Barrio"
                                SortExpression="Barrio">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <%--botones de acción sobre los registros...--%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <%--Botones de eliminar y editar cliente...--%>
                                    <asp:LinkButton ID="btnEdit" CommandName="Edit" runat="server" 
                                    CssClass="btn btn-outline-info btn-xs" CommandArgument='<%# Container.DataItemIndex %>'
                                    OnCommand="btnEdit_Command" data-toggle="tooltip" data-placement="top" 
                                        title="Editar">
                                        <i class="far fa-edit"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server"  
                                    OnClientClick='<%# " return confirmardelete("+ DataBinder.Eval(Container.DataItem,"Idruta") + ");" %>'
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
</asp:Content>
