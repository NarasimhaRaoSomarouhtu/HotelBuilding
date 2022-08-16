<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminMenu.aspx.cs" Inherits="HotelBuilding.Admin.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="display-6">Menu Page</h3>
    <br />

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ItemId" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
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
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" OnClick="DeleteItem" CssClass="btn btn-danger"/>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-info"/>
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="ItemIdLabel1" class="form-label"  runat="server" Text='<%# Eval("ItemId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ItemNameTextBox" class="form-control" runat="server" Text='<%# Bind("ItemName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ItemPriceTextBox" class="form-control" runat="server" Text='<%# Bind("ItemPrice") %>' />
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
                    <asp:TextBox CausesValidation="false" ID="ItemIdTextBox" class="form-control" runat="server" Text='<%# Bind("ItemId") %>' />
                    <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                      ControlToValidate="ItemIdTextBox"
                      ErrorMessage="Item Id is required."
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox CausesValidation="false" ID="ItemNameTextBox" class="form-control" runat="server" Text='<%# Bind("ItemName") %>' />
                    <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                      ControlToValidate="ItemNameTextBox"
                      ErrorMessage="Item Name is required."
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox CausesValidation="false" ID="ItemPriceTextBox" class="form-control" runat="server" Text='<%# Bind("ItemPrice") %>' />
                    <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                      ControlToValidate="ItemPriceTextBox"
                      ErrorMessage="Item Price is required."
                      ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Button ID="InsertButton" runat="server" OnClick="checkValidation" Text="Insert" CssClass="btn btn-primary"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-secondary" />
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
                        <th scope="col"></th>
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:HotelDbConnectionString %>" DeleteCommand="DELETE FROM [Menu] WHERE [ItemId] = @original_ItemId AND [ItemName] = @original_ItemName AND [ItemPrice] = @original_ItemPrice" InsertCommand="INSERT INTO [Menu] ([ItemId], [ItemName], [ItemPrice]) VALUES (@ItemId, @ItemName, @ItemPrice)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Menu] order by Cast(ItemId as int) " UpdateCommand="UPDATE [Menu] SET [ItemName] = @ItemName, [ItemPrice] = @ItemPrice WHERE [ItemId] = @original_ItemId AND [ItemName] = @original_ItemName AND [ItemPrice] = @original_ItemPrice">
        <DeleteParameters>
            <asp:Parameter Name="original_ItemId" Type="String" />
            <asp:Parameter Name="original_ItemName" Type="String" />
            <asp:Parameter Name="original_ItemPrice" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ItemId" Type="String" />
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="ItemPrice" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="ItemPrice" Type="String" />
            <asp:Parameter Name="original_ItemId" Type="String" />
            <asp:Parameter Name="original_ItemName" Type="String" />
            <asp:Parameter Name="original_ItemPrice" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
&nbsp;
</asp:Content>
