﻿<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeFile="Details.aspx.cs" Inherits="Details" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true" />

    <h2>Entrada de la tabla <%= table.DisplayName %></h2>

    <asp:ScriptManagerProxy runat="server" ID="ScriptManagerProxy1" />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                HeaderText="Lista de errores de validación" />
            <asp:DynamicValidator runat="server" ID="DetailsViewValidator" ControlToValidate="DetailsView1" Display="None" />

            <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="DetailsDataSource" OnItemDeleted="DetailsView1_ItemDeleted"
                CssClass="detailstable" FieldHeaderStyle-CssClass="bold" >
                <Fields>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="EditHyperLink" runat="server"
                                NavigateUrl='<%# table.GetActionPath(PageAction.Edit, GetDataItem()) %>'
                                Text="Modificar" />
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="Delete" CausesValidation="false"
                                OnClientClick='return confirm("¿Está seguro de que desea eliminar este elemento?");'
                                Text="Eliminar" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>

            <asp:LinqDataSource ID="DetailsDataSource" runat="server" EnableDelete="true">
                <WhereParameters>
                    <asp:DynamicQueryStringParameter />
                </WhereParameters>
            </asp:LinqDataSource>

            <br />

            <div class="bottomhyperlink">
                <asp:HyperLink ID="ListHyperLink" runat="server">Mostrar todos los elementos</asp:HyperLink>
            </div>        
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>