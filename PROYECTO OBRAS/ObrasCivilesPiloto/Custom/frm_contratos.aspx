<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="frm_contratos.aspx.cs" Inherits="Custom_frm_contratos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css"  rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>
      
       <script type="text/javascript">
        $(function () {
            dialog = $("#dialog-form").dialog({
                autoOpen: false,
                height: 300,
                width: 350,
                modal: true,
                buttons: {
                    "Crear nuevo presupuesto": function () {

                        var contrato = $("[id*=txtCodigo]").val(); //Obtenemos el primer parametro
                        var nombreContrato = $("[id*=txtNombre]").val(); //Obtenemos el segundo parametro
                        var tipoObra = $("[id*=ddlTipoObraInsert]").val(); //Obtenemos el tercero parametro
                        var Oferente = $("[id*=ddlOferenteInsert]").val(); //Obtenemos el cuarto parametro
                        var interventor = $("[id*=ddlInterventorInsert]").val(); //Obtenemos el quinto parametro
                        var Asignacion = $("[id*=ddlAsignacion]").val(); //Obtenemos el sexto parametro
                        var Supervisor = $("[id*=ddlSupervisor]").val(); //Obtenemos el septimo parametro
                        var Contratante = $("[id*=ddlContratanteins]").val(); //Obtenemos el octavo parametro
                        var Valor = $("[id*=txtValor]").val(); //Obtenemos el noveno parametro
                        var Subsidio = $("[id*=txtSubsidio]").val(); //Obtenemos el noveno parametro
                        var Beneficiario = $("[id*=txtAportesBeneficiario]").val(); //Obtenemos el noveno parametro
                        var aportesContratante = $("[id*=txtAportesContratante]").val(); //Obtenemos el noveno parametro
                        var Predio = $("[id*=ddlPredio]").val(); //Obtenemos el noveno parametro
                        var Proyecto = $("[id*=ddlProyecto]").val(); //Obtenemos el noveno parametro
                        var Estado = $("[id*=ddlEstado]").val(); //Obtenemos el noveno parametro
                        var PlazoInicial = $("[id*=txtPlazoIncial]").val(); //Obtenemos el noveno parametro
                        var PlazoAdicional = $("[id*=txtPlazoAdicionalIns]").val(); //Obtenemos el noveno parametro
                        var tiempoSuspencion = $("[id*=txtTiempoSuspencionIns]").val(); //Obtenemos el noveno parametro
                        var PlazoTotal = $("[id*=txtPlazoTotalIns]").val(); //Obtenemos el noveno parametro
                        var fechaInicio = $("[id*=txtFechaInicio]").val(); //Obtenemos el noveno parametro
                        var fechaReinicio = $("[id*=txtFechaReinicio]").val(); //Obtenemos el noveno parametro
                        var fechaTerminacion = $("[id*=txtFechaTerminacion]").val(); //Obtenemos el noveno parametro                 
                                              $.ajax({

                            type: "POST",
                            url: "frm_contratos.aspx/InsertContrato",
                            data: '{"contrato": "' + contrato +
                            '", "nombreContrato": "' + nombreContrato +
                            '", "tipoObra": "' + tipoObra +
                            '", "Oferente": "' + Oferente +
                            '", "interventor": "' + interventor +
                            '", "Asignacion": "' + Asignacion +
                            '", "Supervisor": "' + Supervisor +
                            '", "Contratante": "' + Contratante +
                            '", "Valor": "' + Valor +
                            '", "Subsidio": "' + Subsidio +
                            '", "Beneficiario": "' + Beneficiario +
                            '", "aportesContratante": "' + aportesContratante +
                            '", "Predio": "' + Predio +
                            '", "Proyecto": "' + Proyecto +
                            '", "Estado": "' + Estado +
                            '", "PlazoInicial": "' + PlazoInicial +
                            '", "PlazoAdicional": "' + PlazoAdicional +
                            '", "tiempoSuspencion": "' + tiempoSuspencion +
                            '", "PlazoTotal": "' + PlazoTotal +
                            '", "fechaInicio": "' + fechaInicio +
                            '", "fechaReinicio": "' + fechaReinicio +
                            '", "fechaTerminacion": "' + fechaTerminacion + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultado,
                            error: errores
                        });
                    },
                    Cancel: function () {
                        dialog.dialog("close");
                    }
                },
                
            });

            function resultado(msg) {
                alert('Presupuesto creado');
                $("#dialog-form").dialog("close");

            }

            function errores(msg) {

                //msg.responseText tiene el mensaje de error enviado por el servidor

                alert('Error: ' + msg.responseText);

            }

            $("#btnAdicionar").button().on("click", function () {
                dialog.dialog("open");
            });
        });
        
       </script>
  
      
  
      
    <div id="dialog-form" title="Crear nuevo presupuesto">
       
        <h2>Insertar Presupuesto Nuevo</h2>
        <table>
            <tr>
                
                <td>
                    <asp:Label runat="server" Text="Codigo:"></asp:Label>
                </td>
                <td>
                    <asp:textbox runat="server" id="txtCodigo" CssClass="numeric"></asp:textbox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Nombre:"></asp:Label>
                </td>
                <td>
                    <asp:textbox runat="server" id="txtNombre"></asp:textbox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Tipo de Obra:"></asp:Label>
                </td>
                <td>
                    <asp:dropdownlist runat="server" id="ddlTipoObraInsert"></asp:dropdownlist>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Oferente:"></asp:Label>
                </td>
                <td>
                    <asp:dropdownlist runat="server" id="ddlOferenteInsert"></asp:dropdownlist>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Interventor:"></asp:Label>
                </td>
                <td>
                    <asp:dropdownlist runat="server" id="ddlInterventorInsert"></asp:dropdownlist>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Asignacion:"></asp:Label>
                </td>
                <td>
                    <asp:dropdownlist runat="server" id="ddlAsignacion"></asp:dropdownlist>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Supervisor:"></asp:Label>
                </td>
                <td>
                    <asp:dropdownlist runat="server" id="ddlSupervisor"></asp:dropdownlist>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Contratante:"></asp:Label>
                </td>
                <td>
                    <asp:dropdownlist runat="server" id="ddlContratanteins"></asp:dropdownlist>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Valor:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtValor" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Subsidio:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSubsidio" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Aportes Beneficiario:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAportesBeneficiario" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Aportes Contratante:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAportesContratante" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="chip predio:"></asp:Label>
                </td>
                <td>
                    <asp:dropdownlist runat="server" id="ddlPredio"></asp:dropdownlist>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Proyecto:"></asp:Label>
                </td>
                <td>
                    <asp:dropdownlist runat="server" id="ddlProyecto"></asp:dropdownlist>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Estado:"></asp:Label>
                </td>
                <td>
                    <asp:dropdownlist runat="server" id="ddlEstado"></asp:dropdownlist>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Plazo Inicial:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPlazoIncial" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Plazo Adicional:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPlazoAdicionalIns" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Tiempo Suspencion:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTiempoSuspencionIns" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label runat="server" Text="Plazo Total:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPlazoTotalIns" runat="server"></asp:TextBox>
                </td>
            </tr>
            
             <tr>
                <td>
                    <asp:Label runat="server" Text="FechaActaInicio:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFechaInicio" runat="server"></asp:TextBox>
                </td>
            </tr>
               <tr>
                <td>
                    <asp:Label runat="server" Text="FechaActaReinicio:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFechaReinicio" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="FechaTerminacion:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFechaTerminacion" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
      
    </div>
 
    <script type="text/javascript">
        $(function () {
            $('.numeric').numeric(",");
            $('.numeric').focus(function () { $(this).css('background-color', '#ECF8E0'); });
            $('.numeric').blur(function () { $(this).css('background-color', 'white'); });
        });

    </script>
    
    <h1>Presupuesto</h1>
    
    <div><input id="btnAdicionar" type="button" value="+" /></div>
    
    
    <asp:GridView ID="gvMaster" runat="server" EnableModelValidation="True" CssClass="gridview" AlternatingRowStyle-CssClass="even" AllowSorting="True" EmptyDataText="No se encontraron contratos" OnRowCancelingEdit="gvMaster_RowCancelingEdit" OnRowDeleting="gvMaster_RowDeleting" OnRowEditing="gvMaster_RowEditing" OnSelectedIndexChanged="gvMaster_SelectedIndexChanged" OnRowUpdating="gvMaster_RowUpdating" AutoGenerateColumns="False" OnRowCommand="gvMaster_RowCommand" DataKeyNames="IdTipoObra,TerceroOferente,terceroInterventor,tercerosupervisor,terceroContratante,IdAsignacion,IdEstado,Proyecto,PredioContrato,FechaActaInicio,FechaReinicio,FechaTerminacion,CodigoContrato,NombreContrato,ValorContrato,ValorSubsidio,ValorAportesBeneficiario,ValorAportesOferente,PlazoInicial,PlazoAdicional,TiempoSuspencion,PlazoTotal"
         PageSize="10" PagerSettings-Visible ="true">
<AlternatingRowStyle CssClass="even"></AlternatingRowStyle>
        <Columns>
           
            <asp:CommandField ShowDeleteButton="True" />
            <asp:CommandField ShowSelectButton="True" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("CodigoContrato") %>' CommandName="EditRow">Editar</asp:LinkButton>
                    
                </ItemTemplate>
                <EditItemTemplate>
                    <table>
                        <tr>
                      <td><asp:LinkButton ID="lnkUpdate" runat="server" CommandArgument='<%#Eval("CodigoContrato") %>' CommandName="UpdateRow">Actualizar</asp:LinkButton></td>
                      <td><asp:LinkButton ID="lnkCancel" runat="server" CommandArgument='<%#Eval("CodigoContrato") %>' CommandName="CancelUpdate">Cancelar</asp:LinkButton></td>
                      </tr>
                    </table>
                 </EditItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField Text="Detalle" DataNavigateUrlFields="CodigoContrato,IdEstado"  DataNavigateUrlFormatString="~\DynamicData\CustomPages\DetalleContrato.aspx?CodigoContrato={0}&IdEstado={1}">
            <ControlStyle ForeColor="#3366FF" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="IdTipoObra" HeaderText="IdTipoObra" Visible="False" />
            <asp:BoundField DataField="TerceroOferente" HeaderText="TerceroOferente" Visible="False" />
            <asp:BoundField DataField="terceroInterventor" HeaderText="terceroInterventor" Visible="False" />
            <asp:BoundField DataField="tercerosupervisor" HeaderText="tercerosupervisor" Visible="False" />
            <asp:BoundField DataField="terceroContratante" HeaderText="terceroContratante" Visible="False" />
            <asp:BoundField DataField="IdAsignacion" HeaderText="IdAsignacion" Visible="False" />
            <asp:BoundField DataField="IdEstado" HeaderText="IdEstado" Visible="False" />
            <asp:BoundField DataField="Proyecto" HeaderText="Proyecto" Visible="False" />
            <asp:BoundField DataField="PredioContrato" HeaderText="Predio" Visible="False" />
            <asp:BoundField DataField="FechaActaInicio" HeaderText="FechaActaInicio" Visible="False" />
            <asp:BoundField DataField="FechaReinicio" HeaderText="FechaReinicio" Visible="False" />
            <asp:BoundField DataField="FechaTerminacion" HeaderText="FechaTerminacion" Visible="False" />
            <asp:BoundField DataField="CodigoContrato" HeaderText="CodigoContrato" Visible="False" />
            <asp:BoundField DataField="NombreContrato" HeaderText="NombreContrato" Visible="False" />
            <asp:BoundField DataField="ValorContrato" HeaderText="ValorContrato" Visible="False" />
            <asp:BoundField DataField="ValorSubsidio" HeaderText="ValorSubsidio" Visible="False" />
            <asp:BoundField DataField="ValorAportesBeneficiario" HeaderText="ValorAportesBeneficiario" Visible="False" />
            <asp:BoundField DataField="ValorAportesOferente" HeaderText="ValorAportesOferente" Visible="False" />
            <asp:BoundField DataField="PlazoAdicional" HeaderText="PlazoAdicional" Visible="False" />
            <asp:BoundField DataField="PlazoInicial" HeaderText="PlazoInicial" Visible="False" />
            <asp:BoundField DataField="TiempoSuspencion" HeaderText="TiempoSuspencion" Visible="False" />
            <asp:BoundField DataField="PlazoTotal" HeaderText="PlazoTotal" Visible="False" />
            <asp:TemplateField HeaderText="Codigo">
                <ItemTemplate>
                    <%#Eval("CodigoContrato") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtCodigoContrato" runat="server"></asp:TextBox>
                </EditItemTemplate>
               
            </asp:TemplateField>
               <asp:TemplateField HeaderText="Nombre">
                <ItemTemplate>
                    <%#Eval("NombreContrato") %>
                </ItemTemplate>
                    <EditItemTemplate>
                    <asp:TextBox ID="txtNombreContrato" runat="server"></asp:TextBox>
                </EditItemTemplate>
           </asp:TemplateField>
                <asp:TemplateField HeaderText="Valor">
                <ItemTemplate>
                    <%#Eval("ValorContrato") %>
                </ItemTemplate>
                     <EditItemTemplate>
                    <asp:TextBox ID="txtValorContrato" runat="server" CssClass="numeric"></asp:TextBox>
                </EditItemTemplate>
           </asp:TemplateField>
                 <asp:TemplateField HeaderText="ValorSubsidio">
                <ItemTemplate>
                    <%#Eval("ValorSubsidio") %>
                </ItemTemplate>
                      <EditItemTemplate>
                    <asp:TextBox ID="txtValorSubsidio" runat="server" CssClass="numeric"></asp:TextBox>
                </EditItemTemplate>
           </asp:TemplateField>
                  <asp:TemplateField HeaderText="AportesBeneficiario">
                <ItemTemplate>
                    <%#Eval("ValorAportesBeneficiario") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtValorAportesBeneficiario" runat="server" CssClass="numeric"></asp:TextBox>
                </EditItemTemplate>
           </asp:TemplateField>
                   <asp:TemplateField HeaderText="AportesContratante">
                <ItemTemplate>
                    <%#Eval("ValorAportesOferente") %>
                </ItemTemplate>
                         <EditItemTemplate>
                    <asp:TextBox ID="txtValorAportesOferente" runat="server" CssClass="numeric"></asp:TextBox>
                </EditItemTemplate>
           </asp:TemplateField>
                    <asp:TemplateField HeaderText="PlazoAdicional">
                <ItemTemplate>
                    <%#Eval("PlazoAdicional") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPlazoAdicional" runat="server" CssClass="numeric"></asp:TextBox>
                </EditItemTemplate>

           </asp:TemplateField >
               <asp:TemplateField HeaderText="PlazoInicial">
                <ItemTemplate>
                    <%#Eval("PlazoInicial") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPlazoInicial" runat="server" CssClass="numeric"></asp:TextBox>
                </EditItemTemplate>

           </asp:TemplateField >
                     <asp:TemplateField HeaderText="TiempoSuspencion">
                <ItemTemplate>
                    <%#Eval("TiempoSuspencion") %>
                </ItemTemplate>
                         <EditItemTemplate>
                    <asp:TextBox ID="txtTiempoSuspencion" runat="server" CssClass="numeric"></asp:TextBox>
                </EditItemTemplate>
           </asp:TemplateField>
                      <asp:TemplateField HeaderText="PlazoTotal">
                <ItemTemplate>
                    <%#Eval("PlazoTotal") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPlazoTotal" runat="server" CssClass="numeric"></asp:TextBox>
                </EditItemTemplate>
           </asp:TemplateField>
            <asp:TemplateField HeaderText="Obra">
                <ItemTemplate>
                    <%#Eval("DescripcionObra") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTipoObra" runat="server" ></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Oferente">
                <ItemTemplate>
                    <%#Eval("Oferente") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlOferente" runat="server" ></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Interventor">
                <ItemTemplate>
                    <%#Eval("interventor") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlinterventor" runat="server"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AsignacionObra">
                <ItemTemplate>
                    <%#Eval("DescripcionAsignacion") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlDescripcionAsignacion" runat="server" ></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Supervisor">
                <ItemTemplate>
                    <%#Eval("supervisor") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlsupervisor" runat="server"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contratante">
                <ItemTemplate>
                    <%#Eval("contratante") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlcontratante" runat="server" ></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
                        <asp:TemplateField HeaderText="Predio">
                <ItemTemplate>
                    <%#Eval("PredioContrato") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlPredioContrato" runat="server"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="Proyecto">
                <ItemTemplate>
                    <%#Eval("Proyecto") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlProyecto" runat="server" ></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="Estado">
                <ItemTemplate>
                    <%#Eval("DescripcionEstado") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlDescripcionEstado" runat="server"  ></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="FechaActaInicio">
                <ItemTemplate>
                    <%#Eval("FechaActaInicio") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPickerFechaInicio" runat="server"></asp:TextBox>                    
                </EditItemTemplate>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="FechaReinicio">
                <ItemTemplate>
                    <%#Eval("FechaReinicio") %>
                </ItemTemplate>
                <EditItemTemplate>
                                      <asp:TextBox ID="txtPickerFechaReinicio" runat="server"></asp:TextBox>                    
                </EditItemTemplate>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="FechaTerminacion">
                <ItemTemplate>
                    <%#Eval("FechaTerminacion") %>
                </ItemTemplate>
                <EditItemTemplate>
                      <asp:TextBox ID="txtPickerFechaTerminacion" runat="server" ></asp:TextBox>                    
                 
                </EditItemTemplate>
            </asp:TemplateField>
           
        </Columns>
        <SelectedRowStyle BackColor="#6699FF" BorderColor="#000066" />
    </asp:GridView>
    <div id="dialog" style="display: none">
    This is a simple popup
</div>
  <script type="text/javascript">
        $.datepicker.regional['es'] = {
            closeText: 'Cerrar',
            prevText: '<Ant',
            nextText: 'Sig>',
            currentText: 'Hoy',
            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
            dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
            dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
            dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
            weekHeader: 'Sm',
            dateFormat: 'dd/mm/yy',
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: ''
        };
        $.datepicker.setDefaults($.datepicker.regional['es']);
        $(function () {
            $("#fecha").datepicker();
        });



        $("[id*=btnEliminar]").live("click", function () {
            $("#dialog").dialog({
                title: "Advertencia",
                buttons: {
                    Si: function () {
                        $(this).dialog('close');
                        return;
                    },
                    No: function () {
                        $(this).dialog('close');
                    }
                   
                }
            });
            return false;
        });


        $(function () {
            $("[id*=txtFechaInicio]").datepicker();
        });
        $(function () {
            $("[id*=txtPickerFechaInicio]").datepicker();
        });

        $(function () {
            $("[id*=txtPickerFechaReinicio]").datepicker();
        });

        $(function () {
            $("[id*=txtFechaReinicio]").datepicker();
        });
        

        $(function () {
            $("[id*=txtPickerFechaTerminacion]").datepicker();
        });
        
        $(function () {
            $("[id*=txtFechaTerminacion]").datepicker();
        });

       
        function resultado(msg) {
            //msg.d tiene el resultado devuelto por el método
            //$('#num3').val(msg.d);
            alert("Presupuesto creado correctamente");
            $("#HiddenInsertar").val(1);
            $("#dialog-form").dialog('close');
           

            __doPostBack();

            
       }
        function errores(msg) {
            //msg.responseText tiene el mensaje de error enviado por el servidor
            alert('Error: ' + msg.responseText);
        }

        
    </script>
</asp:Content>

