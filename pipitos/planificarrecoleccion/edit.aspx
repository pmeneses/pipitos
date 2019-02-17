<%@ Page Language="C#" UnobtrusiveValidationMode="None" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="pipitos.planificarrecoleccion.edit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--esto es para las notificaciones--%>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="../Scripts/toastr.js"></script>
    <script src="funciones.js"></script>
    <script>
        $(document).ready(function () {
            $('[id*=gvplanificaciondetalle]').prepend($("<thead></thead>").append($(this)
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
        //evitar postback al dar enter
        $(document).keypress(function(e)
        {
            if(e.keyCode === 13)
            {
                e.preventDefault();
                return false;
            }
        });
    </script>

    <asp:HiddenField ID="idplanificacion" runat="server" />

    <ol class="breadcrumb">
	    <li class="breadcrumb-item">
	      <a href="#">Sistema</a>
	    </li>
	    <li class="breadcrumb-item active">Planificador de recolección</li>
        <li class="breadcrumb-item active">Editar</li>
    </ol>

    <div class="card">
        <div class="card-header">
          Datos de la planificacion de recolección
        </div>
        <div class="card-body">
            <div class="row col-md-12" style="margin-bottom: 20px;">
                <div class="btn-group" role="group">
                  <asp:LinkButton runat="server" ID="btnguardar" OnClick="btnguardar_Click" 
                      cssclass="btn btn-outline-primary btn-sm" autopostback="true" >
                    <i class="fas fa-save"></i> Guardar
                  </asp:LinkButton>
                  <asp:LinkButton runat="server" ID="btnadddetalle" OnClick="btnadddetalle_Click" 
                      cssclass="btn btn-outline-primary btn-sm" autopostback="true" >
                    <i class="fas fa-plus"></i> Agregar detalle
                  </asp:LinkButton>
                </div>
            </div>
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
            <div class="card" runat="server" id="paneldetalleplanifiacion" visible ="false">  
                <div class="card-header">
                    Agregar/editar detalle
                </div>
                <div class="card-body">
                    <asp:HiddenField ID="iddetalleselect" runat="server" Value="0"/>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="cbdonantes">Donante:</label>
                                        <asp:DropDownList runat="server" ID="cbdonantes" CssClass="form-control form-control-sm"/>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cbdonantes"
                                        CssClass="text-danger" ErrorMessage="Seleccione el donante." />
                                  </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="cbruta">Ruta:</label>
                                        <asp:DropDownList runat="server" ID="cbruta" CssClass="form-control form-control-sm"/>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cbruta"
                                        CssClass="text-danger" ErrorMessage="Seleccione la ruta." />
                                  </div>
                                </div>
                            </div>
                       </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="ckvisitaR">Observaciones:</label>
                                <asp:TextBox TextMode="MultiLine" runat="server" ID="txtobservaciones" CssClass="form-control form-control-sm"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-check form-check-inline">
                                <asp:RadioButton CssClass="form-check-input" id="rbvisitaP" runat="server" GroupName="RGvisita" Text="Visita pendiente">
                                </asp:RadioButton>
                            </div>
                            <div class="form-check form-check-inline">
                                <asp:RadioButton CssClass="form-check-input" id="rbvisitaR" runat="server" GroupName="RGvisita" Text="Visita realizada">
                                </asp:RadioButton>
                            </div>
                        </div>
                    </div>
                    <div class="row col-md-12" style="margin-top: 10px;">
                        <div class="btn-group" role="group">
                          <asp:LinkButton runat="server" ID="btnguardardetalle" 
                              OnClick="btnguardardetalle_Click" cssclass="btn btn-outline-primary btn-sm" 
                              autopostback="true" >
                            <i class="fas fa-save"></i> Guardar
                          </asp:LinkButton>
                          <asp:LinkButton runat="server" ID="btncerraradddetalle" 
                            OnClick="btncerraradddetalle_Click" cssclass="btn btn-outline-danger btn-sm" 
                            autopostback="true" >
                            <i class="fas fa-times-circle"></i> Cancelar
                          </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="card">
                 <div class="card-header">
                    Detalle de la planificación
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView CssClass="table table-hover" ClientIDMode=Static
                        runat="server" ID="gvplanificaciondetalle" BorderColor="Transparent" 
                        AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"  
                        DataKeyNames="iddetalle" Width="100%" OnRowEditing="gvplanificaciondetalle_RowEditing"
                        OnRowDataBound="gvplanificaciondetalle_RowDataBound">
                            <Columns>
                                <asp:BoundField ReadOnly="True" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Fecha de registro" 
                                    InsertVisible="False" DataField="fecharegistro"
                                    SortExpression="fecharegistro">
                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField ReadOnly="True" HeaderText="Donante" 
                                    InsertVisible="False" DataField="donante"
                                    SortExpression="donante">
                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Visita realizada">
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" id="ckvisitaR" 
                                        AutoPostBack="false" Checked='<%# DataBinder.Eval(Container.DataItem,"visitarealizada") %>' 
                                        Enabled="false"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField ReadOnly="True" HeaderText="Ruta" 
                                    InsertVisible="False" DataField="ruta"
                                    SortExpression="ruta">
                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField ReadOnly="True" HeaderText="Observaciones" 
                                    InsertVisible="False" DataField="observaciones"
                                    SortExpression="observaciones">
                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <%--botones de acción sobre los registros...--%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%--Botones de eliminar y editar cliente...--%>
                                        <asp:LinkButton ID="btnEditD" CommandName="Edit" runat="server" 
                                        CssClass="btn btn-outline-info btn-xs" CommandArgument='<%# Container.DataItemIndex %>'
                                        OnCommand="btnEditD_Command" data-toggle="tooltip" data-placement="top" 
                                        title="Editar">
                                            <i class="far fa-edit"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnvisitaR" CommandName="Edit" runat="server" 
                                        CssClass="btn btn-outline-success btn-xs" CommandArgument='<%# Container.DataItemIndex %>'
                                        OnCommand="btnvisitaR_Command" data-toggle="tooltip" data-placement="top" 
                                        title="Marcar como visita realizada">
                                            <i class="fas fa-thumbs-up"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnvisitaP" CommandName="Edit" runat="server" 
                                        CssClass="btn btn-outline-success btn-xs" CommandArgument='<%# Container.DataItemIndex %>'
                                        OnCommand="btnvisitaP_Command" data-toggle="tooltip" data-placement="top" 
                                        title="Marcar como visita pendiete">
                                            <i class="fas fa-thumbs-down"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnDelete" runat="server"  
                                        OnClientClick='<%# " return confirmardelete("+ DataBinder.Eval(Container.DataItem,"iddetalle") + ");" %>'
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
        </div>
    </div>
</asp:content>
