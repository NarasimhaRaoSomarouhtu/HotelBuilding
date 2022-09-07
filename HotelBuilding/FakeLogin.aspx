<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FakeLogin.aspx.cs" Inherits="HotelBuilding.FakeLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="" />
    <link href="https://fonts.googleapis.com/css2?family=Prompt:wght@300;400;600&display=swap" rel="stylesheet" />

    <style>
        html, body {
            margin: 0;
            height: 100%;
        }
        
        #root{
            background:url('https://reshmatiffin.com/static/media/HomePageLanding.1be39eb1.jpg');
            background-size:cover;
            height:100%;
            background-position:center;
        }

        .animated-heading {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color:whitesmoke
        }

        #loginCard{
            margin-right:9%;
/*            font-family:'Prompt', sans-serif;
            font-weight:300;*/
        }

        #labels{
            margin-left:7%;
            max-width:15%;
        }

        span#words{
            font-size:100px;
            font-family: 'Prompt', sans-serif;
            font-weight:600;
            word-wrap: break-word;
        }

        #title{
            font-size:70px;
            font-family: 'Prompt', sans-serif;
            font-weight:600;
            color:whitesmoke;
        }

    </style>

</head>
<body>
    <div id="root" class="d-flex justify-content-between align-items-center">
        <div id="labels" class="animated-heading">
            <h1><span id="words">Tiffins</span></h1>
        </div>

        <div id="loginCard" class="d-flex flex-column align-items-center">
            <h1 id="title" class="mb-5">Bhanu's Hotel</h1>
            <div class="card" style="width: 25rem;">
                <div class="card-body">
                    <h2 class="card-title text-center" style="font-family:'Prompt', sans-serif; font-weight:400">Login</h2>
                    <form>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" />
                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" />
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" />
                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        (function () {
            var words = ["Tiffins", "Meals", "Snacks", "Soft"+ '\n' +"Drinks", "Desserts"],
            i = 0;
            setInterval(function () {
                $('#words').fadeOut(function () {
                    $(this).html(words[(i = (i + 1) % words.length)]).fadeIn();
                });
            }, 3000)
        })();
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>

</body>
</html>
