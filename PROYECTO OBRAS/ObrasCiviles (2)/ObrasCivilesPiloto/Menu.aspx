<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    
        <table style="width: 474px; height: 288px">
            <tr><th colspan="2"><h1>MENU</h1></th></tr>
            <tr>
                <th style="height: 35px; width: 264px;"><asp:LinkButton ID="LinkButton10" runat="server" Font-Size="Medium" OnClick="LinkButton10_Click" PostBackUrl="~/DynamicData/CustomPages/Actividad.aspx">Actividad</asp:LinkButton></th>
                <th style="width: 264px; height: 35px;"><asp:LinkButton ID="LinkButton2" runat="server" Font-Size="Medium" OnClick="LinkButton2_Click" PostBackUrl="~/MenuReportes.aspx">Reportes</asp:LinkButton></th>
            </tr>
            <tr><th style="width: 264px"></th><th style="width: 264px"></th></tr>
            <tr>
                <th style="height: 35px; width: 264px;"><asp:LinkButton ID="LinkButton3" runat="server" Font-Size="Medium" PostBackUrl="~/DynamicData/CustomPages/gestionusuarios.aspx">Usuarios</asp:LinkButton></th>
                <th colspan="2" style="height: 35px"><asp:LinkButton ID="LinkButton9" runat="server" Font-Size="Medium" OnClick="LinkButton9_Click" PostBackUrl="~/Custom/frm_contratos.aspx">Presupuesto</asp:LinkButton></th>
            </tr>
            <tr><th style="width: 264px"></th><th style="width: 264px"></th></tr>
            <tr>
                <th style="height: 35px; width: 264px;"><asp:LinkButton ID="LinkButton5" runat="server" Font-Size="Medium" PostBackUrl="~/DynamicData/CustomPages/Predio.aspx">Predio</asp:LinkButton></th>
                <th style="height: 35px; width: 264px;"><asp:LinkButton ID="LinkButton6" runat="server" Font-Size="Medium" PostBackUrl="~/DynamicData/CustomPages/Tercero.aspx">Tercero</asp:LinkButton></th>
            </tr>
            <tr><th style="width: 264px"></th><th style="width: 264px"></th></tr>
            <tr>
                <th style="height: 35px; width: 264px;"><asp:LinkButton ID="LinkButton7" runat="server" Font-Size="Medium" OnClick="LinkButton7_Click" PostBackUrl="~/DynamicData/CustomPages/TipoActividad.aspx">Tipo Actividad</asp:LinkButton></th>
                <th style="height: 35px; width: 264px;"><asp:LinkButton ID="LinkButton8" runat="server" Font-Size="Medium" OnClick="LinkButton8_Click" PostBackUrl="~/DynamicData/CustomPages/UnidadMedida.aspx">Unidad Medida</asp:LinkButton></th>
            </tr>
            <tr>
                <th style="height: 35px; width: 264px;"><asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Medium" OnClick="LinkButton7_Click" PostBackUrl="~/DynamicData/CustomPages/Proyectos.aspx">Proyectos</asp:LinkButton></th>
                
            </tr>
            <tr><th style="width: 264px"></th><th style="width: 264px"></th></tr>

        </table>
   
    </asp:Content>
