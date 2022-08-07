<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="HotelBuilding.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
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
                        <input id="Quantity" type="number" min="0" value="0" style="max-width:60px"/>
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
                            <th scope="col">OrderId</th>
                            <th scope="col">ItemName</th>
                            <th scope="col">ItemPrice</th>
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
    </p>
</asp:Content>

