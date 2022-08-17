<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="HotelBuilding.Admin.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        function showModal() {
            document.getElementById("modalID").classList.add("show");
        }

        function closeModal() {
            document.getElementById("modalID").classList.remove("show");
            window.location.replace("http://localhost:54753/Admin/Orders");

        }
    </script>

    <h3 style="color:brown">Orders Page</h3>
    <br />

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <EmptyDataTemplate>
            <h5>No Orders.</h5>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="OrderDateLabel" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OrderDate", "{0:dd-MM-yyyy}") %>' />
                </td>
                <td>
                    <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                </td>
                <td>
                    <asp:Label ID="Total_PriceLabel" runat="server" Text='<%# Eval("[Total Price]") %>' />
                </td>
                <td runat="server">
                    <asp:Button runat="server" class="btn btn-info" onclick="btn_Click" Text="View Details" ></asp:Button>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" class="table" runat="server" border="0" style="">
                <tr runat="server" style="">
                    <th runat="server">Date</th>
                    <th runat="server">Username</th>
                    <th runat="server">Total Price</th>
                    <th></th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>

    </asp:ListView>

    <div style="overflow:auto" class="modal" id="modalID" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h3 style="color:brown" class="modal-title">Order Details</h3>
          </div>
          <div id="modalBody" runat="server" class="modal-body"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" onclick="closeModal()">Close</button>
          </div>
        </div>
      </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelDbConnectionString %>" SelectCommand="SELECT Orders.OrderDate, Orders.Username, SUM(CAST(Menu.ItemPrice AS int) * CAST(Orders.Quantity AS int)) AS 'Total Price' FROM Menu INNER JOIN Orders ON Menu.ItemId = Orders.ItemId GROUP BY Orders.Username , Orders.OrderDate"></asp:SqlDataSource>

</asp:Content>
