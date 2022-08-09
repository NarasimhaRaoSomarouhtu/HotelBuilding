<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="HotelBuilding.Admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="display-6">Users Page</h3>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="contactLabel" runat="server" Text='<%# Eval("contact") %>' />
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
                    <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                </td>
                <td>
                    <asp:TextBox ID="contactTextBox" runat="server" Text='<%# Bind("contact") %>' />
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
                    <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                </td>
                <td>
                    <asp:TextBox ID="contactTextBox" runat="server" Text='<%# Bind("contact") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="contactLabel" runat="server" Text='<%# Eval("contact") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" class="table" border="0" style="">
                <thead>
                    <tr runat="server" style="">
                        <th runat="server">User Name</th>
                        <th runat="server">Contact</th>
                    </tr>
                </thead>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="contactLabel" runat="server" Text='<%# Eval("contact") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConnectionString %>" SelectCommand=" select
  username, contact
  from Login
  where role = 'User';"></asp:SqlDataSource>
&nbsp;
</asp:Content>
