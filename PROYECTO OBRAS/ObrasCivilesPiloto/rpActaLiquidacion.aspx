<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rpActaLiquidacion.aspx.cs" Inherits="Default2" MasterPageFile="~/Site.master"%>



<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h2>ACTA LIQUIDACIÓN </h2>
        <br />
        <table>
            <tr>
                <th><asp:Label ID="Label1" runat="server" Text="Código Contrato" Font-Bold="True"></asp:Label></th>
                <th><asp:TextBox ID="tbCodContratoConsulta" runat="server"></asp:TextBox></th>
                <th><asp:Label ID="Label2" runat="server" Text="Fecha" Font-Bold="True"></asp:Label></th>
                <th><asp:TextBox ID="tbFecha" runat="server"></asp:TextBox></th>
            </tr>
            <tr>
                <th><asp:Label ID="Label3" runat="server" Text="Tipo Doc Supervisor Tecnico" Font-Bold="True"></asp:Label></th>
                <th><asp:TextBox ID="tbTipoDocSup" runat="server"></asp:TextBox></th>
                <th><asp:Label ID="Label4" runat="server" Text="Núm Doc Supervisor Tecnico" Font-Bold="True"></asp:Label></th>
                <th><asp:TextBox ID="tbNumDocSup" runat="server"></asp:TextBox></th>
            </tr>
            <tr>
                <th><asp:Label ID="Label5" runat="server" Text="Nombre Supervisor Tecnico" Font-Bold="True"></asp:Label></th>
                <th colspan="3"><asp:TextBox ID="tbNombreSup" runat="server" Width="425px"></asp:TextBox></th>                
            </tr>
            <tr>
                <th><asp:Label ID="Label7" runat="server" Text="Matricula Interventor" Font-Bold="True"></asp:Label></th>
                <th><asp:TextBox ID="tbMatriculaInt" runat="server"></asp:TextBox></th>                
            </tr>
            <tr>
                <th><asp:Label ID="Label8" runat="server" Text="Matricula Representante" Font-Bold="True"></asp:Label></th>
                <th><asp:TextBox ID="tbMatriculaRep" runat="server"></asp:TextBox></th>                
            </tr>
            <tr>
                <th><asp:Label ID="Label6" runat="server" Text="Características de la obra" Font-Bold="True"></asp:Label></th>
                <th colspan="3"><asp:TextBox ID="tbCaractObras" runat="server" Width="425px"></asp:TextBox></th>                
            </tr>   
        </table>
        
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/DynamicData/CustomPages/ReciboDocumentos.aspx">Ver Recibo de documentos</asp:HyperLink>
    
    <br />
    <br />
    <br />
    <asp:Button ID="btConsultar" runat="server" Text="Generar Informe" OnClick="btConsultar_Click" />

        <br />
        <br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="443px" Width="760px" SizeToReportContent="True" OnLoad="ReportViewer1_Load">
            <LocalReport ReportPath="Reportes\ActaLiquidacion.rdlc">
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

