<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Tercero.aspx.cs" Inherits="DynamicData_CustomPages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
         $(function () {
         dialog = $("#dialog-form-tercero").dialog({
         autoOpen: false,
         height: 500,
         width: 500,
         modal: true,
         buttons: {
             "Crear nuevo tercero": function () {
                 var tipoidentificacion = $("[id*=DDLTipoIdentificacion]").val();
                 var ident = $("[id*=tbIdentificacion]").val();
                 var nomb = $("[id*=tbNombre]").val();
                 var dir = $("[id*=tbDireccion]").val();
                 var telfijo = $("[id*=tbTelefono]").val();
                 var celu = $("[id*=tbCelular]").val();
                 var tipoter = $("[id*=DDLTipoTercero]").val();
                 
                 $.ajax({
                     type: "POST",
                     url: "Tercero.aspx/CrearNuevoTercero",
                     data: '{"tipoId":"' + tipoidentificacion +
                         '", "identificacion":"' + ident +
                         '", "nombre":"' + nomb +
                         '", "direccion":"' + dir +
                         '", "telefonofijo":"' + telfijo +
                         '", "celular":"' + celu +
                         '", "tipotercero":"' + tipoter + '"}',
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: resultado,
                     error: errores
                 });
             },
         Cancel: function () {
             $("#dialog-form-tercero").dialog("close");
         }
         },
 
         });

         $("#btnAdicionarTercero").button().on("click", function () {
             $("#dialog-form-tercero").dialog("open");
         });
         });

         function resultado(msg) {
             alert('Tercero creado');
             $("#dialog-form-tercero").dialog("close");
             
         }
         
         function errores(msg) {
             
             //msg.responseText tiene el mensaje de error enviado por el servidor
             
             alert('Error: ' + msg.responseText);
             
         }

    </script>
 
 
     <div id="dialog-form-tercero" title="Crear Tercero">
        <h2>Nueva Tercero </h2>
         <table>   
             <tr>
                <th><asp:Label runat="server" Text ="Tipo Identificación"></asp:Label></th>
                <th><asp:DropDownList ID="DDLTipoIdentificacion"
                        DataSourceID="TipoIdentificacionDS"
                        DataValueField="IdTipo"
                        DataTextField="IdTipo"
                        runat="server" />
                </th>
             </tr> 
            
             <tr>
                <th><asp:Label runat="server" Text ="Identificación"></asp:Label></th>
                <th><asp:TextBox ID="tbIdentificacion" runat="server"></asp:TextBox></th>
             </tr>    
             <tr>
                <th><asp:Label runat="server" Text ="Nombre"></asp:Label></th>
                <th><asp:TextBox ID="tbNombre" runat="server"></asp:TextBox></th>
             </tr> 
             <tr>
                <th><asp:Label runat="server" Text ="Dirección"></asp:Label></th>
                <th><asp:TextBox ID="tbDireccion" runat="server"></asp:TextBox></th>
             </tr> 
             <tr>
                <th><asp:Label runat="server" Text ="Telefono Fijo"></asp:Label></th>
                <th><asp:TextBox ID="tbTelefono" runat="server"></asp:TextBox></th>
             </tr> 
             <tr>
                <th><asp:Label runat="server" Text ="Celular"></asp:Label></th>
                <th><asp:TextBox ID="tbCelular" runat="server"></asp:TextBox></th>
             </tr>      
              
             <tr>
                <th><asp:Label runat="server" Text ="Tipo Tercero"></asp:Label></th>
                <th><asp:DropDownList ID="DDLTipoTercero"
                        DataSourceID="TipoTerceroDS"
                        DataValueField="IdTipoTercero"
                        DataTextField="DescripcionTipoTercero"
                        runat="server" />
                </th>
             </tr>
             
         </table>
     </div>


    <h2>TERCEROS</h2>


    <br />
    <div>
        Seleccione Tipo de Tercero:
        <asp:DropDownList ID="DDLFiltroTipoTerceroS"
                        DataSourceID="TipoTerceroDS"
                        DataValueField="IdTipoTercero"
                        DataTextField="DescripcionTipoTercero"
                        AutoPostBack="true"
                        runat="server" />
    </div>

    <br />

    <asp:LinqDataSource ID="TercerosDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="Tercero" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="TipoTercero == @TipoTercero">
        <WhereParameters>
            <asp:ControlParameter ControlID="DDLFiltroTipoTerceroS" Name="TipoTercero" PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>


     <input id="btnAdicionarTercero" type="button" value="Crear nuevo tercero" onclick="" /><br />
    <br />

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="TercerosDS" EnableModelValidation="True" DataKeyNames="IdTercero">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="IdTercero" HeaderText="IdTercero" ReadOnly="True" SortExpression="IdTercero" />
            <asp:TemplateField HeaderText="Tipo Identificacion" SortExpression="TipoIdentificacion1.IdTipo">
                <ItemTemplate>
                     <%#Eval("TipoIdentificacion1.IdTipo") %>  
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DDLTipoIdentificacion"
                        DataSourceID="TipoIdentificacionDS"
                        DataValueField="IdTipo"
                        DataTextField="IdTipo"
                        SelectedValue='<%#Bind("TipoIdentificacion") %>'
                        runat="server" />
                </EditItemTemplate>             
            </asp:TemplateField> 
            <asp:BoundField DataField="Identificacion" HeaderText="Identificacion" SortExpression="Identificacion" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
            <asp:BoundField DataField="TelefonoFijo" HeaderText="TelefonoFijo" SortExpression="TelefonoFijo" />
            <asp:BoundField DataField="Celular" HeaderText="Celular" SortExpression="Celular" />
            <asp:TemplateField HeaderText="Tipo Tercero" SortExpression="TipoTercero1.DescripcionTipoTercero">
                <ItemTemplate>
                     <%#Eval("TipoTercero1.DescripcionTipoTercero") %>  
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DDLTipoTercero"
                        DataSourceID="TipoTerceroDS"
                        DataValueField="IdTipoTercero"
                        DataTextField="DescripcionTipoTercero"
                        SelectedValue='<%#Bind("TipoTercero") %>'
                        runat="server" />
                </EditItemTemplate>             
            </asp:TemplateField> 
        </Columns>
    </asp:GridView>



    <asp:LinqDataSource ID="TipoTerceroDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="TipoTercero">
    </asp:LinqDataSource>



    <asp:LinqDataSource ID="TipoIdentificacionDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="TipoIdentificacion">
    </asp:LinqDataSource>



</asp:Content>

