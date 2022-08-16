<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite.Master" AutoEventWireup="true" CodeBehind="UserMenu.aspx.cs" Inherits="HotelBuilding.User.UserMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Menu Page</h3>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ItemId" DataSourceID="SqlDataSource1">
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="">
                <th>
                    <asp:Label ID="ItemIdLabel" runat="server" Text='<%# Eval("ItemId") %>' />
                </th>
                <td>
                    <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                </td>
                <td>
                    <asp:Label ID="ItemPriceLabel" runat="server" Text='<%# Eval("ItemPrice") %>' />
                </td>
                <td runat="server">
                    <input id="Quantity" runat="server" type="number" min="0" value="0" style="max-width:60px"/>
                </td>
                <td runat="server" onclick="addToCart">
                    <asp:Button runat="server" OnClick="addToCart" Text="Add To Cart" CssClass="btn btn-success" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" class="table" border="0" style="">
                <thead class="thead-dark">
                    <tr style="">
                        <th scope="col">S.No</th>
                        <th scope="col">Item</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                    </tr>
                </thead>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelDbConnectionString %>" SelectCommand="SELECT * FROM [Menu] order by Cast(ItemId as int)"></asp:SqlDataSource>

       

</asp:Content>
