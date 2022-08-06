<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuCard.aspx.cs" Inherits="HotelBuilding.MenuCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container-fluid">
    <div class="row no-gutter">
   
        <div class="col-md-6 d-none d-md-flex bg-image"></div>


        <!-- The content half -->
        <div class="col-md-6 bg-light">
            <div class="login d-flex align-items-center py-5">

                <!-- Demo content-->
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 col-xl-7 mx-auto">
                            <h3 class="display-4">New User</h3>
                            <p class="text-muted mb-4">Please Enter Your Details</p>
                            
                                <div class="form-group mb-3">
                                    <asp:Label ID="Label2" runat="server" Text="UserName"></asp:Label>
                                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqName" ControlToValidate="txtUserName" ValidationGroup="LoginFrame" runat="server" ErrorMessage="This field is required"></asp:RequiredFieldValidator>
                                      

                                </div>
                                <div class="form-group mb-3">
                                    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server"></asp:TextBox>
                                    
                                </div>
                                <div><asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="Button1_Click1" /></div>
                                
                                
                                
                                <div class="text-center d-flex justify-content-between mt-4"></div>
                           
                        </div>
                    </div>
                </div>

            </div>
        </div><!-- End -->

    </div>
</div>

            
            

        </div>
    </form>

        <div>
        </div>
    </form>
</body>
</html>
