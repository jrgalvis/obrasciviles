<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AccionesLegalesContrato.aspx.cs" Inherits="DynamicData_CustomPages_AccionesLegalesContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
        $(function () {
            dialog = $("#dialog-form-accion").dialog({
                autoOpen: false,
                height: 350,
                width: 500,
                modal: true,
                buttons: {
                    "Crear": function () {
                        var idcontrato = $("[id*=tbContrato]").val();
                        var clase_accion = $("[id*=tbClase]").val();
                        var etapa_procesal = $("[id*=tbEtapaProcesal]").val();
                        var fecha_accion = $("[id*=tbFecha]").val();
                        var despacho_accion = $("[id*=tbDespacho]").val();
                        var num_expediente = $("[id*=tbNumExpediente]").val();


                        $.ajax({
                            type: "POST",
                            url: "AccionesLegalesContrato.aspx/CrearNuevaAccionLegal",
                            data: '{"idcontrato":"' + idcontrato +
                                '", "clase_accion":"' + clase_accion +
                                '", "etapa_procesal":"' + etapa_procesal +
                                '", "fecha_accion":"' + fecha_accion +
                                '", "despacho_accion":"' + despacho_accion +
                                '", "num_expediente":"' + num_expediente + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultado,
                            error: errores
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

        function resultado(msg) {
            alert('Accion legal creada');
            $("#dialog-form-accion").dialog("close");

        }

        function errores(msg) {

            //msg.responseText tiene el mensaje de error enviado por el servidor

            alert('Error: ' + msg.responseText);

        }

    </script>
 
 
     <div id="dialog-form-accion" title="Crear accion legal al contrato">
        <h2>Nueva Accion Legal </h2>
         <table>             
            
             <tr>
                <th><asp:Label runat="server" Text ="Contrato"></asp:Label></th>
                <th><asp:TextBox ID="tbContrato" runat="server"></asp:TextBox></th>
             </tr>
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
                <th><asp:TextBox ID="tbFecha" runat="server"></asp:TextBox></th>
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
    
    <input id="btnAdicionarAccion" type="button" value="Crear nueva accion legal sobre el contrato" onclick="" /><br />
    <br />

    <h2>ACCIONES LEGALES DEL CONTRATO</h2>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="AccionesLegalesDS" EnableModelValidation="True" DataKeyNames="IdAccion,Contrato">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="IdAccion" HeaderText="Id Accion Legal" ReadOnly="True" SortExpression="IdAccion" />
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
        EnableUpdate="True">
    </asp:LinqDataSource>



</asp:Content>

