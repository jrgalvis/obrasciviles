<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ActividadContrato.aspx.cs" Inherits="DynamicData_CustomPages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
         $(function () {
         dialog = $("#dialog-form").dialog({
         autoOpen: false,
         height: 350,
         width: 1100,
         modal: true,
         buttons: {
             "Crear nueva actividad de presupuesto": function () {
                 var codcontrato = 1;
                 var codactividad = $("[id*=ddlNuevaActividad]").val();
                 var cantpre = $("[id*=tbCantidadPresupuestada]").val();
                 var valorpre = $("[id*=tbValorPresupuestado]").val();
                 var cantreal = $("[id*=tbCantidadReal]").val();
                 var valorre = $("[id*=tbValorReal]").val();
                 
                 $.ajax({
                     type: "POST",
                     url: "ActividadContrato.aspx/CrearNuevaActividadContrato",
                     data: '{"codigocontrato":"' + codcontrato +
                         '", "actividad":"' + codactividad +
                         '", "cantidadpresupuestada":"' + cantpre +
                         '", "valorpresupuestado":"' + valorpre +
                         '", "cantidadreal":"' + cantreal +
                         '", "valorreal":"' + valorre + '"}',
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

         $("#btnAdicionar").button().on("click", function () {
             dialog.dialog("open");
         });
         });

         function resultado(msg) {
             alert('Actividad creada');
             dialog.dialog("close");
             
         }
         
         function errores(msg) {
             
             //msg.responseText tiene el mensaje de error enviado por el servidor
             
             alert('Error: ' + msg.responseText);
             
         }

    </script>
 
 
     <div id="dialog-form" title="Crear nueva actividad de presupuesto">
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
                <th><asp:Label runat="server" Text ="Valor Presupuestado"></asp:Label></th>
                <th><asp:TextBox ID="tbValorPresupuestado" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Cantidad Real"></asp:Label></th>
                <th><asp:TextBox ID="tbCantidadReal" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Valor Real"></asp:Label></th>
                <th><asp:TextBox ID="tbValorReal" runat="server"></asp:TextBox></th>
             </tr>
         </table>
     </div>
    
    <input id="btnAdicionar" type="button" value="Crear nueva actividad para el presupuesto" onclick="" /><br />
    <br />


    <h2>ACTIVIDADES DEL PRESUPUESTO</h2>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ContratoActividadDS" EnableModelValidation="True" AutoGenerateColumns="False" DataKeyNames="Contrato,Actividad" ShowFooter="true">
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


    <asp:LinqDataSource ID="ContratoActividadDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="ContratoActividad" 
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" 
        >
    </asp:LinqDataSource>

    <asp:linqdatasource ID="ActividadDS"
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="Actividad" EnableInsert="True" EnableUpdate="True"></asp:linqdatasource>
</asp:Content>

