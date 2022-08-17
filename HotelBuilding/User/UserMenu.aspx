<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite.Master" AutoEventWireup="true" CodeBehind="UserMenu.aspx.cs" Inherits="HotelBuilding.User.UserMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3 style="color:brown" >Menu Page</h3>
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
            <div class="col-md-4 mx-2 mb-3 card" style="max-width: 30rem;">
                <img src='<%# Eval("ItemImage") %>' class="card-img-top" style="height: 25rem; " alt="...">
                <div class="card-body">
                    <h5 class="card-title">Item Name: <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' /></h5>
                    <p class="card-text">
                        Item Price: <asp:Label ID="ItemPriceLabel" runat="server" Text='<%# Eval("ItemPrice") %>' /> <br />
                        <input id="Quantity" class="form-control" runat="server" type="number" min="0" value="0" style="max-width:60px"/>
                        <asp:Label ID="ItemIdLabel" runat="server" Text='<%# Eval("ItemId") %>' Visible="false"/>
                    </p>
                    <asp:Button ID="cartButton" runat="server" OnClick="addToCart" Text="Add To Cart" CssClass="btn btn-primary"/>
                </div>
            </div>

        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" class="row justify-content-center" runat="server" border="0" style="">
                <div id="itemPlaceholder" runat="server"></div>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelDbConnectionString %>" SelectCommand="SELECT * FROM [Menu] order by Cast(ItemId as int)"></asp:SqlDataSource>

       

</asp:Content>
