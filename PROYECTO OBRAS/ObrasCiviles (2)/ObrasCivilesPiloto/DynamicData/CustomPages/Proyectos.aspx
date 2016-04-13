<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Proyectos.aspx.cs" Inherits="DynamicData_CustomPages_Proyectos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
         $(function () {
         dialog = $("#dialog-form-proyecto").dialog({
         autoOpen: false,
         height: 500,
         width: 500,
         modal: true,
         buttons: {
             "Crear nuevo Proyecto": function () {
                 var id_proyecto = $("[id*=tbIdProyecto]").val();
                 var fecha_inicio = $("[id*=tbFechaInicio]").val();
                 var cant_predios = $("[id*=tbCantidadPredios]").val();
                 var predios_ejecutado = $("[id*=tbPrediosEjecutado]").val();
                 var valor_proyecto = $("[id*=tbValorProyecto]").val();
                 var valor_ejecutado = $("[id*=tbValorEjecutado]").val();                 
                 var num_disp_pres = $("[id*=tbNumDispPresupuestal]").val();
                 var fecha_disp_pres = $("[id*=tbFechaDispPresupuestal]").val();
                 var cod_disp_pre = $("[id*=tbCodDispPresupuestal]").val();
                 var rubro_disp_pre = $("[id*=tbRubroDispPresupuestal]").val();
                 var valor_disp_pre = $("[id*=tbValorDispPresupuestal]").val();
                 var num_res_pre = $("[id*=tbNumResPresupuestal]").val();
                 var fecha_res_pre = $("[id*=tbFechaResPresupuestal]").val();
                 var cod_res_pre = $("[id*=tbCodResPresupuestal]").val();
                 var rubro_res_pre = $("[id*=tbRubroResPresupuestal]").val();
                 var valor_res_pre = $("[id*=tbValorResPresupuestal]").val();

                 
                 $.ajax({
                     type: "POST",
                     url: "Proyectos.aspx/CrearNuevoProyecto",
                     data: '{"id_proyecto":"' + id_proyecto +
                         '", "fecha_inicio":"' + fecha_inicio +
                         '", "cant_predios":"' + cant_predios +
                         '", "predios_ejecutado":"' + predios_ejecutado +
                         '", "valor_proyecto":"' + valor_proyecto +
                         '", "valor_ejecutado":"' + valor_ejecutado +
                         '", "num_disp_pres":"' + num_disp_pres +
                         '", "fecha_disp_pres":"' + fecha_disp_pres +
                         '", "cod_disp_pre":"' + cod_disp_pre +
                         '", "rubro_disp_pre":"' + rubro_disp_pre +
                         '", "valor_disp_pre":"' + valor_disp_pre +
                         '", "num_res_pre":"' + num_res_pre +
                         '", "fecha_res_pre":"' + fecha_res_pre +
                         '", "cod_res_pre":"' + cod_res_pre +
                         '", "rubro_res_pre":"' + rubro_res_pre +
                         '", "valor_res_pre":"' + valor_res_pre + '"}',
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: resultado,
                     error: errores
                 });
             },

         Cancel: function () {
             $("#dialog-form-proyecto").dialog("close");
         }
         },
 
         });

         $("#btnAdicionarProyecto").button().on("click", function () {
             $("#dialog-form-proyecto").dialog("open");
         });
         });

         function resultado(msg) {
             alert('Proyecto creado');
             $("#dialog-form-proyecto").dialog("close");
             
         }
         
         function errores(msg) {
             
             //msg.responseText tiene el mensaje de error enviado por el servidor
             
             alert('Error: ' + msg.responseText);
             
         }

    </script>
    
    <div id="dialog-form-proyecto" title="Crear nuevo proyecto">
        <h2>Nuevo Proyecto </h2>
         <table>             
             <tr>
                <th><asp:Label runat="server" Text ="Id Proyecto"></asp:Label></th>
                <th><asp:TextBox ID="tbIdProyecto" runat="server"></asp:TextBox></th>
             </tr>    
             <tr>
                <th><asp:Label runat="server" Text ="Fecha Inicio"></asp:Label></th>
                <th><asp:TextBox ID="tbFechaInicio" runat="server"></asp:TextBox></th>
             </tr> 
             <tr>
                <th><asp:Label runat="server" Text ="Fecha Fin"></asp:Label></th>
                <th><asp:TextBox ID="tbFechaFin" runat="server"></asp:TextBox></th>
             </tr> 
             <tr>
                <th><asp:Label runat="server" Text ="Cantidad Predios"></asp:Label></th>
                <th><asp:TextBox ID="tbCantidadPredios" runat="server"></asp:TextBox></th>
             </tr> 
             <tr>
                <th><asp:Label runat="server" Text ="Predios Ejecutados"></asp:Label></th>
                <th><asp:TextBox ID="tbPrediosEjecutado" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Valor Proyecto"></asp:Label></th>
                <th><asp:TextBox ID="tbValorProyecto" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Valor Ejecutado"></asp:Label></th>
                <th><asp:TextBox ID="tbValorEjecutado" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Num Disponibilidad Presupuestal"></asp:Label></th>
                <th><asp:TextBox ID="tbNumDispPresupuestal" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Fecha Disponibilidad Presupuestal"></asp:Label></th>
                <th><asp:TextBox ID="tbFechaDispPresupuestal" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Cod Disponibilidad Presupuestal"></asp:Label></th>
                <th><asp:TextBox ID="tbCodDispPresupuestal" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Rubro Disponibilidad Presupuestal"></asp:Label></th>
                <th><asp:TextBox ID="tbRubroDispPresupuestal" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Valor Disponibilidad Presupuestal"></asp:Label></th>
                <th><asp:TextBox ID="tbValorDispPresupuestal" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Num Reserva Presupuestal"></asp:Label></th>
                <th><asp:TextBox ID="tbNumResPresupuestal" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Fecha Reserva Presupuestal"></asp:Label></th>
                <th><asp:TextBox ID="tbFechaResPresupuestal" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Cod Reserva Presupuestal"></asp:Label></th>
                <th><asp:TextBox ID="tbCodResPresupuestal" runat="server"></asp:TextBox></th>
             </tr>   
             <tr>
                <th><asp:Label runat="server" Text ="Rubro Reserva Presupuestal"></asp:Label></th>
                <th><asp:TextBox ID="tbRubroResPresupuestal" runat="server"></asp:TextBox></th>
             </tr>   
             <tr>
                <th><asp:Label runat="server" Text ="Valor Reserva Presupuestal"></asp:Label></th>
                <th><asp:TextBox ID="tbValorResPresupuestal" runat="server"></asp:TextBox></th>
             </tr>   

         </table>
     </div>

    
    
    <h1>PROYECTOS</h1>

    <input id="btnAdicionarProyecto" type="button" value="Crear nuevo proyecto" onclick="" /><br />
    <br />

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ProyectosDS" EnableModelValidation="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="IdProyecto" HeaderText="Id Proyecto" ReadOnly="True" SortExpression="IdProyecto" />
            <asp:BoundField DataField="FechaInicio" HeaderText="Fecha Inicio" ReadOnly="True" SortExpression="FechaInicio" />
            <asp:BoundField DataField="FechaFin" HeaderText="Fecha Fin" SortExpression="FechaFin" />
            <asp:BoundField DataField="CantidadPredios" HeaderText="Cantidad Predios" ReadOnly="True" SortExpression="CantidadPredios" />
            <asp:BoundField DataField="PrediosEjecutado" HeaderText="Predios Ejecutados" SortExpression="PrediosEjecutado" />
            <asp:BoundField DataField="ValorProyecto" HeaderText="Valor Proyecto" ReadOnly="True" SortExpression="ValorProyecto" />
            <asp:BoundField DataField="ValorEjecutado" HeaderText="Valor Ejecutado" SortExpression="ValorEjecutado" />
            <asp:BoundField DataField="NumDispPresupuestal" HeaderText="Num Disponibilidad Presupuestal" ReadOnly="True" SortExpression="NumDispPresupuestal" />
            <asp:BoundField DataField="FechaDispPresupuestal" HeaderText="Fecha Disponibilidad Presupuestal" ReadOnly="True" SortExpression="FechaDispPresupuestal" />
            <asp:BoundField DataField="CodDispPresupuestal" HeaderText="Cod Disponibilidad Presupuestal" ReadOnly="True" SortExpression="CodDispPresupuestal" />
            <asp:BoundField DataField="RubroDispPresupuestal" HeaderText="Rubro Disponibilidad Presupuestal" ReadOnly="True" SortExpression="RubroDispPresupuestal" />
            <asp:BoundField DataField="ValorDispPresupuestal" HeaderText="Valor Disponibilidad Presupuestal" ReadOnly="True" SortExpression="ValorDispPresupuestal" />
            <asp:BoundField DataField="NumResPresupuestal" HeaderText="Num Reserva Presupuestal" ReadOnly="True" SortExpression="NumResPresupuestal" />
            <asp:BoundField DataField="FechaResPresupuestal" HeaderText="Fecha Reserva Presupuestal" ReadOnly="True" SortExpression="FechaResPresupuestal" />
            <asp:BoundField DataField="CodResPresupuestal" HeaderText="Cod Reserva Presupuestal" ReadOnly="True" SortExpression="CodResPresupuestal" />
            <asp:BoundField DataField="RubroResPresupuestal" HeaderText="Rubro Reserva Presupuestal" ReadOnly="True" SortExpression="RubroResPresupuestal" />
            <asp:BoundField DataField="ValorResPresupuestal" HeaderText="Valor Reserva Presupuestal" ReadOnly="True" SortExpression="ValorResPresupuestal" />
        </Columns>
    
    </asp:GridView>
    <br />

    <asp:LinqDataSource ID="ProyectosDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="Proyecto" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>
</asp:Content>

