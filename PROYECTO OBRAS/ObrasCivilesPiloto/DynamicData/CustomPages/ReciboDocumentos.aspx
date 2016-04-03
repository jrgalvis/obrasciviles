<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ReciboDocumentos.aspx.cs" Inherits="DynamicData_CustomPages_ReciboDocumentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
        $(function () {
            dialog = $("#dialog-form-recibodoc").dialog({
                autoOpen: false,
                height: 500,
                width: 500,
                modal: true,
                buttons: {
                    "Crear documento": function () {
                        var id_contrato = $("[id*=tbContrato]").val();
                        var clase_documento = $("[id*=tbClaseDoc]").val();
                        var cantidad = $("[id*=tbCantidad]").val();
                        var descripcion = $("[id*=tbDescripcion]").val();


                        $.ajax({
                            type: "POST",
                            url: "ReciboDocumentos.aspx/CrearNuevoDocumento",
                            data: '{"id_contrato":"' + id_contrato +
                                '", "clase_documento":"' + clase_documento +
                                '", "cantidad":"' + cantidad +
                                '", "descripcion":"' + descripcion + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: resultado,
                            error: errores
                        });
                    },

                    Cancel: function () {
                        $("#dialog-form-recibodoc").dialog("close");
                    }
                },

            });

            $("#btnReciboDocumento").button().on("click", function () {
                $("#dialog-form-recibodoc").dialog("open");
            });
        });

        function resultado(msg) {
            alert('Documento creado');
            $("#dialog-form-recibodoc").dialog("close");

        }

        function errores(msg) {

            //msg.responseText tiene el mensaje de error enviado por el servidor

            alert('Error: ' + msg.responseText);

        }

    </script>

    <div id="dialog-form-recibodoc" title="Recibo de Documentos">
        <h2>Recibo de documentos</h2>
         <table>
             <tr>
                <th><asp:Label runat="server" Text ="Contrato"></asp:Label></th>
                <th><asp:TextBox ID="tbContrato" runat="server"></asp:TextBox></th>
             </tr>                     
             <tr>
                <th><asp:Label runat="server" Text ="Clase Documento"></asp:Label></th>
                <th><asp:TextBox ID="tbClaseDoc" runat="server"></asp:TextBox></th>
             </tr>              
             <tr>
                <th><asp:Label runat="server" Text ="Cantidad"></asp:Label></th>
                <th><asp:TextBox ID="tbCantidad" runat="server"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Descripcion"></asp:Label></th>
                <th><asp:TextBox ID="tbDescripcion" runat="server"></asp:TextBox></th>
             </tr>

         </table>
     </div>


    <h2>RECIBO DOCUMENTOS</h2>

    <input id="btnReciboDocumento" type="button" value="Nuevo Documento" onclick="" /><br />
    <br />

    <asp:gridview runat="server" EnableModelValidation="True" AllowPaging="True" DataSourceID="ReciboDocumentosDS" AutoGenerateColumns="False" DataKeyNames="Iddocumento,Contrato">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="Iddocumento" HeaderText="Iddocumento" Visible="False" ReadOnly="True" SortExpression="Iddocumento" />
            <asp:BoundField DataField="Contrato" HeaderText="Contrato" ReadOnly="True" SortExpression="Contrato" />
            <asp:BoundField DataField="Clase" HeaderText="Clase" SortExpression="Clase" />
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
        </Columns>
        </asp:gridview>

    <asp:linqdatasource ID="ReciboDocumentosDS"
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="ReciboDocumentos" 
        EnableInsert="True" 
        EnableUpdate="True"></asp:linqdatasource>

</asp:Content>

