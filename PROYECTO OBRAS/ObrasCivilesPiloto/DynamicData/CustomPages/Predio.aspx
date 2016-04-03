<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Predio.aspx.cs" Inherits="DynamicData_CustomPages_Predio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
     <h2>PREDIOS</h2>
    <br />

    <asp:LinqDataSource 
        ID="PredioDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="Predio" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="TerceroDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="Tercero" 
        Where="TipoTercero == @TipoTercero">
        <WhereParameters>
            <asp:Parameter DefaultValue="1" Name="TipoTercero" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="PredioDS" EnableModelValidation="True" DataKeyNames="chip">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="chip" HeaderText="chip" ReadOnly="True" SortExpression="chip" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="True" SortExpression="Descripcion" />
            <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
            <asp:TemplateField HeaderText="Propietario" SortExpression="Tercero.Nombre">
                <ItemTemplate>
                     <%#Eval("Tercero.Nombre") %>  
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DDLTercero"
                        DataSourceID="TerceroDS"
                        DataValueField="IdTercero"
                        DataTextField="Nombre"
                        SelectedValue='<%#Bind("Propietario") %>'
                        runat="server" />
                </EditItemTemplate>             
            </asp:TemplateField> 
            <asp:BoundField DataField="MatriculaInmobiliaria" HeaderText="MatriculaInmobiliaria" SortExpression="MatriculaInmobiliaria" />
            <asp:BoundField DataField="Barrio" HeaderText="Barrio" ReadOnly="True" SortExpression="Barrio" />
            <asp:BoundField DataField="Estrato" HeaderText="Estrato" SortExpression="Estrato" />
            <asp:BoundField DataField="Localidad" HeaderText="Localidad" ReadOnly="True" SortExpression="Localidad" />
        </Columns>
    </asp:GridView>
</asp:Content>

