<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Actividad.aspx.cs" Inherits="DynamicData_CustomPages_Actividad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery.numeric.js" type="text/javascript"></script>
    
     <script type="text/javascript">
       $(document).ready(function () {
             $('.numeric').numeric('.');
             $('.numeric').numeric(',');
             $('.numeric').focus(function () { $(this).css('background-color', '#ECF8E0'); });
           $('.numeric').blur(function () { $(this).css('background-color', 'white'); });
         });
         var b = 0;
         

    
         $(function () {
             dialog = $("#dialog-form-actividad").dialog({
         autoOpen: false,
         height: 350,
         width: 500,
         modal: true,
         buttons: {
             "Crear nueva actividad": function () {
                 var desActividad = $("[id*=tbDesActividad]").val();
                 var tipoActividad = $("[id*=ddlTipoActividad]").val();
                 var unidadMedida = $("[id*=ddlUnidadMedida]").val();
                 var valorunitario = $("[id*=tbValorunitario]").val();
                 
                 if (valorunitario != 0)
                 {
                     $.ajax({
                         type: "POST",
                         url: "Actividad.aspx/CrearNuevaActividad",
                         data: '{"desActividad":"' + desActividad +
                             '", "tipoActividad":"' + tipoActividad +
                             '", "unidadMedida":"' + unidadMedida +
                             '", "valorUnitario":"' + valorunitario + '"}',
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: resultado,
                         error: errores
                     }); 
                 }
                 else {
                     alert('Valor Unitario no puede ser Cero');
                 }

                 
             },
         Cancel: function () {
             $("#dialog-form-actividad").dialog("close");
         }
         },
 
         });

             $("#btnAdicionarActividad").button().on("click", function () {
                 b = 1;
             $("#dialog-form-actividad").dialog("open");
         });
         });

         function resultado(msg) {
             alert('Actividad creada');
             b = 0;
             $("#dialog-form-actividad").dialog("close");
             
         }
         
         function errores(msg) {
             
             //msg.responseText tiene el mensaje de error enviado por el servidor
             
             alert('Error: ' + msg.responseText);
             
         }

    </script>
 
 

     <div id="dialog-form-actividad" title="Crear nueva actividad">
        <h2>Nueva Actividad </h2>
         <table>   
             <tr>
                <th><asp:Label runat="server" Text ="Actividad"></asp:Label></th>
                <th><asp:TextBox ID="tbDesActividad" runat="server"></asp:TextBox></th>
             </tr>    
             <tr>
                <th><asp:Label runat="server" Text ="tipo Actividad"></asp:Label></th>

                <th>
                     <asp:DropDownList ID="ddlTipoActividad"
                        DataSourceID="TipoActividadDS"
                        DataValueField="IdTipoActividad"
                        DataTextField="DescripcionTipoActividad"
                        runat="server" />

                    

                </th>


             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Unidad de Medida"></asp:Label></th>
                <th>
                    <asp:DropDownList ID="ddlUnidadMedida"
                        DataSourceID="UnidadMedidaDS"
                        DataValueField="CodUnidad"
                        DataTextField="CodUnidad"
                        runat="server" />
                    
                </th>
             </tr> 
             
             <tr>
                <th><asp:Label runat="server" Text ="Valor Unitario"></asp:Label></th>

                <th><asp:TextBox ID="tbValorunitario" runat="server" Class="numeric"></asp:TextBox>
                </th>
             </tr>
             
         </table>
     </div>
          
<h2>ACTIVIDADES</h2>
     <input id="btnAdicionarActividad" type="button" value="Crear nueva Actividad" onclick="" /><br />
    <br />
    <div>
        Seleccione Tipo de Actividad:
        <asp:DropDownList ID="DDLFiltroTipoActividad"
                        DataSourceID="TipoActividadDS"
                        DataValueField="IdTipoActividad"
                        DataTextField="DescripcionTipoActividad"
                        AutoPostBack="true"
                        runat="server" />
    </div>

    <br />

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ActividadDS" EnableModelValidation="True" DataKeyNames="IdActividad">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="IdActividad" HeaderText="Id Actividad" ReadOnly="True" SortExpression="IdActividad" />
            <asp:BoundField DataField="DescripcionActividad" HeaderText="Descripción Actividad" SortExpression="DescripcionActividad" />
            <asp:TemplateField HeaderText="Tipo Actividad" SortExpression="TipoActividad1.DescripcionTipoActividad">
                <ItemTemplate>
                     <%#Eval("TipoActividad1.DescripcionTipoActividad") %>  
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DDLTipoActividad"
                        DataSourceID="TipoActividadDS"
                        DataValueField="IdTipoActividad"
                        DataTextField="DescripcionTipoActividad"
                        SelectedValue='<%#Bind("TipoActividad") %>'
                        runat="server" />
                </EditItemTemplate>       
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Unidad Medida" SortExpression="UnidadMedida1.CodUnidad">
                <ItemTemplate>
                     <%#Eval("UnidadMedida1.CodUnidad") %>  
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DDLUnidadMedida"
                        DataSourceID="UnidadMedidaDS"
                        DataValueField="CodUnidad"
                        DataTextField="CodUnidad"
                        SelectedValue='<%#Bind("UnidadMedida") %>'
                        runat="server" />
                </EditItemTemplate>             
            </asp:TemplateField> 
            
            <asp:BoundField DataField="ValorUnitario" HeaderText="Valor Unitario" SortExpression="ValorUnitario" />
        </Columns>
    </asp:GridView>
    
    <asp:LinqDataSource ID="ActividadDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        EnableDelete="True" EnableInsert="True" EnableUpdate="True"        
        TableName="Actividad" Where="TipoActividad == @TipoActividad"
        >
        <WhereParameters>
            <asp:ControlParameter ControlID="DDLFiltroTipoActividad" Name="TipoActividad" PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
            
     
    <asp:LinqDataSource ID="TipoActividadDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="TipoActividad">
    </asp:LinqDataSource>
          
    <asp:LinqDataSource ID="UnidadMedidaDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="UnidadMedida">
    </asp:LinqDataSource>
          
<br>
</asp:Content>

