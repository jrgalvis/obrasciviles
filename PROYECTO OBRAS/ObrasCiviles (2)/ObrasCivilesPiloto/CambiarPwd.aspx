﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CambiarPwd.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1></h1>
    <div style="align-self:center" id="principal">
        <table  border="1" style="align-self:center">
            <tr>
                <td><asp:Label ID="lblLogin" runat="server" Text="Contraseña:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblPwd" runat="server" Text="Nueva Contraseña:"></asp:Label></td>
                <td><asp:TextBox ID="txtConfPwd" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblPwd2" runat="server" Text="Repetir Nueva Contraseña:"></asp:Label></td>
                <td><asp:TextBox ID="txtPwd2" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="align-self:flex-end">
                    <asp:Button ID="btnOK" runat="server" Text="Aceptar" OnClick="btnOK_Click" />
                </td>
                <td style="align-self:flex-start">
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />

                </td>
               
            </tr>
         </table>
    </div>
    <div id="error">
        <asp:Label ID="lblErr" runat="server" Text="La contraseña no coincide" ForeColor="#CC0000" Visible="false"></asp:Label>
    </div>
</asp:Content>

