<%@ Page Title="" Language="C#" MasterPageFile="../UserSite.Master" AutoEventWireup="true" CodeBehind="UserMenu.aspx.cs" Inherits="HotelBuilding.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h3 class="display-6">Menu Page</h3>
        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="">
                    <th scope="row">
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
                    <td runat="server">
                        <asp:Button runat="server" OnClick="addToCart" Text="Add To Cart" CssClass="btn btn-success" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="ItemIdTextBox" runat="server" Text='<%# Bind("ItemId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ItemPriceTextBox" runat="server" Text='<%# Bind("ItemPrice") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="ItemIdTextBox" runat="server" Text='<%# Bind("ItemId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ItemPriceTextBox" runat="server" Text='<%# Bind("ItemPrice") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <th scope="row">
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
            <SelectedItemTemplate>
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
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConnectionString %>" SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>
</asp:Content>

