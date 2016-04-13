<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GarantiaContrato.aspx.cs" Inherits="DynamicData_CustomPages_GarantiaContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
        $(function () {
            dialog = $("#dialog-form-garcontrato").dialog({
                autoOpen: false,
                height: 500,
                width: 500,
                modal: true,
                buttons: {
                    "Crear nueva garantia presupuesto": function () {
                        var id_contrato = $("[id*=tbContrato]").val();
                        var tipo_garantia = $("[id*=DDLTipoGarantia]").val();
                        var nombre_asegurador = $("[id*=tbNombreAsegurador]").val();
                        var num_poliza = $("[id*=tbNumPoliza]").val();
                        var fecha_ini_vigencia = $("[id*=tbFechaInicioVigencia]").val();
                        var fecha_fin_vigencia = $("[id*=tbFechaFinVigencia]").val();
                        var num_cert_modificatorio = $("[id*=tbNumCertModificatorio]").val();
                        


                        $.ajax({
                            type: "POST",
                            url: "GarantiaContrato.aspx/CrearNuevaGarantiaContrato",
                            data: '{"id_contrato":"' + id_contrato +
                                '", "tipo_garantia":"' + tipo_garantia +
                                '", "nombre_asegurador":"' + nombre_asegurador +
                                '", "num_poliza":"' + num_poliza +
                                '", "fecha_ini_vigencia":"' + fecha_ini_vigencia +
                                '", "fecha_fin_vigencia":"' + fecha_fin_vigencia +
                                '", "num_cert_modificatorio":"' + num_cert_modificatorio + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultado,
                            error: errores
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

        function resultado(msg) {
            alert('Garantia creada para el presupuesto');
            $("#dialog-form-garcontrato").dialog("close");

        }

        function errores(msg) {

            //msg.responseText tiene el mensaje de error enviado por el servidor

            alert('Error: ' + msg.responseText);

        }

    </script>
 
 
     <div id="dialog-form-garcontrato" title="Crear garantia de presupuesto">
        <h2>Nueva Garantia para el presupuesto </h2>
         <table>             
            
             <tr>
                <th><asp:Label runat="server" Text ="Contrato"></asp:Label></th>
                <th><asp:TextBox ID="tbContrato" runat="server"></asp:TextBox></th>
             </tr>
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

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="GarantiaContratoDS" EnableModelValidation="True" DataKeyNames="IdGarantiaContrato">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="IdGarantiaContrato" HeaderText="Garantia Presupuesto" ReadOnly="True" SortExpression="IdGarantiaContrato" Visible="false" />
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
         TableName="GarantiaContrato">
     </asp:LinqDataSource>


     <asp:LinqDataSource ID="TipoGarantiaDS" 
         runat="server" 
         ContextTypeName="DataClassesModelDataContext" 
         TableName="TipoGarantia">
     </asp:LinqDataSource>

</asp:Content>

