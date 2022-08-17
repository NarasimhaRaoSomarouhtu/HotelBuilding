<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="HotelBuilding.User.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        function reloadWindow() {
            setTimeout(function () {
                if (window.location.hash != '#r') {
                    window.location.hash = 'r';
                    window.location.replace("http://localhost:54753/User/Cart");
                }
            }, 5000);
        }
    </script>

    <h3 style="color:brown" >Cart Page</h3>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ItemId" DataSourceID="SqlDataSource1">
        <EmptyDataTemplate>
            <h5>Cart is Empty.</h5>
            <p>Add Items from Menu.</p>
            <p>Please Check bills tab if you have placed any orders.</p>

        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="ItemIdLabel" runat="server" Text='<%# Eval("ItemId") %>' />
                </td>
                <td>
                    <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                </td>
                <td>
                    <asp:Label ID="ItemPriceLabel" runat="server" Text='<%# Eval("ItemPrice") %>' />
                </td>
                <td>
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                </td>
                <td runat="server">
                    <asp:Button runat="server" OnClick="removeFromCart" Text="Remove" CssClass="btn btn-danger" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
             <table id="itemPlaceholderContainer" class="table" runat="server" border="0" style="">
                    <thead class="thead-dark">
                        <tr style="">
                            <th scope="col">S.No</th>
                            <th scope="col">Item</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                </table>
        </LayoutTemplate>
    </asp:ListView>

    <div id="totalPriceLabel" runat="server"></div>
    <br />

    <asp:Button ID="OrderButton" runat="server" OnClick="ConfirmOrder" Text="Proceed To Checkout" CssClass="btn btn-primary" />

    <br />
    <br />

    <div class="alert alert-info" id="popup" runat="server" role="alert">
        Order Successful..!!
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelDbConnectionString %>" SelectCommand="SELECT Menu.ItemId, Menu.ItemName, Menu.ItemPrice, Cart.Quantity FROM Menu INNER JOIN Cart ON Cart.ItemId = Menu.ItemId"></asp:SqlDataSource>


</asp:Content>
