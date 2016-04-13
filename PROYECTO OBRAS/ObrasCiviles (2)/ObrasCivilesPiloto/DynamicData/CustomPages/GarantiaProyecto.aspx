<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GarantiaProyecto.aspx.cs" Inherits="DynamicData_CustomPages_GarantiaProyecto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
        $(function () {
            dialog = $("#dialog-form-garproyecto").dialog({
                autoOpen: false,
                height: 500,
                width: 500,
                modal: true,
                buttons: {
                    "Crear nueva garantia proyecto": function () {
                        var id_proyecto = $("[id*=tbProyecto]").val();
                        var tipo_garantia = $("[id*=DDLTipoGarantia]").val();
                        var nombre_asegurador = $("[id*=tbNombreAsegurador]").val();
                        var num_poliza = $("[id*=tbNumPoliza]").val();
                        var fecha_ini_vigencia = $("[id*=tbFechaInicioVigencia]").val();
                        var fecha_fin_vigencia = $("[id*=tbFechaFinVigencia]").val();
                        var num_cert_modificatorio = $("[id*=tbNumCertModificatorio]").val();
                        


                        $.ajax({
                            type: "POST",
                            url: "GarantiaProyecto.aspx/CrearNuevaGarantiaProyecto",
                            data: '{"id_proyecto":"' + id_proyecto +
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
                        $("#dialog-form-garproyecto").dialog("close");
                    }
                },

            });

            $("#btnAdicionarGarProyecto").button().on("click", function () {
                $("#dialog-form-garproyecto").dialog("open");
            });
        });

        function resultado(msg) {
            alert('Garantia creada para el proyecto');
            $("#dialog-form-garproyecto").dialog("close");

        }

        function errores(msg) {

            //msg.responseText tiene el mensaje de error enviado por el servidor

            alert('Error: ' + msg.responseText);

        }

    </script>
 
 
     <div id="dialog-form-garproyecto" title="Crear garantia de proyecto">
        <h2>Nueva Garantia para el Proyecto </h2>
         <table>             
            
             <tr>
                <th><asp:Label runat="server" Text ="Proyecto"></asp:Label></th>
                <th><asp:TextBox ID="tbProyecto" runat="server"></asp:TextBox></th>
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

     <h2>GARANTIAS PROYECTO</h2>

    <input id="btnAdicionarGarProyecto" type="button" value="Crear garantia de proyecto" onclick="" /><br />
    <br />

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="GarantiaProyectoDS" EnableModelValidation="True" DataKeyNames="IdGarantiaProyecto">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="IdGarantiaProyecto" HeaderText="Garantia Proyecto" ReadOnly="True" SortExpression="IdGarantiaProyecto" Visible="false" />
            <asp:BoundField DataField="Proyecto" HeaderText="Proyecto" ReadOnly="True" SortExpression="Proyecto" />
            
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


     <asp:LinqDataSource ID="GarantiaProyectoDS" 
         runat="server" 
         ContextTypeName="DataClassesModelDataContext" 
         EnableInsert="True" 
         EnableUpdate="True"
         TableName="GarantiaProyecto">
     </asp:LinqDataSource>


     <asp:LinqDataSource ID="TipoGarantiaDS" 
         runat="server" 
         ContextTypeName="DataClassesModelDataContext" 
         TableName="TipoGarantia">
     </asp:LinqDataSource>


</asp:Content>

