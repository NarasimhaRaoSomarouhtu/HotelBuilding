<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite.Master" AutoEventWireup="true" CodeBehind="Bills.aspx.cs" Inherits="HotelBuilding.User.Bills" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Billing History</h3>
    <br />
    <asp:ListView ID="ListView1" runat="server">

        <EmptyDataTemplate>
            <h5>Make yout first Order from Cart.</h5>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                </td>
                <td>
                    <asp:Label ID="Total_PriceLabel" runat="server" Text='<%# Eval("[Total Price]") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table class="table" id="itemPlaceholderContainer" runat="server" border="0" style="">
                <tr runat="server" style="">
                    <th runat="server">Date</th>
                    <th runat="server">Total Price</th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                </td>
                <td>
                    <asp:Label ID="Total_PriceLabel" runat="server" Text='<%# Eval("[Total Price]") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
