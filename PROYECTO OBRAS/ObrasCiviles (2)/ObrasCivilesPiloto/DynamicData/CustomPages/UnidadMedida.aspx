<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UnidadMedida.aspx.cs" Inherits="DynamicData_CustomPages_UnidadMedida" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
         $(function () {
         dialog = $("#dialog-form").dialog({
         autoOpen: false,
         height: 300,
         width: 400,
         modal: true,
         buttons: {
             "Crear nueva unidad de medida": function () {
                 var codunidad = $("[id*=tbCodigoUnidad").val();
                 var descunidad = $("[id*=tbDescripcionUnidad]").val();
                 
                 $.ajax({
                     type: "POST",
                     url: "UnidadMedida.aspx/CrearNuevaUnidadMedida",
                     data: '{"codigounidad":"'+ codunidad+'", "descripcionunidad":"'+descunidad+'"}',
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
             alert('Unidad de medida creada correctamente');
             dialog.dialog("close");
         }
         
         function errores(msg) {
             
             //msg.responseText tiene el mensaje de error enviado por el servidor
             
             alert('Error: ' + msg.responseText);
             
         }

    </script>
 
 
     <div id="dialog-form" title="Crear nueva unidad de medida">
        <h2>Nueva Unidad de Medida </h2>
         <table>
             <tr>
                <th><asp:Label runat="server" Text =" Código Unidad de Medida"></asp:Label></th>                 
                <th><asp:TextBox ID="tbCodigoUnidad" runat="server"></asp:TextBox></th>

             </tr>
             <tr>
                <th><asp:Label runat="server" Text =" Descripción Unidad de Medida"></asp:Label></th>
                <th><asp:TextBox ID="tbDescripcionUnidad" runat="server"></asp:TextBox></th>
             </tr>
             
         </table>
     </div>
    
    <input id="btnAdicionar" type="button" value="Crear Nueva Unidad de Medida" onclick="" /><br />
    <br />
    
    <asp:LinqDataSource ID="UnidadMedidaDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="UnidadMedida" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="UnidadMedidaDS" EnableModelValidation="True" DataKeyNames="CodUnidad" PageSize="20">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="DescripcionUnidad" HeaderText="Descripción Unidad" SortExpression="DescripcionUnidad" />
            <asp:BoundField DataField="CodUnidad" HeaderText="Código Unidad" SortExpression="CodUnidad" />
        </Columns>
    </asp:GridView>
</asp:Content>

