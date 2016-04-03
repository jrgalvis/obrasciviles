<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MenuReportes.aspx.cs" Inherits="MenuReportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width: 474px; height: 288px">
            <tr><th colspan="2"><h1>REPORTES</h1></th></tr>
            <tr>              
                <th style="width: 264px; height: 35px;"><asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Medium" PostBackUrl="~/rpActaEntrega.aspx">Acta Entrega Fisica</asp:LinkButton></th>
            </tr>            
            <tr><th style="width: 264px"></th><th style="width: 264px"></th></tr>
            <tr>
                <th style="width: 264px; height: 35px;"><asp:LinkButton ID="LinkButton3" runat="server" Font-Size="Medium" PostBackUrl="~/rpMayoresyMenores.aspx">Acta Mayores y Menores</asp:LinkButton></th>
            </tr>
            <tr><th style="width: 264px"></th><th style="width: 264px"></th></tr>
            <tr>
                <th style="width: 264px; height: 35px;"><asp:LinkButton ID="LinkButton4" runat="server" Font-Size="Medium" PostBackUrl="~/rpActaLiquidacion.aspx">Acta Liquidación</asp:LinkButton></th>
            </tr>

        </table>

</asp:Content>

