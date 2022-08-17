<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite.Master" AutoEventWireup="true" CodeBehind="Bills.aspx.cs" Inherits="HotelBuilding.User.Bills" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        function showModal() {
            document.getElementById("modalID").classList.add("show");
        }

        function closeModal() {
            document.getElementById("modalID").classList.remove("show");
            window.location.replace("http://localhost:54753/User/Bills");
        }
    </script>

    <h3 style="color:brown">Billing History</h3>
    <br />
    <asp:ListView ID="ListView1" runat="server">
        <EmptyDataTemplate>
            <h5>Make yout first Order from Cart.</h5>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="DateLabel" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Date", "{0:dd-MM-yyyy}") %>' />
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
            <table class="table" id="itemPlaceholderContainer" runat="server" border="0" style="">
                <tr runat="server" style="">
                    <th runat="server">Date</th>
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
            <h3 class="modal-title" style="color:brown">Order Details</h3>
          </div>
          <div id="modalBody" runat="server" class="modal-body"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" onclick="closeModal()">Close</button>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
