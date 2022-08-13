<%@ Page Language="C#" MasterPageFile="../UserSite.Master" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="HotelBuilding.User.Bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="display-6">Bill Page</h3>
        <br />

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="OrderId" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
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
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="OrderIdLabel1" runat="server" Text='<%# Eval("OrderId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ItemPriceTextBox" runat="server" Text='<%# Bind("ItemPrice") %>' />
                </td>
                <td>
                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>Bill Is Empty</td>
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
                    <asp:TextBox ID="OrderIdTextBox" runat="server" Text='<%# Bind("OrderId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ItemPriceTextBox" runat="server" Text='<%# Bind("ItemPrice") %>' />
                </td>
                <td>
                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
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
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th runat="server">OrderId</th>
                                <th runat="server">ItemName</th>
                                <th runat="server">ItemPrice</th>
                                <th runat="server">Quantity</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
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
            </tr>
        </SelectedItemTemplate>

    </asp:ListView>
    <div id="totalPriceLabel" runat="server"></div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="Data Source=.;Initial Catalog=Hotel;Integrated Security=True" DeleteCommand="DELETE FROM [Cart] WHERE [OrderId] = @original_OrderId AND [ItemName] = @original_ItemName AND [ItemPrice] = @original_ItemPrice AND [Quantity] = @original_Quantity" InsertCommand="INSERT INTO [Cart] ([OrderId], [ItemName], [ItemPrice], [Quantity]) VALUES (@OrderId, @ItemName, @ItemPrice, @Quantity)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT OrderId,ItemName,ItemPrice,Quantity,Quantity*ItemPrice as Price FROM [Cart]" UpdateCommand="UPDATE [Cart] SET [ItemName] = @ItemName, [ItemPrice] = @ItemPrice, [Quantity] = @Quantity WHERE [OrderId] = @original_OrderId AND [ItemName] = @original_ItemName AND [ItemPrice] = @original_ItemPrice AND [Quantity] = @original_Quantity">
        <DeleteParameters>
            <asp:Parameter Name="original_OrderId" Type="Int32" />
            <asp:Parameter Name="original_ItemName" Type="String" />
            <asp:Parameter Name="original_ItemPrice" Type="Int32" />
            <asp:Parameter Name="original_Quantity" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OrderId" Type="Int32" />
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="ItemPrice" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="ItemPrice" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="original_OrderId" Type="Int32" />
            <asp:Parameter Name="original_ItemName" Type="String" />
            <asp:Parameter Name="original_ItemPrice" Type="Int32" />
            <asp:Parameter Name="original_Quantity" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
