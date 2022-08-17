<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminMenu.aspx.cs" Inherits="HotelBuilding.Admin.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3 style="color:brown" class="display-6">Menu Page</h3>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ItemId" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="ItemIdLabel1" runat="server" Text='<%# Eval("ItemId") %>' />
                </td>
                <td>
                    <asp:TextBox class="form-control" ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>' />
                </td>
                <td>
                    <asp:TextBox class="form-control" ID="ItemPriceTextBox" runat="server" Text='<%# Bind("ItemPrice") %>' />
                </td>
                <td>
                    <asp:TextBox class="form-control" ID="ItemImageTextBox" runat="server" Text='<%# Bind("ItemImage") %>' />
                </td>
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-success"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger"/>
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
                    <asp:TextBox class="form-control" ID="ItemIdTextBox" runat="server" Text='<%# Bind("ItemId") %>' />
                </td>
                <td>
                    <asp:TextBox class="form-control" ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>' />
                </td>
                <td>
                    <asp:TextBox class="form-control" ID="ItemPriceTextBox" runat="server" Text='<%# Bind("ItemPrice") %>' />
                </td>
                <td>
                    <asp:TextBox class="form-control" ID="ItemImageTextBox" runat="server" Text='<%# Bind("ItemImage") %>' />
                </td>
                <td>
                    <asp:Button ID="InsertButton" runat="server" OnClick="checkValidation" Text="Insert" CssClass="btn btn-primary"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-secondary" />
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
                    <img src='<%# Eval("ItemImage") %>' class="card-img-top" style="height: 15rem; " alt="...">
                </td>
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" OnClick="DeleteItem" CssClass="btn btn-danger"/>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-info"/>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" class="table" border="0" style="">
                <thead>
                    <tr style="">
                        <th scope="col">S.No</th>
                        <th scope="col">Item</th>
                        <th scope="col">Price</th>
                        <th scope="col">Image</th>
                        <th></th>
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
                <td>
                    <asp:Label ID="ItemImageLabel" runat="server" Text='<%# Eval("ItemImage") %>' />
                </td>
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelDbConnectionString %>" DeleteCommand="DELETE FROM [Menu] WHERE [ItemId] = @ItemId" InsertCommand="INSERT INTO [Menu] ([ItemId], [ItemName], [ItemPrice], [ItemImage]) VALUES (@ItemId, @ItemName, @ItemPrice, @ItemImage)" SelectCommand="SELECT * FROM [Menu]" UpdateCommand="UPDATE [Menu] SET [ItemName] = @ItemName, [ItemPrice] = @ItemPrice, [ItemImage] = @ItemImage WHERE [ItemId] = @ItemId">
        <DeleteParameters>
            <asp:Parameter Name="ItemId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ItemId" Type="String" />
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="ItemPrice" Type="String" />
            <asp:Parameter Name="ItemImage" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="ItemPrice" Type="String" />
            <asp:Parameter Name="ItemImage" Type="String" />
            <asp:Parameter Name="ItemId" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
&nbsp;
</asp:Content>
