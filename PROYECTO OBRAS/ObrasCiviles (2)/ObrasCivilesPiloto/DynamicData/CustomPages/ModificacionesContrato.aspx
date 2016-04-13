<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ModificacionesContrato.aspx.cs" Inherits="DynamicData_CustomPages_ModificacionesContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
        $(function () {
            dialog = $("#dialog-form-modcontrato").dialog({
                autoOpen: false,
                height: 500,
                width: 500,
                modal: true,
                buttons: {
                    "Crear nueva modificacion presupuesto": function () {
                        var id_contrato = $("[id*=tbContrato]").val();
                        var tipo_modificacion = $("[id*=DDLTipoModificacion]").val();
                        var fecha_modificacion = $("[id*=tbFechaModificacion]").val();
                        var plazo_modificacion = $("[id*=tbPlazoModificacion]").val();
                        var valor_modificacion = $("[id*=tbValorModificacion]").val();                        


                        $.ajax({
                            type: "POST",
                            url: "ModificacionesContrato.aspx/CrearNuevaModificacionContrato",
                            data: '{"id_contrato":"' + id_contrato +
                                '", "tipo_modificacion":"' + tipo_modificacion +
                                '", "fecha_modificacion":"' + fecha_modificacion +
                                '", "plazo_modificacion":"' + plazo_modificacion +
                                '", "valor_modificacion":"' + valor_modificacion + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultado,
                            error: errores
                        });
                    },

                    Cancel: function () {
                        $("#dialog-form-modcontrato").dialog("close");
                    }
                },

            });

            $("#btnAdicionarModContrato").button().on("click", function () {
                $("#dialog-form-modcontrato").dialog("open");
            });
        });

        function resultado(msg) {
            alert('Modificación creada para el presupuesto');
            $("#dialog-form-modcontrato").dialog("close");

        }

        function errores(msg) {

            //msg.responseText tiene el mensaje de error enviado por el servidor

            alert('Error: ' + msg.responseText);

        }

    </script>
 
 
     <div id="dialog-form-modcontrato" title="Crear modificación de presupuesto">
        <h2>Nueva modificación para el presupuesto </h2>
         <table>             
            
             <tr>
                <th><asp:Label runat="server" Text ="Contrato"></asp:Label></th>
                <th><asp:TextBox ID="tbContrato" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Tipo Modificacion"></asp:Label></th>
                <th><asp:DropDownList ID="DDLTipoModificacion"
                        DataSourceID="TipoModificacionDS"
                        DataValueField="IdTipoModificacion"
                        DataTextField="DescripcionModificacion"
                        runat="server" />
                </th>
             </tr> 
             <tr>
                <th><asp:Label runat="server" Text ="Fecha Modificacion"></asp:Label></th>
                <th><asp:TextBox ID="tbFechaModificacion" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Plazo Modificacion"></asp:Label></th>
                <th><asp:TextBox ID="tbPlazoModificacion" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Valor Modificacion"></asp:Label></th>
                <th><asp:TextBox ID="tbValorModificacion" runat="server"></asp:TextBox></th>
             </tr>
            

         </table>
     </div>

     <h2>MODIFICACIONES PRESUPUESTO</h2>

    <input id="btnAdicionarModContrato" type="button" value="Crear modificación de presupuesto" onclick="" /><br />
    


    <br />

     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="IdModificacion,Contrato" DataSourceID="ModificacionContratoDS" EnableModelValidation="True">
         <Columns>
             <asp:CommandField ShowEditButton="True" />
             <asp:BoundField DataField="IdModificacion" HeaderText="IdModificacion" InsertVisible="False" ReadOnly="True" SortExpression="IdModificacion" />
             <asp:BoundField DataField="Contrato" HeaderText="Contrato" ReadOnly="True" SortExpression="Contrato" />
             <asp:BoundField DataField="TipoModificacion" HeaderText="TipoModificacion" SortExpression="TipoModificacion" />

            <asp:TemplateField HeaderText="Tipo Modificacion" SortExpression="TipoModificacion1.DescripcionModificacion">
                <ItemTemplate >                               
                   
                    <asp:Label ID="lbDescripcion" runat="server"></asp:Label>
                   
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DDLTipoModificacionContrato"
                    DataSourceID="TipoModificacionDS"
                    DataValueField="IdTipoModificacion"
                    DataTextField="DescripcionModificacion"
                    SelectedValue='<%#Bind("TipoModificacion") %>'
                    runat="server" />
                </EditItemTemplate>

            </asp:TemplateField>

             <asp:BoundField DataField="FechaModificacion" HeaderText="FechaModificacion" SortExpression="FechaModificacion" />
             <asp:BoundField DataField="PlazoModificacion" HeaderText="PlazoModificacion" SortExpression="PlazoModificacion" />
             <asp:BoundField DataField="ValorModificacion" HeaderText="ValorModificacion" SortExpression="ValorModificacion" />
         </Columns>
    </asp:GridView>

    <asp:LinqDataSource ID="ModificacionContratoDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        EnableInsert="True" 
        EnableUpdate="True" 
        TableName="ModificacionesContrato">
    </asp:LinqDataSource>


     <asp:LinqDataSource 
         ID="TipoModificacionDS" 
         runat="server" 
         ContextTypeName="DataClassesModelDataContext" 
         TableName="TipoModificacion">
    </asp:LinqDataSource>


</asp:Content>

