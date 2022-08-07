<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="HotelBuilding.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="ItemIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ItemPriceLabel" runat="server" Text='<%# Eval("ItemPrice") %>' />
                    </td>
                    
                    <td runat="server">
                        <asp:Button runat="server" OnClick="Cancel" Text="cancel" CssClass="btn btn-danger" />
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
                        <asp:TextBox ID="ItemIdTextBox" runat="server" Text='<%# Bind("OrderId") %>' />
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
                        <asp:Button ID="Button1" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("OrderId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ItemName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ItemPrice") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("OrderId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ItemName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("ItemPrice") %>' />
                    </td>
                    
                    <td runat="server" onclick="Cancel">
                        <asp:Button runat="server" OnClick="Cancel" Text="cancel" CssClass="btn btn-danger" />
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
                        </tr>
                    </thead>
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("OrderId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("ItemName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("ItemPrice") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConnectionString %>" SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
    </p>
</asp:Content>
