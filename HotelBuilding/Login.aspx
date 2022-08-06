<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HotelBuilding.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"/>
    <link rel="stylesheet" href="LoginStyles.css" />
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
                            <h3 class="display-4">Welcome To Bhanu Hotel</h3>
                            <p class="tagline mb-4">Where The Quality Matters</p>
                            
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="UserName"></asp:Label>
                                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqName" ControlToValidate="txtUserName" ValidationGroup="LoginFrame" runat="server" ErrorMessage="This field is required"></asp:RequiredFieldValidator>
                                      

                                </div>
                                <div class="form-group mb-3">
                                    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server"></asp:TextBox>
                                    
                                </div>
                                <div><asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="Button1_Click1" /></div>
                                
                                <p class="mt-3">
                                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                                </p>
                                
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
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
