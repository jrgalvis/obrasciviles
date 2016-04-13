<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DetalleContrato.aspx.cs" Inherits="DynamicData_CustomPages_DetalleContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    <script>
        $(function () {
            $("#tabs").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
            $("#tabs li").removeClass("ui-corner-top").addClass("ui-corner-left");
        });
    </script>
    <style>
        #navegador ul{list-style-type: none;text-align: center;}
        #navegador li{display: inline;text-align: center;margin: 0 10px 0 0;}
        #navegador li a { padding: 2px 7px 2px 7px; color: #666; background-color: #eeeeee; border: 1px solid #ccc; text-decoration: none;}
        #navegador li a:hover{ background-color: #333333; color: #ffffff;}
        /*.ui-tabs-vertical { width: 100%; }
        .ui-tabs-vertical .ui-tabs-nav { padding: .1em .0em .1em .1em; float: left; width: 15em; }
        .ui-tabs-vertical .ui-tabs-nav li { display:inline; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
        .ui-tabs-vertical .ui-tabs-nav li a { display:inline; }
        .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { border-right-width: 1px; border-right-width: 1px; }
        .ui-tabs-vertical .ui-tabs-panel { float:left; width:100%;}*/
    </style>

    <a runat="server" href="~/Custom/frm_contratos.aspx"><img alt="Volver a presupuestos" runat="server" src="~/DynamicData/Content/Images/back.gif" />Volver a los contratos</a>

    <h2>DETALLE PRESUPUESTO </h2>

    <div id="tabs">        
               
        <ul>
                        
            <li><a href="#actividadescontrato">Actividades presupuesto</a></li>
            <li><a href="#costosindirectos">Costos Indirectos presupuesto</a></li>
            <li><a href="#pagoscontrato">Pagos presupuesto</a></li>
            <li><a href="#sancionescontrato">Sanciones presupuesto</a></li>                        
            <li><a href="#suspencionescontrato">Suspenciones presupuesto</a></li>
            <li><a href="#garantiascontrato">Garantias presupuesto</a></li>
            <li><a href="#modificacionescontrato">Modificaciones presupuesto</a></li>
            <li><a href="#accioneslegalescontrato">Acciones Legales presupuesto</a></li>
                        
        </ul>
                   
        
        <div id="actividadescontrato">
    
            <script type="text/javascript">
                 $(function () {
                 dialog = $("#dialog-form-actividad").dialog({
                 autoOpen: false,
                 height: 350,
                 width: 1100,
                 modal: true,
                 buttons: {
                     "Crear nueva actividad de presupuesto": function () {
                         var codcontrato = 1;
                         var codactividad = $("[id*=ddlNuevaActividad]").val();
                         var cantpre = $("[id*=tbCantidadPresupuestada]").val();
                         var valorpre = 0;
                         var cantreal = $("[id*=tbCantidadReal]").val();
                         var valorre = 0;
                 
                         $.ajax({
                             type: "POST",
                             url: "DetalleContrato.aspx/CrearNuevaActividadContrato",
                             data: '{"codigocontrato":"' + codcontrato +
                                 '", "actividad":"' + codactividad +
                                 '", "cantidadpresupuestada":"' + cantpre +
                                 '", "valorpresupuestado":"' + valorpre +
                                 '", "cantidadreal":"' + cantreal +
                                 '", "valorreal":"' + valorre + '"}',
                             contentType: "application/json; charset=utf-8",
                             dataType: "json",
                             success: resultadoactividad,
                             error: erroresactividad
                         });
                     },
                 Cancel: function () {
                     $("#dialog-form-actividad").dialog("close");
                 }
                 },
 
                 });

                 $("#btnAdicionar").button().on("click", function () {
                     $("#dialog-form-actividad").dialog("open");
                 });
                 });

                 function resultadoactividad(msg) {
                     alert('Actividad creada');
                     $("#HiddenInsertar").val(1);
                     $("#dialog-form-actividad").dialog("close");

                     __doPostBack();
             
                 }
         
                 function erroresactividad(msg) {
             
                     //msg.responseText tiene el mensaje de error enviado por el servidor
             
                     alert('Error: ' + msg.responseText);
             
                 }

            </script>
 
 
             <div id="dialog-form-actividad" title="Crear nueva actividad de presupuesto">
                <h2>Nueva Actividad de presupuesto </h2>
                 <table>             
                     <tr>
                        <th><asp:Label runat="server" Text ="Actividad"></asp:Label></th>
                        <th><asp:DropDownList ID="ddlNuevaActividad" 
                                runat="server" 
                                DataSourceID="ActividadDS"
                                DataValueField="IdActividad"
                                DataTextField="DescripcionActividad"></asp:DropDownList>
                        </th>


                     </tr>
                     <tr>
                        <th><asp:Label runat="server" Text ="Cantidad Presupuestada"></asp:Label></th>
                        <th><asp:TextBox ID="tbCantidadPresupuestada" runat="server"></asp:TextBox></th>
                     </tr>
                     
                     <tr>
                        <th><asp:Label runat="server" Text ="Cantidad Real"></asp:Label></th>
                        <th><asp:TextBox ID="tbCantidadReal" runat="server"></asp:TextBox></th>
                     </tr>
                     
                 </table>
             </div>
    
            <h2>Actividades del Presupuesto</h2>

            <input id="btnAdicionar" type="button" value="Crear nueva actividad para el Presupuesto" onclick="" /><br />
            <br />

            <div style="overflow:auto; width:100%">
                <asp:GridView ID="gvActContrato" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ContratoActividadDS" EnableModelValidation="True" AutoGenerateColumns="False" DataKeyNames="Contrato,Actividad" ShowFooter="True">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="Contrato" HeaderText="Contrato" ReadOnly="True" SortExpression="Contrato" />
            
                        <%--<asp:BoundField DataField="TipoActividad" HeaderText="TipoActividad" ReadOnly="True" SortExpression="Actividad1.TipoActividad" />--%>
                        <asp:TemplateField HeaderText="Actividad" SortExpression="Actividad1.DescripcionActividad">
                            <ItemTemplate>
                                 <%#Eval("Actividad1.DescripcionActividad") %>  
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DDLActividad"
                                    DataSourceID="ActividadDS"
                                    DataValueField="IdActividad"
                                    DataTextField="DescripcionActividad"
                                    SelectedValue='<%#Bind("Actividad") %>'
                                    runat="server" />
                            </EditItemTemplate>             
                        </asp:TemplateField> 

                        <asp:BoundField DataField="CantidadPresupuestada" HeaderText="Cantidad Presupuestada" ReadOnly="True" SortExpression="CantidadPresupuestada" />
                        <asp:BoundField DataField="ValorPresupuestado" HeaderText="Valor Presupuestado" ReadOnly="True" SortExpression="ValorPresupuestado" />
                        <asp:BoundField DataField="CantidadReal" HeaderText="Cantidad Real" SortExpression="CantidadReal" />
                        <asp:BoundField DataField="ValorReal" HeaderText="Valor Real" ReadOnly="True" SortExpression="ValorReal" />
            
                    </Columns>
                </asp:GridView>
            </div>
            

            <asp:LinqDataSource ID="ContratoActividadDS" 
                runat="server" 
                ContextTypeName="DataClassesModelDataContext" 
                TableName="ContratoActividad" 
                EnableDelete="True" EnableInsert="True" EnableUpdate="True" OnSelecting="ContratoActividadDS_Selecting">
               
            </asp:LinqDataSource>

            <asp:linqdatasource ID="ActividadDS"
                runat="server" 
                ContextTypeName="DataClassesModelDataContext" 
                TableName="Actividad" EnableInsert="True" EnableUpdate="True"></asp:linqdatasource>

        </div>

        <div id="costosindirectos">
           
           <script type="text/javascript">
                $(function () {
                    dialog = $("#dialog-form-costosind").dialog({
                        autoOpen: false,
                        height: 350,
                        width: 1100,
                        modal: true,
                        buttons: {
                            "Crear nuevo costo indirecto": function () {
                                var codcontratocosto = 1;
                                var costoindirecto = $("[id*=ddlCostoIndirecto]").val();
                                var porcentaje = $("[id*=tbPorcentaje]").val();
                                var valorprecosto = $("[id*=tbValorPresCostoInd]").val();
                                var valorrealcosto = $("[id*=tbValorRealCostoInd]").val();

                                $.ajax({
                                    type: "POST",
                                    url: "DetalleContrato.aspx/CrearNuevoCostoIndirecto",
                                    data: '{"codigocontrato":"' + codcontratocosto +
                                        '", "codcostocontrato":"' + costoindirecto +
                                        '", "porcentajecosto":"' + porcentaje +
                                        '", "valorpresupuestado":"' + valorprecosto +
                                        '", "valorreal":"' + valorrealcosto + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: resultadocosto,
                                    error: errorescosto
                                });
                            },
                            Cancel: function () {
                                $("#dialog-form-costosind").dialog("close");
                            }
                        },

                    });

                    $("#btnAdicionarCosto").button().on("click", function () {
                        $("#dialog-form-costosind").dialog("open");
                    });
                });

                function resultadocosto(msg) {
                    alert('Costo indirecto de presupuesto creado');
                    $("#HiddenInsertar").val(1);
                    $("#dialog-form-costosind").dialog("close");

                    __doPostBack();

                }

                function errorescosto(msg) {

                    //msg.responseText tiene el mensaje de error enviado por el servidor

                    alert('Error: ' + msg.responseText);

                }

            </script>


            <div id="dialog-form-costosind" title="Crear nuevo costo indirecto">
                <h2>Nuevo Costo Indirecto </h2>
                 <table>             
                     <tr>
                        <th><asp:Label runat="server" Text ="Costo Indirecto"></asp:Label></th>
                        <th><asp:DropDownList ID="ddlCostoIndirecto" 
                                runat="server" 
                                DataSourceID="TipoCostoIndirectoDS"
                                DataValueField="IdTipoCostoIndirecto"
                                DataTextField="Descripcion"></asp:DropDownList>
                        </th>
                     </tr>
                     <tr>
                        <th><asp:Label runat="server" Text ="Porcentaje"></asp:Label></th>
                        <th><asp:TextBox ID="tbPorcentaje" runat="server"></asp:TextBox></th>
                     </tr>
                     <tr>
                        <th><asp:Label runat="server" Text ="Valor Presupuestado"></asp:Label></th>
                        <th><asp:TextBox ID="tbValorPresCostoInd" runat="server"></asp:TextBox></th>
                     </tr>
                     <tr>
                        <th><asp:Label runat="server" Text ="Valor Real"></asp:Label></th>
                        <th><asp:TextBox ID="tbValorRealCostoInd" runat="server"></asp:TextBox></th>
                     </tr>                     
                 </table>
             </div>

            <h2>Costos Indirectos del presupuesto</h2>
            
            <input id="btnAdicionarCosto" type="button" value="Crear nuevo costo indirecto" onclick="" /><br />
            <br />

            <asp:LinqDataSource ID="CostosIndirectosDS" 
                runat="server" 
                ContextTypeName="DataClassesModelDataContext" 
                TableName="CostosIndirectosContrato" EnableDelete="True" EnableInsert="True" EnableUpdate="True"
                OnSelecting="CostosIndirectosDS_Selecting" >
            </asp:LinqDataSource>
            <asp:LinqDataSource ID="TipoCostoIndirectoDS" 
                runat="server" 
                ContextTypeName="DataClassesModelDataContext" 
                TableName="TipoCostosIndirectos">
            </asp:LinqDataSource>

            <div style="overflow:auto;">
                <asp:GridView ID="gvCostosIndContrato" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CodigoContrato,IdTipoCostoIndirecto" DataSourceID="CostosIndirectosDS" EnableModelValidation="True">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />                            
                        <asp:TemplateField HeaderText="Tipo Costo Indirecto" SortExpression="IdTipoCostoIndirecto.Descripcion">
                            <ItemTemplate>
                                    <%#Eval("TipoCostosIndirectos.Descripcion") %>  
                            </ItemTemplate>                                
                        </asp:TemplateField>
                        <asp:BoundField DataField="Porcentaje" HeaderText="Porcentaje" SortExpression="Porcentaje" />
                        <asp:BoundField DataField="ValorPresupuestado" HeaderText="Valor Presupuestado" SortExpression="ValorPresupuestado" />
                        <asp:BoundField DataField="ValorReal" HeaderText="Valor Real" SortExpression="ValorReal" />
                    </Columns>
                </asp:GridView>
            </div>

        </div>

        <div id="pagoscontrato">
            
            <script type="text/javascript">
                $(function () {
                    dialog = $("#dialog-form-pagos").dialog({
                        autoOpen: false,
                        height: 350,
                        width: 1100,
                        modal: true,
                        buttons: {
                            "Insertar pago": function () {
                                var codcontratopago = 1;
                                var descripcionpago = $("[id*=tbDescripcionPago]").val();
                                var porcentajepago = $("[id*=tbPorcentajePago]").val();
                                var fechapago = $("[id*=tbFechaPago]").val();
                                var valorpago = $("[id*=tbValorPago]").val();

                                $.ajax({
                                    type: "POST",
                                    url: "DetalleContrato.aspx/CrearNuevoPago",
                                    data: '{"codigocontratopago":"' + codcontratopago +
                                        '", "descpago":"' + descripcionpago +
                                        '", "porcentajepago":"' + porcentajepago +
                                        '", "fecpago":"' + fechapago +
                                        '", "valorpago":"' + valorpago + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: resultadopago,
                                    error: errorespago
                                });
                            },
                            Cancel: function () {
                                $("#dialog-form-pagos").dialog("close");
                            }
                        },

                    });

                    $("#btnAdicionarPago").button().on("click", function () {
                        $("#dialog-form-pagos").dialog("open");
                    });
                });

                function resultadopago(msg) {
                    alert('Nuevo pago adicionado');
                    $("#HiddenInsertar").val(1);
                    $("#dialog-form-pagos").dialog("close");
                    
                    __doPostBack();

                }

                function errorespago(msg) {

                    //msg.responseText tiene el mensaje de error enviado por el servidor

                    alert('Error: ' + msg.responseText);

                }

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

                $(function () {
                    $("[id*=tbFechaPago]").datepicker();
                });

            </script>
            
            <div id="dialog-form-pagos" title="Crear nuevo pago">
                <h2>Nuevo Pago </h2>
                 <table>                              
                     <tr>
                        <th><asp:Label runat="server" Text ="Descripción Pago"></asp:Label></th>
                        <th><asp:TextBox ID="tbDescripcionPago" runat="server"></asp:TextBox></th>
                     </tr>
                     <tr>
                        <th><asp:Label runat="server" Text ="Porcentaje pago"></asp:Label></th>
                        <th><asp:TextBox ID="tbPorcentajePago" runat="server"></asp:TextBox></th>
                     </tr>
                     <tr>
                        <th><asp:Label runat="server" Text ="Fecha Pago"></asp:Label></th>
                        <th><asp:TextBox ID="tbFechaPago" runat="server"></asp:TextBox></th>
                     </tr>
                     <tr>
                        <th><asp:Label runat="server" Text ="Valor Pago"></asp:Label></th>
                        <th><asp:TextBox ID="tbValorPago" runat="server"></asp:TextBox></th>
                     </tr>                         
                 </table>
             </div>
            
            <h2>Pagos del Presupuesto</h2>
    
            <input id="btnAdicionarPago" type="button" value="Insertar nuevo pago" onclick="" /><br />
            <br />

            <div style="overflow:auto;">
                <asp:GridView ID="gvPagosContrato" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="PagosContratoDS" EnableModelValidation="True" AutoGenerateColumns="False" DataKeyNames="IdPago">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="Contrato" HeaderText="Contrato"  ReadOnly="True" SortExpression="Contrato" />
                        <asp:BoundField DataField="DescripcionPago" HeaderText="Descripción Pago" SortExpression="DescripcionPago" />            
                        <asp:BoundField DataField="PorcentajePago" HeaderText="Porcentaje Pago" SortExpression="PorcentajePago" />
                        <asp:BoundField DataField="FechaPago" HeaderText="Fecha Pago" SortExpression="FechaPago" />
                        <asp:BoundField DataField="ValorPago" HeaderText="Valor Pago" SortExpression="ValorPago" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:LinqDataSource ID="PagosContratoDS" 
                runat="server" 
                ContextTypeName="DataClassesModelDataContext" 
                EnableDelete="True" EnableInsert="True" EnableUpdate="True"          
                TableName="PagosContrato"
                OnSelecting="PagosContratoDS_Selecting">
            </asp:LinqDataSource>
        </div>

        <div id="sancionescontrato">

            <script type="text/javascript">
                $(function () {
                    dialog = $("#dialog-form-sancion").dialog({
                        autoOpen: false,
                        height: 350,
                        width: 500,
                        modal: true,
                        buttons: {
                            "Crear nueva sancion": function () {
                                var idcontrato = 1;
                                var num_resolucion = $("[id*=tbNumResolucion]").val();
                                var objeto_sancion = $("[id*=tbObjeto]").val();
                                var fecha_sancion = $("[id*=tbFechaSancion]").val();


                                $.ajax({
                                    type: "POST",
                                    url: "DetalleContrato.aspx/CrearNuevaSancion",
                                    data: '{"idcontrato":"' + idcontrato +
                                        '", "num_resolucion":"' + num_resolucion +
                                        '", "objeto_sancion":"' + objeto_sancion +
                                        '", "fecha_sancion":"' + fecha_sancion + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: resultadosancion,
                                    error: erroressancion
                                });


                            },
                            Cancel: function () {
                                $("#dialog-form-sancion").dialog("close");
                            }
                        },

                    });

                    $("#btnAdicionarSancion").button().on("click", function () {
                        $("#dialog-form-sancion").dialog("open");
                    });
                });

                function resultadosancion(msg) {
                    alert('Sancion creada');
                    $("#HiddenInsertar").val(1);
                    $("#dialog-form-sancion").dialog("close");

                    __doPostBack();

                }

                function erroressancion(msg) {

                    //msg.responseText tiene el mensaje de error enviado por el servidor

                    alert('Error: ' + msg.responseText);

                }

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

                $(function () {
                    $("[id*=tbFechaSancion]").datepicker();
                });

            </script>
 
 
            <div id="dialog-form-sancion" title="Crear sanción al presupuesto">
                <h2>Nueva Sancion </h2>
                <table>             
            
                    <tr>
                    <th><asp:Label runat="server" Text ="Número Resolución"></asp:Label></th>
                    <th><asp:TextBox ID="tbNumResolucion" runat="server"></asp:TextBox></th>
                    </tr>
                    <tr>
                    <th><asp:Label runat="server" Text ="Objeto"></asp:Label></th>
                    <th><asp:TextBox ID="tbObjeto" runat="server"></asp:TextBox></th>
                    </tr>
                    <tr>
                    <th><asp:Label runat="server" Text ="Fecha Sanción"></asp:Label></th>
                    <th><asp:TextBox ID="tbFechaSancion" runat="server"></asp:TextBox></th>
                    </tr>
             
                </table>
            </div>
    
            <input id="btnAdicionarSancion" type="button" value="Crear nueva sancion sobre el presupuesto" onclick="" /><br />
            <br />

            <h2>SANCIONES DEL PRESUPUESTO</h2>

            <asp:GridView ID="gvSanciones" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SancionesContratoDS" EnableModelValidation="True" DataKeyNames="IdSancion,Contrato">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <%-- <asp:BoundField DataField="IdSancion" HeaderText="Id Sancion" ReadOnly="True" SortExpression="IdSancion" />--%>
                <asp:BoundField DataField="Contrato" HeaderText="Contrato" ReadOnly="True" SortExpression="Contrato" />
                <asp:BoundField DataField="NumResolucion" HeaderText="Número Resolucion" SortExpression="NumResolucion" />
                <asp:BoundField DataField="Objeto" HeaderText="Objeto" SortExpression="Objeto" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
            </Columns>

            </asp:GridView>

            <asp:LinqDataSource ID="SancionesContratoDS" 
                runat="server" 
                ContextTypeName="DataClassesModelDataContext" 
                TableName="SancionesContrato" EnableInsert="True" EnableUpdate="True" OnSelecting="SancionesContratoDS_Selecting">
            </asp:LinqDataSource>

        </div>

        <div id="suspencionescontrato">

            <script type="text/javascript">
                $(function () {
                    dialog = $("#dialog-form-suspencion").dialog({
                        autoOpen: false,
                        height: 350,
                        width: 500,
                        modal: true,
                        buttons: {
                            "Nueva suspencion": function () {
                                var idcontrato = 1;
                                var num_acta = $("[id*=tbNumActa]").val();
                                var tipo_acta = $("[id*=tbTipoActa]").val();
                                var fecha_acta_susp = $("[id*=tbFechaActaSuspencion]").val();
                                var fecha_inicio_susp = $("[id*=tbFechaInicioSuspencion]").val();
                                var fecha_fin_susp = $("[id*=tbFechaFinSuspencion]").val();
                                var duracion_sancion = $("[id*=tbDuracion]").val();
                                var fecha_reanu_susp = $("[id*=tbFechaReanudacion]").val();


                                $.ajax({
                                    type: "POST",
                                    url: "DetalleContrato.aspx/CrearNuevaSuspencion",
                                    data: '{"idcontrato":"' + idcontrato +
                                        '", "num_acta":"' + num_acta +
                                        '", "tipo_acta":"' + tipo_acta +
                                        '", "fecha_acta_susp":"' + fecha_acta_susp +
                                        '", "fecha_inicio_susp":"' + fecha_inicio_susp +
                                        '", "fecha_fin_susp":"' + fecha_fin_susp +
                                        '", "duracion_sancion":"' + duracion_sancion +
                                        '", "fecha_reanu_susp":"' + fecha_reanu_susp + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: resultadosuspencion,
                                    error: erroressuspencion
                                });


                            },
                            Cancel: function () {
                                $("#dialog-form-suspencion").dialog("close");
                            }
                        },

                    });

                    $("#btnAdicionarSuspencion").button().on("click", function () {
                        $("#dialog-form-suspencion").dialog("open");
                    });
                });

                function resultadosuspencion(msg) {
                    alert('Suspención creada');
                    $("#HiddenInsertar").val(1);
                    $("#dialog-form-suspencion").dialog("close");               

                    __doPostBack();

                }

                function erroressuspencion(msg) {

                    //msg.responseText tiene el mensaje de error enviado por el servidor

                    alert('Error: ' + msg.responseText);

                }

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

                $(function () {
                    $("[id*=tbFechaActaSuspencion]").datepicker();
                    $("[id*=tbFechaInicioSuspencion]").datepicker();
                    $("[id*=tbFechaFinSuspencion]").datepicker();
                    $("[id*=tbFechaReanudacion]").datepicker();
                });

            </script>
 
 
            <div id="dialog-form-suspencion" title="Crear suspención al presupuesto">
            <h2>Nueva Sancion </h2>
            <table>             
            
                
                <tr>
                <th><asp:Label runat="server" Text ="Número Acta Suspención"></asp:Label></th>
                <th><asp:TextBox ID="tbNumActa" runat="server"></asp:TextBox></th>
                </tr>
                <tr>
                <th><asp:Label runat="server" Text ="Tipo Acta"></asp:Label></th>
                <th><asp:TextBox ID="tbTipoActa" runat="server"></asp:TextBox></th>
                </tr>
                <tr>
                <th><asp:Label runat="server" Text ="Fecha Acta Suspención"></asp:Label></th>
                <th><asp:TextBox ID="tbFechaActaSuspencion" runat="server"></asp:TextBox></th>
                </tr>
                <tr>
                <th><asp:Label runat="server" Text ="Fecha Inicio Suspención"></asp:Label></th>
                <th><asp:TextBox ID="tbFechaInicioSuspencion" runat="server"></asp:TextBox></th>
                </tr>
                <tr>
                <th><asp:Label runat="server" Text ="Fecha Fin Suspención"></asp:Label></th>
                <th><asp:TextBox ID="tbFechaFinSuspencion" runat="server"></asp:TextBox></th>
                </tr>
                <tr>
                <th><asp:Label runat="server" Text ="Duración"></asp:Label></th>
                <th><asp:TextBox ID="tbDuracion" runat="server"></asp:TextBox></th>
                </tr>
                <tr>
                <th><asp:Label runat="server" Text ="Fecha Reanudación"></asp:Label></th>
                <th><asp:TextBox ID="tbFechaReanudacion" runat="server"></asp:TextBox></th>
                </tr>
            </table>
            </div>
    
            <input id="btnAdicionarSuspencion" type="button" value="Crear nueva suspención del presupuesto" onclick="" /><br />
            <br />

            <h2>SUSPENCIONES DEL PRESUPUESTO</h2>

            <asp:GridView ID="gvSuspenciones" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SuspencionesContratoDS" EnableModelValidation="True" DataKeyNames="IdSuspencion,Contrato">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <%-- <asp:BoundField DataField="IdSuspencion" HeaderText="Id Suspencion" ReadOnly="True" SortExpression="IdSuspencion" />--%>
                    <asp:BoundField DataField="Contrato" HeaderText="Contrato" ReadOnly="True" SortExpression="Contrato" />
                    <asp:BoundField DataField="NumActa" HeaderText="Número Acta" SortExpression="NumActa" />
                    <asp:BoundField DataField="TipoActa" HeaderText="Tipo Acta" SortExpression="TipoActa" />
                    <asp:BoundField DataField="FechaActaSuspencion" HeaderText="Fecha Acta Suspencion" SortExpression="FechaActaSuspencion" />
                    <asp:BoundField DataField="FechaInicioSuspencion" HeaderText="Fecha Inicio Suspencion" SortExpression="FechaInicioSuspencion" />
                    <asp:BoundField DataField="FechaFinSuspencion" HeaderText="Fecha Fin Suspencion" SortExpression="FechaFinSuspencion" />
                    <asp:BoundField DataField="Duracion" HeaderText="Duracion" SortExpression="Duracion" />
                    <asp:BoundField DataField="FechaReanudacion" HeaderText="Fecha Reanudacion" SortExpression="FechaReanudacion" />
                </Columns>

            </asp:GridView>

            <asp:LinqDataSource ID="SuspencionesContratoDS" 
            runat="server" 
            ContextTypeName="DataClassesModelDataContext" 
            TableName="SuspencionContrato" EnableInsert="True" EnableUpdate="True" OnSelecting="SuspencionesContratoDS_Selecting">
            </asp:LinqDataSource>

        </div>

     

        <div id="modificacionescontrato">

            <script type="text/javascript">
                $(function () {
                    dialog = $("#dialog-form-modcontrato").dialog({
                        autoOpen: false,
                        height: 500,
                        width: 500,
                        modal: true,
                        buttons: {
                            "Crear nueva modificacion presupuesto": function () {
                                var id_contrato = 1;
                                var tipo_modificacion = $("[id*=DDLTipoModificacion]").val();
                                var fecha_modificacion = $("[id*=tbFechaModificacion]").val();
                                var plazo_modificacion = $("[id*=tbPlazoModificacion]").val();
                                var valor_modificacion = $("[id*=tbValorModificacion]").val();


                                $.ajax({
                                    type: "POST",
                                    url: "DetalleContrato.aspx/CrearNuevaModificacionContrato",
                                    data: '{"id_contrato":"' + id_contrato +
                                        '", "tipo_modificacion":"' + tipo_modificacion +
                                        '", "fecha_modificacion":"' + fecha_modificacion +
                                        '", "plazo_modificacion":"' + plazo_modificacion +
                                        '", "valor_modificacion":"' + valor_modificacion + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: resultadomodificaciones,
                                    error: erroresmodificaciones
                                });
                            },

                            Cancel: function () {
                                $("#dialog-form-modcontrato").dialog("close");
                            }
                        },

                    });

                    $("#btnAdicionarModContrato").button().on("click", function () {
                        $("#dialog-form-modcontrato").dialog("open");
                    });
                });

                function resultadomodificaciones(msg) {
                    alert('Modificación creada para el presupuesto');
                    $("#HiddenInsertar").val(1);
                    $("#dialog-form-modcontrato").dialog("close");
                    
                    __doPostBack();

                }

                function erroresmodificaciones(msg) {

                    //msg.responseText tiene el mensaje de error enviado por el servidor

                    alert('Error: ' + msg.responseText);

                }

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

                $(function () {
                    $("[id*=tbFechaModificacion]").datepicker();
                });

            </script>
 
 
            <div id="dialog-form-modcontrato" title="Crear modificación de presupuesto">
            <h2>Nueva modificación para el presupuesto </h2>
            <table>             
            
                <tr>
                <th><asp:Label runat="server" Text ="Tipo Modificacion"></asp:Label></th>
                <th><asp:DropDownList ID="DDLTipoModificacion"
                        DataSourceID="TipoModificacionDS"
                        DataValueField="IdTipoModificacion"
                        DataTextField="DescripcionModificacion"
                        runat="server" />
                </th>
                </tr> 
                <tr>
                <th><asp:Label runat="server" Text ="Fecha Modificacion"></asp:Label></th>
                <th><asp:TextBox ID="tbFechaModificacion" runat="server"></asp:TextBox></th>
                </tr>
                <tr>
                <th><asp:Label runat="server" Text ="Plazo Modificacion"></asp:Label></th>
                <th><asp:TextBox ID="tbPlazoModificacion" runat="server"></asp:TextBox></th>
                </tr>
                <tr>
                <th><asp:Label runat="server" Text ="Valor Modificacion"></asp:Label></th>
                <th><asp:TextBox ID="tbValorModificacion" runat="server"></asp:TextBox></th>
                </tr>
            

            </table>
            </div>

            <h2>MODIFICACIONES PRESUPUESTO</h2>

            <input id="btnAdicionarModContrato" type="button" value="Crear modificación de presupuesto" onclick="" /><br />
    


            <br />

            <asp:GridView ID="gvModificaciones" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="IdModificacion,Contrato" DataSourceID="ModificacionContratoDS" EnableModelValidation="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <%--<asp:BoundField DataField="IdModificacion" HeaderText="IdModificacion" InsertVisible="False" ReadOnly="True" SortExpression="IdModificacion" />--%>
                <asp:BoundField DataField="Contrato" HeaderText="Contrato" ReadOnly="True" SortExpression="Contrato" />
                <%--<asp:BoundField DataField="TipoModificacion" HeaderText="TipoModificacion" SortExpression="TipoModificacion" />--%>

                <asp:TemplateField HeaderText="Tipo Modificacion" SortExpression="TipoModificacion1.DescripcionModificacion">
                    <ItemTemplate >                               
                   
                       <%#Eval("TipoModificacion1.DescripcionModificacion") %>
                   
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLTipoModificacionContrato"
                        DataSourceID="TipoModificacionDS"
                        DataValueField="IdTipoModificacion"
                        DataTextField="DescripcionModificacion"
                        SelectedValue='<%#Bind("TipoModificacion") %>'
                        runat="server" />
                    </EditItemTemplate>

                </asp:TemplateField>                

                <asp:BoundField DataField="FechaModificacion" HeaderText="FechaModificacion" SortExpression="FechaModificacion" />
                <asp:BoundField DataField="PlazoModificacion" HeaderText="PlazoModificacion" SortExpression="PlazoModificacion" />
                <asp:BoundField DataField="ValorModificacion" HeaderText="ValorModificacion" SortExpression="ValorModificacion" />
            </Columns>
            </asp:GridView>

            <asp:LinqDataSource ID="ModificacionContratoDS" 
            runat="server" 
            ContextTypeName="DataClassesModelDataContext" 
            EnableInsert="True" 
            EnableUpdate="True" 
            TableName="ModificacionesContrato"
            OnSelecting="ModificacionContratoDS_Selecting">
            </asp:LinqDataSource>


            <asp:LinqDataSource 
            ID="TipoModificacionDS" 
            runat="server" 
            ContextTypeName="DataClassesModelDataContext" 
            TableName="TipoModificacion">
            </asp:LinqDataSource>

        </div>

        <div id="accioneslegalescontrato">

            <script type="text/javascript">
                $(function () {
                    dialog = $("#dialog-form-accion").dialog({
                        autoOpen: false,
                        height: 350,
                        width: 500,
                        modal: true,
                        buttons: {
                            "Crear": function () {
                                var idcontrato = 1;
                                var clase_accion = $("[id*=tbClase]").val();
                                var etapa_procesal = $("[id*=tbEtapaProcesal]").val();
                                var fecha_accion = $("[id*=tbFechaAccion]").val();
                                var despacho_accion = $("[id*=tbDespacho]").val();
                                var num_expediente = $("[id*=tbNumExpediente]").val();


                                $.ajax({
                                    type: "POST",
                                    url: "DetalleContrato.aspx/CrearNuevaAccionLegal",
                                    data: '{"idcontrato":"' + idcontrato +
                                        '", "clase_accion":"' + clase_accion +
                                        '", "etapa_procesal":"' + etapa_procesal +
                                        '", "fecha_accion":"' + fecha_accion +
                                        '", "despacho_accion":"' + despacho_accion +
                                        '", "num_expediente":"' + num_expediente + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: resultadoAcciones,
                                    error: erroresAcciones
                                });


                            },
                            Cancel: function () {
                                $("#dialog-form-accion").dialog("close");
                            }
                        },

                    });

                    $("#btnAdicionarAccion").button().on("click", function () {
                        $("#dialog-form-accion").dialog("open");
                    });
                });

                function resultadoAcciones(msg) {
                    alert('Accion legal creada');
                    $("#HiddenInsertar").val(1);
                    $("#dialog-form-accion").dialog("close");

                    __doPostBack();

                }

                function erroresAcciones(msg) {

                    //msg.responseText tiene el mensaje de error enviado por el servidor

                    alert('Error: ' + msg.responseText);

                }

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

                $(function () {
                    $("[id*=tbFechaAccion]").datepicker();
                });

            </script>
 
 
            <div id="dialog-form-accion" title="Crear accion legal al presupuesto">
            <h2>Nueva Accion Legal </h2>
            <table>             
            
                
                <tr>
                <th><asp:Label runat="server" Text ="Clase Accion Legal"></asp:Label></th>
                <th><asp:TextBox ID="tbClase" runat="server"></asp:TextBox></th>
                </tr>
                <tr>
                <th><asp:Label runat="server" Text ="Etapa Procesal"></asp:Label></th>
                <th><asp:TextBox ID="tbEtapaProcesal" runat="server"></asp:TextBox></th>
                </tr>
                <tr>
                <th><asp:Label runat="server" Text ="Fecha Accion"></asp:Label></th>
                <th><asp:TextBox ID="tbFechaAccion" runat="server"></asp:TextBox></th>
                </tr>
                <tr>
                <th><asp:Label runat="server" Text ="Despacho"></asp:Label></th>
                <th><asp:TextBox ID="tbDespacho" runat="server"></asp:TextBox></th>
                </tr>
                <tr>
                <th><asp:Label runat="server" Text ="Numero Expediente"></asp:Label></th>
                <th><asp:TextBox ID="tbNumExpediente" runat="server"></asp:TextBox></th>
                </tr>
            </table>
            </div>
    
            <input id="btnAdicionarAccion" type="button" value="Crear nueva accion legal sobre el presupuesto" onclick="" /><br />
            <br />

            <h2>ACCIONES LEGALES DEL PRESUPUESTO</h2>

            <asp:GridView ID="gvAcciones" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="AccionesLegalesDS" EnableModelValidation="True" DataKeyNames="IdAccion,Contrato">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <%--<asp:BoundField DataField="IdAccion" HeaderText="Id Accion Legal" ReadOnly="True" SortExpression="IdAccion" />--%>
                <asp:BoundField DataField="Contrato" HeaderText="Contrato" ReadOnly="True" SortExpression="Contrato" />
                <asp:BoundField DataField="Clase" HeaderText="Clase" SortExpression="Clase" />
                <asp:BoundField DataField="EtapaProcesal" HeaderText="Etapa Procesal" SortExpression="EtapaProcesal" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                <asp:BoundField DataField="Despacho" HeaderText="Despacho" SortExpression="Despacho" />
                <asp:BoundField DataField="NumExpediente" HeaderText="Número Expediente" SortExpression="NumExpediente" />
            </Columns>

            </asp:GridView>

            <asp:LinqDataSource ID="AccionesLegalesDS" 
            runat="server" 
            ContextTypeName="DataClassesModelDataContext" 
            TableName="AccionesLegalesContrato" 
            EnableInsert="True" 
            EnableUpdate="True"
             OnSelecting="AccionesLegalesDS_Selecting">
            </asp:LinqDataSource>

        </div>

        <div id="garantiascontrato">

            <script type="text/javascript">
                $(function () {
                    dialog = $("#dialog-form-garcontrato").dialog({
                        autoOpen: false,
                        height: 500,
                        width: 500,
                        modal: true,
                        buttons: {
                            "Crear nueva garantia presupuesto": function () {
                                var id_contrato = 1;
                                var tipo_garantia = $("[id*=DDLTipoGarantia]").val();
                                var nombre_asegurador = $("[id*=tbNombreAsegurador]").val();
                                var num_poliza = $("[id*=tbNumPoliza]").val();
                                var fecha_ini_vigencia = $("[id*=tbFechaInicioVigencia]").val();
                                var fecha_fin_vigencia = $("[id*=tbFechaFinVigencia]").val();
                                var num_cert_modificatorio = $("[id*=tbNumCertModificatorio]").val();



                                $.ajax({
                                    type: "POST",
                                    url: "DetalleContrato.aspx/CrearNuevaGarantiaContrato",
                                    data: '{"id_contrato":"' + id_contrato +
                                        '", "tipo_garantia":"' + tipo_garantia +
                                        '", "nombre_asegurador":"' + nombre_asegurador +
                                        '", "num_poliza":"' + num_poliza +
                                        '", "fecha_ini_vigencia":"' + fecha_ini_vigencia +
                                        '", "fecha_fin_vigencia":"' + fecha_fin_vigencia +
                                        '", "num_cert_modificatorio":"' + num_cert_modificatorio + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: resultadoGarantias,
                                    error: erroresGarantias
                                });
                            },

                            Cancel: function () {
                                $("#dialog-form-garcontrato").dialog("close");
                            }
                        },

                    });

                    $("#btnAdicionarGarContrato").button().on("click", function () {
                        $("#dialog-form-garcontrato").dialog("open");
                    });
                });

                function resultadoGarantias(msg) {
                    alert('Garantia creada para el presupuesto');
                    $("#HiddenInsertar").val(1);
                    $("#dialog-form-garcontrato").dialog("close");

                    __doPostBack();

                }

                function erroresGarantias(msg) {

                    //msg.responseText tiene el mensaje de error enviado por el servidor

                    alert('Error: ' + msg.responseText);

                }

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

                $(function () {
                    $("[id*=tbFechaInicioVigencia]").datepicker();
                    $("[id*=tbFechaFinVigencia]").datepicker();
                });

            </script>
 
 
            <div id="dialog-form-garcontrato" title="Crear garantia de presupuesto">
            <h2>Nueva Garantia para el presupuesto </h2>
            <table>             
            
            
            <tr>
            <th><asp:Label runat="server" Text ="Tipo Garantia"></asp:Label></th>
            <th><asp:DropDownList ID="DDLTipoGarantia"
                    DataSourceID="TipoGarantiaDS"
                    DataValueField="IdGarantia"
                    DataTextField="DescripcionGarantia"
                    runat="server" />
            </th>
            </tr> 
            <tr>
            <th><asp:Label runat="server" Text ="Nombre Aseguradora"></asp:Label></th>
            <th><asp:TextBox ID="tbNombreAsegurador" runat="server"></asp:TextBox></th>
            </tr>
            <tr>
            <th><asp:Label runat="server" Text ="Número de Póliza"></asp:Label></th>
            <th><asp:TextBox ID="tbNumPoliza" runat="server"></asp:TextBox></th>
            </tr>
            <tr>
            <th><asp:Label runat="server" Text ="Fecha Inicio Vigencia"></asp:Label></th>
            <th><asp:TextBox ID="tbFechaInicioVigencia" runat="server"></asp:TextBox></th>
            </tr>
            <tr>
            <th><asp:Label runat="server" Text ="Fecha Fin Vigencia"></asp:Label></th>
            <th><asp:TextBox ID="tbFechaFinVigencia" runat="server"></asp:TextBox></th>
            </tr>
            <tr>
            <th><asp:Label runat="server" Text ="Número Certificación Modificatoria"></asp:Label></th>
            <th><asp:TextBox ID="tbNumCertModificatorio" runat="server"></asp:TextBox></th>
            </tr>

            </table>
            </div>

            <h2>GARANTIAS PRESUPUESTO</h2>

            <input id="btnAdicionarGarContrato" type="button" value="Crear garantia de presupuesto" onclick="" /><br />
            <br />

            <asp:GridView ID="gvGarantias" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="GarantiaContratoDS" EnableModelValidation="True" DataKeyNames="IdGarantiaContrato">
            <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
            <%-- <asp:BoundField DataField="IdGarantiaContrato" HeaderText="Garantia Contrato" ReadOnly="True" SortExpression="IdGarantiaContrato" Visible="false" />--%>
            <asp:BoundField DataField="Contrato" HeaderText="Contrato" ReadOnly="True" SortExpression="Contrato" />
            
            <asp:TemplateField HeaderText="Tipo Garantia" SortExpression="TipoGarantia1.DescripcionGarantia">
            <ItemTemplate>
                    <%#Eval("TipoGarantia1.DescripcionGarantia") %>  
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="DDLTipoGarantia"
                    DataSourceID="TipoGarantiaDS"
                    DataValueField="IdGarantia"
                    DataTextField="DescripcionGarantia"
                    SelectedValue='<%#Bind("TipoGarantia") %>'
                    runat="server" />
            </EditItemTemplate>             
            </asp:TemplateField> 
            <asp:BoundField DataField="NombreAsegurador" HeaderText="Nombre Aseguradora" ReadOnly="True" SortExpression="NombreAsegurador" />
            <asp:BoundField DataField="NumPoliza" HeaderText="Numero Poliza" SortExpression="NumPoliza" />
            <asp:BoundField DataField="FechaInicioVigencia" HeaderText="Fecha Inicio Vigencia" ReadOnly="True" SortExpression="FechaInicioVigencia" />
            <asp:BoundField DataField="FechaFinVigencia" HeaderText="Fecha Fin Vigencia" SortExpression="FechaFinVigencia" />
            <asp:BoundField DataField="NumCertModificatorio" HeaderText="Número Certificado Modificatorio" SortExpression="NumCertModificatorio" />
            </Columns>
            </asp:GridView>


            <asp:LinqDataSource ID="GarantiaContratoDS" 
            runat="server" 
            ContextTypeName="DataClassesModelDataContext" 
            EnableInsert="True" 
            EnableUpdate="True"
            TableName="GarantiaContrato"
            OnSelecting="GarantiaContratoDS_Selecting">
            </asp:LinqDataSource>


            <asp:LinqDataSource ID="TipoGarantiaDS" 
            runat="server" 
            ContextTypeName="DataClassesModelDataContext" 
            TableName="TipoGarantia">
            </asp:LinqDataSource>

        </div>

    </div>
</asp:Content>

