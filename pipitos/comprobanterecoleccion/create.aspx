<%@ Page Language="C#" UnobtrusiveValidationMode="None" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="pipitos.comprobanterecoleccion.create" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>  
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/toastr.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="funciones.js"></script>
    <script>
        $(document).ready(function () {
            $('[id*=gvdetalle]').prepend($("<thead></thead>").append($(this)
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
                    "header": true,
                    "footer": true
                }
            });
        });

        function ShowModalPopup() {
            $find("mp1").show();
            var x = document.getElementById('irm1');
            x.src = "agregarmaterial.aspx?recibono=" + document.getElementById('txtrecibono').value;
            return false;
        }
        function HideModalPopup() {
            $find("mp1").hide();
            return false;
        }
    </script>

    <cc1:ModalPopupExtender ID="mp1" BehaviorID="mp1" runat="server" PopupControlID="Panl1" 
    TargetControlID ="btnadddetalle"
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

    <ol class="breadcrumb">
	    <li class="breadcrumb-item">
	      <a href="#">Sistema</a>
	    </li>
	    <li class="breadcrumb-item active">Comprobante de recolección</li>
	    <li class="breadcrumb-item active">Nuevo</li>
    </ol>

    <div class="card">
        <div class="card-body">
            <div class="row col-md-12">
                <div class="btn-group" role="group">
                    <asp:Button runat="server" ID="btnguardar" 
                        cssclass="btn btn-primary btn-sm" 
                        OnClick="btnguardar_Click" 
                        Text="Guardar" >
                    </asp:Button>
                    <asp:Button runat="server" ID="btncancelar" 
                        cssclass="btn btn-primary btn-sm" Text="Cancelar" >
                    </asp:Button>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="txtrecibono">Recibo No</label>
                    <asp:TextBox cssclass="form-control form-control-sm" TextMode="Number" 
                    runat="server" ID="txtrecibono" ClientIDMode="Static" />
                      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtrecibono"
                        CssClass="text-small text-danger" ErrorMessage="Campo obligatorio." />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtfecha">Fecha</label>
                        <asp:TextBox cssclass="form-control form-control-sm" TextMode="Date" runat="server" ID="txtfecha"  />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtfecha"
                        CssClass="text-small text-danger" ErrorMessage="Campo obligatorio." />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="cbdonantes">Donante</label>
                        <asp:DropDownList runat="server" ID="cbdonantes" CssClass="form-control form-control-sm"/>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cbdonantes"
                        CssClass="text-small text-danger" ErrorMessage="Seleccione el donante." />
                  </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtemail">Por cuenta de:</label>
                        <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtporcuentade" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtporcuentade"
                        CssClass="text-small text-danger" ErrorMessage="Campo obligatorio." />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtemail">Entregado por:</label>
                        <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtentregadopor" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtentregadopor"
                        CssClass="text-small text-danger" ErrorMessage="Campo obligatorio." />
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="txtemail">Recibido por:</label>
                        <asp:TextBox cssclass="form-control form-control-sm" runat="server" ID="txtrecibidopor" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtrecibidopor"
                        CssClass="text-small text-danger" ErrorMessage="Campo obligatorio." />
                  </div>
                </div>
            </div>
            <div class="row">   
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="txtenconceptode">En concepto de:</label>
                    <asp:TextBox TextMode="MultiLine" cssclass="form-control form-control-sm" runat="server" ID="txtenconceptode" />
                      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtenconceptode"
                        CssClass="text-small text-danger" ErrorMessage="Campo obligatorio." />
                  </div>
                </div>
                </div>
            <hr />
            <div class="row col-md-12">
                <div class="btn-group" role="group">
                    <asp:Button Enabled="false" runat="server" CausesValidation="false"  
                     ID="btnadddetalle" cssclass="btn btn-primary btn-sm"
                     OnClientClick="return ShowModalPopup()"
                     Text="Agregar material" >
                    </asp:Button>
                    <asp:Button Enabled="false" runat="server" CausesValidation="false"  ID="btnrefresh" 
                        cssclass="btn btn-primary btn-sm" 
                     OnClick="btnrefresh_Click" Text="Actualizar" >
                    </asp:Button>
                </div>
            </div>
            <hr />
            <div class="table-responsive">
                <asp:GridView CssClass="table table-hover" ClientIDMode= Static
                runat="server" ID="gvdetalle" BorderColor="Transparent" 
                AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" Width="100%" 
                DataKeyNames="id_recolecta" OnRowDataBound="gvdetalle_RowDataBound">
                        <Columns>
                            <asp:BoundField ReadOnly="True" HeaderText="Material" 
                              InsertVisible="False" DataField="nombre_material"
                                SortExpression="nombre_material">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Cantidad" 
                              InsertVisible="False" DataField="cantidad"
                                SortExpression="cantidad">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Precio" 
                              InsertVisible="False" DataField="precio"
                                SortExpression="precio">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="True" HeaderText="Precio total" 
                              InsertVisible="False" DataField="ptotal"
                                SortExpression="ptotal">
                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </asp:BoundField>
                            <%--botones de acción sobre los registros...--%>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%--Botones de eliminar y editar cliente...--%>
                                    <asp:LinkButton ID="btnDelete" runat="server"  
                                    OnClientClick='<%# " return confirmardelete("+ DataBinder.Eval(Container.DataItem,"id_recolecta") + ");" %>'
                                    CssClass="btn btn-primary btn-sm" data-toggle="tooltip" data-placement="top" 
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
