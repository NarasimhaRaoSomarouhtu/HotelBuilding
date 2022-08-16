<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="HotelBuilding.Admin.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="display-6">Orders Page</h3>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <EmptyDataTemplate>
            <h2>No Orders.</h2>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>' />
                </td>
                <td>
                    <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                </td>
                <td>
                    <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                </td>
                <td>
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                </td>
                <td>
                    <asp:Label ID="ItemPriceLabel" runat="server" Text='<%# Eval("ItemPrice") %>' />
                </td>
                <td>
                    <asp:Label ID="Total_PriceLabel" runat="server" Text='<%# Eval("[Total Price]") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table class="table" id="itemPlaceholderContainer" runat="server" border="0" style="">
                <thead class="thead-dark">
                    <tr style="">
                        <th runat="server">Order Date</th>
                        <th runat="server">Username</th>
                        <th runat="server">Item</th>
                        <th runat="server">Quantity</th>
                        <th runat="server">Item Price</th>
                        <th runat="server">Price</th>
                    </tr>
                </thead>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelDbConnectionString %>" SelectCommand="SELECT Orders.OrderDate, Orders.Username, Menu.ItemName, Orders.Quantity, Menu.ItemPrice, CAST(Menu.ItemPrice AS int) * CAST(Orders.Quantity AS int) AS 'Total Price' FROM Menu INNER JOIN Orders ON Menu.ItemId = Orders.ItemId ORDER BY Orders.OrderDate DESC"></asp:SqlDataSource>

    

</asp:Content>
