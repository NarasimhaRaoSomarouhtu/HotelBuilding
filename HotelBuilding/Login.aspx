<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HotelBuilding.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"/>
    <link rel="stylesheet" href="LoginStyles.css" />
</head>
<body>
        <div class="container-fluid">
            <div class="row">
                <div class="col bg-image"></div>

                <!-- The content half -->
                <div class="col bg-light">
                    <div class="login d-flex align-items-center py-5">

                        <!-- Demo content-->
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-10 col-xl-7 mx-auto">
                                    <h3 class="display-4">Welcome To TEAM-8 Hotel</h3>
                                    <p class="tagline mb-4">Where The Quality Matters</p>

                                    <form class="" runat="server">
                                        <div class="">
                                        <label for="username" class="form-label">Username</label>
                                        <input type="text" class="form-control" runat="server" id="username" required="required" />
                                        </div>

                                        <div class="">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" runat="server" class="form-control" id="password" required="required"/>
                                        </div>

  
                                        <div class="">
                                        <label for="validationDefault04" class="form-label">Role</label>
                                        <select class="form-select" runat="server" id="role" required="required">
                                            <option selected="selected" disabled="disabled" value="">User/Admin</option>
                                            <option>User</option>
                                            <option>Admin</option>
                                        </select>                       
                                        </div>


  
                                        <div class="col-12 mt-2">
                                            <asp:Button ID="loginButton" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="loginUser" />
                                        </div>
                                    </form>
                                   <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>

                                    <p class="mt-3">
                                       <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user?</asp:HyperLink>
                                    </p> 

                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- End -->
            </div>
        </div>

     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
