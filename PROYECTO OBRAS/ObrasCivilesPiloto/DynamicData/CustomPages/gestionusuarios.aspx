<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GestionUsuarios.aspx.cs" Inherits="DynamicData_gestionusuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/Overcast/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.numeric.js" type="text/javascript"></script>

    
    <script type="text/javascript">
         $(function () {
         dialog = $("#dialog-form-usuario").dialog({
         autoOpen: false,
         height: 350,
         width: 500,
         modal: true,
         buttons: {
             "Crear nuevo usuario": function () {
                 var login = $("[id*=tbUsuario]").val();
                 var password = $("[id*=tbPsw]").val();
                 var passwordconf = $("[id*=tbPswConf]").val();
                 var tercero = $("[id*=DDLTerceroNuevo]").val();
                 
                 if (password==passwordconf)
                 {
                     $.ajax({
                         type: "POST",
                         url: "GestionUsuarios.aspx/CrearNuevoUsuario",
                         data: '{"login":"' + login +
                             '", "psw":"' + password +
                             '", "tercero":"' + tercero + '"}',
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: resultado,
                         error: errores
                     }); 
                 }
                 else {
                     alert('Contraseña no coincide');
                 }

                 
             },
         Cancel: function () {
             $("#dialog-form-usuario").dialog("close");
         }
         },
 
         });

         $("#btnAdicionarUsuario").button().on("click", function () {
             $("#dialog-form-usuario").dialog("open");
         });
         });

         function resultado(msg) {
             alert('Usuario creado');
             $("#dialog-form-usuario").dialog("close");
             
         }
         
         function errores(msg) {
             
             //msg.responseText tiene el mensaje de error enviado por el servidor
             
             alert('Error: ' + msg.responseText);
             
         }

    </script>
 
 
     <div id="dialog-form-usuario" title="Crear nuevo usuario">
        <h2>Nuevo Usuario </h2>
         <table>   
             <tr>
                <th><asp:Label runat="server" Text ="Usuario"></asp:Label></th>
                <th><asp:TextBox ID="tbUsuario" runat="server"></asp:TextBox></th>
             </tr>    
             <tr>
                <th><asp:Label runat="server" Text ="Contraseña"></asp:Label></th>
                <th><asp:TextBox ID="tbPsw" runat="server" TextMode="Password"></asp:TextBox></th>
             </tr>
             <tr>
                <th><asp:Label runat="server" Text ="Confirmar Contraseña"></asp:Label></th>
                <th><asp:TextBox ID="tbPswConf" runat="server" TextMode="Password"></asp:TextBox></th>
             </tr> 
             
             <tr>
                <th><asp:Label runat="server" Text ="Tercero"></asp:Label></th>
                <th><asp:DropDownList ID="DDLTerceroNuevo"
                        DataSourceID="TerceroDS"
                        DataValueField="IdTercero"
                        DataTextField="Nombre"
                        runat="server" />
                </th>
             </tr>
             
         </table>
     </div>
    
    <h2>USUARIOS</h2>

    <input id="btnAdicionarUsuario" type="button" value="Crear nuevo usuario" onclick="" /><br />
    <br />
    
    <asp:GridView ID="gvUsuarios" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="UsuariosDS" EnableModelValidation="True" DataKeyNames="Login">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="Login" HeaderText="Usuario" ReadOnly="True" SortExpression="Login" />            
            <asp:BoundField DataField="Contrasena" HeaderText="Contrasena" SortExpression="Contrasena" />
            <asp:TemplateField HeaderText="Tercero" SortExpression="Tercero1.Nombre">
                <ItemTemplate>
                     <%#Eval("Tercero1.Nombre") %>  
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DDLTercero"
                        DataSourceID="TerceroDS"
                        DataValueField="IdTercero"
                        DataTextField="Nombre"
                        SelectedValue='<%#Bind("Tercero") %>'
                        runat="server" />
                </EditItemTemplate>       
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:LinqDataSource ID="UsuariosDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" 
        TableName="Usuarios" >
    </asp:LinqDataSource>
    
    
    <asp:LinqDataSource ID="TerceroDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="Tercero">
    </asp:LinqDataSource>
    
    <br />

</asp:Content>

