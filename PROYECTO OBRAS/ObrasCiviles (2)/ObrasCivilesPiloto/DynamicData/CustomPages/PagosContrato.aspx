<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PagosContrato.aspx.cs" Inherits="DynamicData_CustomPages_PagosContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h2>PAGOS DEL PRESUPUESTO</h2>
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="PagosContratoDS" EnableModelValidation="True" AutoGenerateColumns="False" DataKeyNames="IdPago">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="Contrato" HeaderText="Contrato"  ReadOnly="True" SortExpression="Contrato" />
            <asp:BoundField DataField="DescripcionPago" HeaderText="Descripción Pago" SortExpression="DescripcionPago" />            
            <asp:BoundField DataField="PorcentajePago" HeaderText="Porcentaje Pago" SortExpression="PorcentajePago" />
            <asp:BoundField DataField="FechaPago" HeaderText="Fecha Pago" SortExpression="FechaPago" />
            <asp:BoundField DataField="ValorPago" HeaderText="Valor Pago" SortExpression="ValorPago" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="PagosContratoDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        EnableDelete="True" EnableInsert="True" EnableUpdate="True"          
        TableName="PagosContrato">
    </asp:LinqDataSource>
</asp:Content>

