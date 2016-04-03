<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TipoModificacion.aspx.cs" Inherits="DynamicData_CustomPages_TipoModificacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
         $(function () {
             dialog = $("#dialog-form-tipomod").dialog({
         autoOpen: false,
         height: 350,
         width: 500,
         modal: true,
         buttons: {
             "Crear": function () {
                 var id_tipo_mod = $("[id*=IdTipoModificacion]").val();
                 var descrp_mod = $("[id*=DescripcionMod]").val();
                 
                
                     $.ajax({
                         type: "POST",
                         url: "TipoModificacion.aspx/CrearNuevoTipoModificacion",
                         data: '{"id_tipo_mod":"' + id_tipo_mod +
                             '", "descrp_mod":"' + descrp_mod + '"}',
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: resultado,
                         error: errores
                     }); 
                 
                 
             },
         Cancel: function () {
             $("#dialog-form-tipomod").dialog("close");
         }
         },
 
         });

         $("#btnAdicionarTipoMod").button().on("click", function () {
             $("#dialog-form-tipomod").dialog("open");
         });
         });

         function resultado(msg) {
             alert('Tipo modificacion creado');
             $("#dialog-form-tipomod").dialog("close");
             
         }
         
         function errores(msg) {
             
             //msg.responseText tiene el mensaje de error enviado por el servidor
             
             alert('Error: ' + msg.responseText);
             
         }

    </script>
 
 
     <div id="dialog-form-tipomod" title="Nuevo tipo de modificacion contrato">
        <h2>Nuevo Tipo de Modificacion de Contrato </h2>
         <table>   
             <tr>
                <th><asp:Label runat="server" Text ="Id Tipo Modificacion"></asp:Label></th>
                <th><asp:TextBox ID="IdTipoModificacion" runat="server"></asp:TextBox></th>
             </tr>    
             <tr>
                <th><asp:Label runat="server" Text ="Descripción"></asp:Label></th>
                <th><asp:TextBox ID="DescripcionMod" runat="server"></asp:TextBox></th>
             </tr>
             
             
         </table>
     </div>
    
    <h2>TIPOS MODIFICACIONES CONTRATO</h2>

    <input id="btnAdicionarTipoMod" type="button" value="Nuevo tipo de modificacion de contrato" onclick="" /><br />
    <br />


    <br>

    <asp:gridview id="GridView1" runat="server" allowpaging="True" autogeneratecolumns="False" datasourceid="TipoModificacionContratoDS" enablemodelvalidation="True" allowsorting="True" datakeynames="IdTipoModificacion">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="IdTipoModificacion" HeaderText="Id Tipo Modificacion" ReadOnly="true" SortExpression="IdTipoModificacion" />
            <asp:BoundField DataField="DescripcionModificacion" HeaderText="Descripción" SortExpression="DescripcionModificacion" />
        </Columns>
    </asp:gridview>

     <asp:LinqDataSource ID="TipoModificacionContratoDS" 
                           ContextTypeName="DataClassesModelDataContext"
                            TableName="TipoModificacion"
                            EnableDelete="True" EnableInsert="True" EnableUpdate="True" 
                            runat="server" >        
    </asp:LinqDataSource>


</asp:Content>

