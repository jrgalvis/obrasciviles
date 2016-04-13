<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CostosIndirectosContrato.aspx.cs" Inherits="DynamicData_CustomPages_CostosIndirectosContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:LinqDataSource ID="CostosIndirectosDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="CostosIndirectosContrato" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="TipoCostoIndirectoDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="TipoCostosIndirectos">
    </asp:LinqDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CodigoContrato,IdTipoCostoIndirecto" DataSourceID="CostosIndirectosDS" EnableModelValidation="True">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                    <%--<asp:BoundField DataField="IdTipoCostoIndirecto" HeaderText="IdTipoCostoIndirecto" ReadOnly="True" SortExpression="IdTipoCostoIndirecto" />--%>
                    <asp:TemplateField HeaderText="Tipo Costo Indirecto" SortExpression="IdTipoCostoIndirecto.Descripcion">
                        <ItemTemplate>
                             <%#Eval("TipoCostosIndirectos.Descripcion") %>  
                        </ItemTemplate>
                        <%--<EditItemTemplate>
                            <asp:DropDownList ID="DDLTipoCostoIndirecto"
                                DataSourceID="TipoCostoIndirectoDS"
                                DataValueField="IdTipoCostoIndirecto"
                                DataTextField="Descripcion"
                                SelectedValue='<%#Bind("IdTipoCostoIndirecto") %>'
                                runat="server" />
                        </EditItemTemplate>     --%>  
                    </asp:TemplateField>
                    <asp:BoundField DataField="Porcentaje" HeaderText="Porcentaje" SortExpression="Porcentaje" />
                    <asp:BoundField DataField="ValorPresupuestado" HeaderText="Valor Presupuestado" SortExpression="ValorPresupuestado" />
                    <asp:BoundField DataField="ValorReal" HeaderText="Valor Real" SortExpression="ValorReal" />
        </Columns>
    </asp:GridView>
</asp:Content>

