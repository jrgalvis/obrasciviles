<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AjusteContrato.aspx.cs" Inherits="DynamicData_CustomPages_AjusteContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h2>ACTIVIDADES AJUSTADAS DEL PRESUPUESTO</h2>

    <br />
    <div>
        Seleccione el presupuesto a ajustar:
        <asp:DropDownList ID="DDLFiltroContrato"
                        DataSourceID="ContratoDS"
                        DataValueField="CodigoContrato"
                        DataTextField="CodigoContrato"
                        AutoPostBack="true"
                        runat="server" />

          <br />
     <br />
        <asp:button id="btnAjustar" runat="server" text="Ajustar" OnClick="btnAjustar_Click" />

         <br />
     <br />

    </div>

    <br />
    
   

    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ActividadAjustadaDS" EnableModelValidation="True" DataKeyNames="Contrato,ActividadAjustada" ShowFooter="true">
            <Columns>
                <asp:BoundField DataField="Contrato" HeaderText="Contrato" ReadOnly="True" SortExpression="Contrato" />
                <asp:BoundField DataField="ActividadAjustada" HeaderText="ActividadAjustada" ReadOnly="True" SortExpression="ActividadAjustada" />
                <asp:BoundField DataField="CantidadPresupuestada" HeaderText="CantidadPresupuestada" ReadOnly="True" SortExpression="CantidadPresupuestada" />
                <asp:BoundField DataField="ValorPresupuestado" HeaderText="ValorPresupuestado" ReadOnly="True" SortExpression="ValorPresupuestado" />
                <asp:BoundField DataField="CantidadReal" HeaderText="CantidadReal" ReadOnly="True" SortExpression="CantidadReal" />
                <asp:BoundField DataField="ValorReal" HeaderText="ValorReal" ReadOnly="True" SortExpression="ValorReal" />
                <asp:BoundField DataField="CantidadRealAjustada" HeaderText="CantidadRealAjustada" SortExpression="CantidadRealAjustada" />
                <asp:BoundField DataField="ValorRealAjustado" HeaderText="ValorRealAjustado" SortExpression="ValorRealAjustado" />
            </Columns>
        </asp:GridView>   


    <asp:LinqDataSource ID="ActividadAjustadaDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        TableName="ContratoActividadAjustado" 
        EnableUpdate="True"
        Where="Contrato=@Contrato" 
       >
        <WhereParameters>
            <asp:ControlParameter 
              Name="Contrato" 
              DefaultValue="1" 
              ControlID="DDLFiltroContrato" 
              Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>



    <asp:LinqDataSource ID="ContratoDS" 
        runat="server" 
        ContextTypeName="DataClassesModelDataContext" 
        Select="new (CodigoContrato)" 
        TableName="Contrato">
    </asp:LinqDataSource>



</asp:Content>

