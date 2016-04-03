<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rpMayoresyMenores.aspx.cs" Inherits="Default2" MasterPageFile="~/Site.master"%>



<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div>
    
    </div>
        <h2>MAYORES Y MENORES</h2>
        <br />

        <asp:Label ID="Label1" runat="server" Text="Código Contrato" Font-Bold="True"></asp:Label>
        <asp:TextBox ID="tbCodContratoConsulta" runat="server"></asp:TextBox>

        <br />
    <br />
    <br />
    <br />
    <asp:Button ID="btConsultar" runat="server" Text="Generar Informe" OnClick="btConsultar_Click" />

        <br />
        <br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="443px" Width="760px" SizeToReportContent="True" OnLoad="ReportViewer1_Load">
            <LocalReport ReportPath="Reportes\MayoresyMenores.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlActividades" Name="ActividadesContrato" />
                    <rsweb:ReportDataSource DataSourceId="SqlContrato" Name="Contrato" />
                    <rsweb:ReportDataSource DataSourceId="SqlCostosIndirectos" Name="CostosIndirectosContrato" />
                    <rsweb:ReportDataSource DataSourceId="SqlPagos" Name="PagosContrato" />
                </DataSources>
            </LocalReport>            
        </rsweb:ReportViewer>
        
        <asp:SqlDataSource ID="SqlPagos" runat="server" ConnectionString="<%$ ConnectionStrings:proyecto_obrasConnectionString %>"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCostosIndirectos" runat="server" ConnectionString="<%$ ConnectionStrings:proyecto_obrasConnectionString %>"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlActividades" runat="server" ConnectionString="<%$ ConnectionStrings:proyecto_obrasConnectionString %>"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlContrato" runat="server" ConnectionString="<%$ ConnectionStrings:proyecto_obrasConnectionString %>"></asp:SqlDataSource>
        
 </asp:Content>

