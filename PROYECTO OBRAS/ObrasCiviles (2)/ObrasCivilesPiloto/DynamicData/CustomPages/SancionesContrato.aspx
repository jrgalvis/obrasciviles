<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SancionesContrato.aspx.cs" Inherits="DynamicData_CustomPages_SancionesContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
        $(function () {
            dialog = $("#dialog-form-sancion").dialog({
                autoOpen: false,
                height: 350,
                width: 500,
                modal: true,
                buttons: {
                    "Crear": function () {
                        var idcontrato = $("[id*=tbContrato]").val();
                        var num_resolucion = $("[id*=tbNumResolucion]").val();
                        var objeto_sancion = $("[id*=tbObjeto]").val();
                        var fecha_sancion = $("[id*=tbFecha]").val();


                        $.ajax({
                            type: "POST",
                            url: "SancionesContrato.aspx/CrearNuevaSancion",
                            data: '{"idcontrato":"' + idcontrato +
                                '", "num_resolucion":"' + num_resolucion +
                                '", "objeto_sancion":"' + objeto_sancion +
                                '", "fecha_sancion":"' + fecha_sancion + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultado,
                            error: errores
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

        function resultado(msg) {
            alert('Sancion creada');
            $("#dialog-form-sancion").dialog("close");

        }

        function errores(msg) {

            //msg.responseText tiene el mensaje de error enviado por el servidor

            alert('Error: ' + msg.responseText);

        }

    </script>
 
 
     <div id="dialog-form-sancion" title="Crear sanción al presupuesto">
        <h2>Nueva Sancion </h2>
         <table>             
            
             <tr>
                <th><asp:Label runat="server" Text ="Presupuesto"></asp:Label></th>
                <th><asp:TextBox ID="tbContrato" runat="server"></asp:TextBox></th>
             </tr>
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
                <th><asp:TextBox ID="tbFecha" runat="server"></asp:TextBox></th>
             </tr>
             
         </table>
     </div>
    
    <input id="btnAdicionarSancion" type="button" value="Crear nueva sancion sobre el presupuesto" onclick="" /><br />
    <br />

    <h2>SANCIONES DEL PRESUPUESTO</h2>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SancionesContratoDS" EnableModelValidation="True" DataKeyNames="IdSancion,Contrato">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="IdSancion" HeaderText="Id Sancion" ReadOnly="True" SortExpression="IdSancion" />
            <asp:BoundField DataField="Contrato" HeaderText="Contrato" ReadOnly="True" SortExpression="Contrato" />
            <asp:BoundField DataField="NumResolucion" HeaderText="Número Resolucion" SortExpression="NumResolucion" />
            <asp:BoundField DataField="Objeto" HeaderText="Objeto" SortExpression="Objeto" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
        </Columns>

    </asp:GridView>

    <asp:LinqDataSource ID="SancionesContratoDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="SancionesContrato" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>

</asp:Content>

