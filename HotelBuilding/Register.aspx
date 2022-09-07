<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HotelBuilding.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"/>
    <link rel="stylesheet" href="LoginStyles.css" />
</head>
<body>
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
                                <h3 class="display-4">Registration</h3>
                                <p class="tagline mb-4">Please Enter Your Details</p>

                                <form class="" runat="server">
                                    <div class="">
                                        <label for="username" class="form-label">Username</label>
                                        <input type="text" class="form-control" runat="server" id="username" required="required" />
                                    </div>

                                    <div class="">
                                    <label for="contact" class="form-label">Contact</label>
                                    <input type="text" class="form-control" runat="server" id="contact"/>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid Phone number" ForeColor="Red" ControlToValidate="contact" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ></asp:RegularExpressionValidator> 
                                    </div>

                                    <div class="">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" runat="server" class="form-control" id="password" required="required"/>
                                
                                        <div style="padding:5px 0">
                                            <p class="text-muted" style="margin-bottom:0; font-size:14px;">
                                                <input type="checkbox" id="togglePassword" /> 
                                                    Show Password
                                            </p>
                                        </div>
                                    </div>
  
                                    <div class="">
                                    <label for="validationDefault04" class="form-label">Register as </label>
                                    <select class="form-select" runat="server" id="role" required="required">
                                        <option selected="selected" disabled="disabled" value="">User/Admin</option>
                                        <option>User</option>
                                        <option>Admin</option>
                                    </select>
                                    </div>
  
                                    <div class="col-12 mt-3">
                                        <asp:Button ID="registerButton" CssClass="btn btn-primary" runat="server" Text="Register" OnClick="RegisterUser" />
                                    </div>
                                </form>
                                 <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>

                                <p class="mt-2">
                                    <asp:HyperLink runat="server" ID="LoginHyperLink" ViewStateMode="Disabled">Return to Login?</asp:HyperLink>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- End -->

        </div>
    </div>

    <script>
        const togglePassword = document.querySelector("#togglePassword");
        const password = document.querySelector("#password");

        togglePassword.addEventListener("click", function () {
            // toggle the type attribute
            const type = password.getAttribute("type") === "password" ? "text" : "password";
            password.setAttribute("type", type);
        });

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
