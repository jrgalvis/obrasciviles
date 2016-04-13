<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SuspencionesContrato.aspx.cs" Inherits="DynamicData_CustomPages_SuspencionesContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
        $(function () {
            dialog = $("#dialog-form-suspencion").dialog({
                autoOpen: false,
                height: 350,
                width: 500,
                modal: true,
                buttons: {
                    "Crear": function () {
                        var idcontrato = $("[id*=tbContrato]").val();
                        var num_acta = $("[id*=tbNumActa]").val();
                        var tipo_acta = $("[id*=tbTipoActa]").val();
                        var fecha_acta_susp = $("[id*=tbFechaActaSuspencion]").val();
                        var fecha_inicio_susp = $("[id*=tbFechaInicioSuspencion]").val();
                        var fecha_fin_susp = $("[id*=tbFechaFinSuspencion]").val();
                        var duracion_sancion = $("[id*=tbDuracion]").val();
                        var fecha_reanu_susp = $("[id*=tbFechaReanudacion]").val();


                        $.ajax({
                            type: "POST",
                            url: "SuspencionesContrato.aspx/CrearNuevaSuspencion",
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
                            success: resultado,
                            error: errores
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

        function resultado(msg) {
            alert('Suspención creada');
            $("#dialog-form-suspencion").dialog("close");

        }

        function errores(msg) {

            //msg.responseText tiene el mensaje de error enviado por el servidor

            alert('Error: ' + msg.responseText);

        }

    </script>
 
 
     <div id="dialog-form-suspencion" title="Crear sanción al presupuesto">
        <h2>Nueva Sancion </h2>
         <table>             
            
             <tr>
                <th><asp:Label runat="server" Text ="Presupuesto"></asp:Label></th>
                <th><asp:TextBox ID="tbContrato" runat="server"></asp:TextBox></th>
             </tr>
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

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SuspencionesContratoDS" EnableModelValidation="True" DataKeyNames="IdSuspencion,Contrato">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="IdSuspencion" HeaderText="Id Suspencion" ReadOnly="True" SortExpression="IdSuspencion" />
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
        TableName="SuspencionContrato" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>

</asp:Content>

