<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TipoActividad.aspx.cs" Inherits="DynamicData_CustomPages_TipoActividad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
        $(function () {
            dialog = $("#dialog-form-tipoact").dialog({
                autoOpen: false,
                height: 350,
                width: 500,
                modal: true,
                buttons: {
                    "Crear": function () {
                        var id_tipo_act = $("[id*=IdTipoActividad]").val();
                        var descrp_act = $("[id*=DescripcionTipoActividad]").val();
                        var prioridad_aju = $("[id*=PrioridadAjuste]").val();

                        $.ajax({
                            type: "POST",
                            url: "TipoActividad.aspx/CrearNuevoTipoActividad",
                            data: '{"id_tipo_act":"' + id_tipo_act +
                                '", "descrp_act":"' + descrp_act +
                                '", "prioridad_aju":"' + prioridad_aju + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultado,
                            error: errores
                        });


                    },
                    Cancel: function () {
                        $("#dialog-form-tipoact").dialog("close");
                    }
                },

            });

            $("#btnAdicionarTipoAct").button().on("click", function () {
                $("#dialog-form-tipoact").dialog("open");
            });
        });

        function resultado(msg) {
            alert('Tipo modificacion creado');
            $("#dialog-form-tipoact").dialog("close");

        }

        function errores(msg) {

            //msg.responseText tiene el mensaje de error enviado por el servidor

            alert('Error: ' + msg.responseText);

        }

    </script>

    <div id="dialog-form-tipoact" title="Nuevo tipo de actividad">
        <h2>Nuevo Tipo de Actividad </h2>
         <table>   
             <tr>
                <th><asp:Label runat="server" Text ="Id Tipo Actividad"></asp:Label></th>
                <th><asp:TextBox ID="IdTipoActividad" runat="server"></asp:TextBox></th>
             </tr>    
             <tr>
                <th><asp:Label runat="server" Text ="Descripción Actividad"></asp:Label></th>
                <th><asp:TextBox ID="DescripcionTipoActividad" runat="server"></asp:TextBox></th>
             </tr>
              <tr>
                <th><asp:Label runat="server" Text ="Prioridad Ajuste"></asp:Label></th>
                <th><asp:TextBox ID="PrioridadAjuste" runat="server"></asp:TextBox></th>
             </tr>        
             
         </table>
     </div>
    
             
<br>
<h2>TIPO DE ACTIVIDADES</h2>

    <input id="btnAdicionarTipoAct" type="button" value="Nuevo tipo de actividad" onclick="" /><br />
    <br />

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="TipoActividadDS" EnableModelValidation="True" AllowSorting="True" DataKeyNames="IdTipoActividad">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="IdTipoActividad" HeaderText="Código Tipo Actividad" ReadOnly="true" SortExpression="IdTipoActividad" />
            <asp:BoundField DataField="DescripcionTipoActividad" HeaderText="Descripción" SortExpression="DescripcionTipoActividad" />
            <asp:BoundField DataField="PrioridadAjuste" HeaderText="Prioridad Ajuste" SortExpression="PrioridadAjuste" />
        </Columns>
    </asp:GridView>

     <asp:LinqDataSource ID="TipoActividadDS" 
                           ContextTypeName="DataClassesModelDataContext"
                            TableName="TipoActividad"
                            EnableDelete="True" EnableInsert="True" EnableUpdate="True" 
                            runat="server" >        
    </asp:LinqDataSource>
</asp:Content>

