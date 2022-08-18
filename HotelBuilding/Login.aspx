<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HotelBuilding.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="LoginStyles.css" />

    <style>
        form{
            min-height:100vh;
        }
    </style>

</head>
<body>
       <div id="root" class="container">
            <div class="row min-vh-100 min-vw-100">
                <div class="col-6 bg-image"></div>

                <!-- The content half -->
                
                
                <form class="col-6 d-flex bg-light flex-column justify-content-center" style="padding:0 11rem" runat="server">
                    <div class="">
                        
                        <label>
                            <h3 class="display-4">Welcome to <span style="color:#2D5A27">TEAM-8</span> Hotel.</h3>
                            <p class="tagline mb-4">Where The Quality Matters</p>
                        </label>

                        <div class="">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" runat="server" id="username" required="required" />
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
                            <label for="validationDefault04" class="form-label">Role</label>
                            <select class="form-select" runat="server" id="role" required="required">
                                <option selected="selected" disabled="disabled" value="">User/Admin</option>
                                <option>User</option>
                                <option>Admin</option>
                            </select>                       
                        </div>

                        <div class="col mt-2">
                            <asp:Button ID="loginButton" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="loginUser" />
                        </div>

                        <p class="mt-3">
                            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user?</asp:HyperLink>
                        </p> 

                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>

                    </div>
                </form>

                <!-- End -->

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
