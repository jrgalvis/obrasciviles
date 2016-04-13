<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TipoGarantia.aspx.cs" Inherits="DynamicData_CustomPages_TipoGarantia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
         $(function () {
         dialog = $("#dialog-form-tipogar").dialog({
         autoOpen: false,
         height: 350,
         width: 500,
         modal: true,
         buttons: {
             "Crear": function () {
                 var id_garantia = $("[id*=IdGarantia]").val();
                 var descrp_garantia = $("[id*=DescripcionGarantia]").val();
                 
                
                     $.ajax({
                         type: "POST",
                         url: "TipoGarantia.aspx/CrearNuevoTipoGarantia",
                         data: '{"id_garantia":"' + id_garantia +
                             '", "descrp_garantia":"' + descrp_garantia + '"}',
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: resultado,
                         error: errores
                     }); 
                 
                 
             },
         Cancel: function () {
             $("#dialog-form-tipogar").dialog("close");
         }
         },
 
         });

         $("#btnAdicionarTipogar").button().on("click", function () {
             $("#dialog-form-tipogar").dialog("open");
         });
         });

         function resultado(msg) {
             alert('Tipo garantia creado');
             $("#dialog-form-tipogar").dialog("close");
             
         }
         
         function errores(msg) {
             
             //msg.responseText tiene el mensaje de error enviado por el servidor
             
             alert('Error: ' + msg.responseText);
             
         }

    </script>
 
 
     <div id="dialog-form-tipogar" title="Nuevo tipo de garantia">
        <h2>Nuevo Tipo de Garantia </h2>
         <table>   
             <tr>
                <th><asp:Label runat="server" Text ="Código Garantia"></asp:Label></th>
                <th><asp:TextBox ID="IdGarantia" runat="server"></asp:TextBox></th>
             </tr>    
             <tr>
                <th><asp:Label runat="server" Text ="Descripción"></asp:Label></th>
                <th><asp:TextBox ID="DescripcionGarantia" runat="server"></asp:TextBox></th>
             </tr>
             
             
         </table>
     </div>
    
   <h2>TIPO DE GARANTIAS</h2>

    <input id="btnAdicionarTipogar" type="button" value="Nuevo tipo de garantia" onclick="" /><br />
    <br />


    <br>


    <asp:gridview id="GridView1" runat="server" allowpaging="True" autogeneratecolumns="False" datasourceid="TipoGarantiaDS" enablemodelvalidation="True" allowsorting="True" datakeynames="IdGarantia">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="IdGarantia" HeaderText="Código Tipo Garantia" ReadOnly="true" SortExpression="IdGarantia" />
            <asp:BoundField DataField="DescripcionGarantia" HeaderText="Descripción" SortExpression="DescripcionGarantia" />
        </Columns>
    </asp:gridview>

     <asp:LinqDataSource ID="TipoGarantiaDS" 
                           ContextTypeName="DataClassesModelDataContext"
                            TableName="TipoGarantia"
                            EnableDelete="True" EnableInsert="True" EnableUpdate="True" 
                            runat="server" >        
    </asp:LinqDataSource>

</asp:Content>

