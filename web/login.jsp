<%-- 
    Document   : login
    Created on : Feb 28, 2023, 1:06:03 PM
    Author     : choip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>Cosmetic Store</title>
        <link rel="stylesheet" href="./css/main.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    </head>
    <body>

        <header>
           <h1>Cosmetic Store</h1>
        </header>
        <section class="login">
            <div class="card">
                <div class="card-header text-dark">
                    Please Sign in
                </div>
                <p style="color:green">${requestScope.REGISTERMESSAGE}</p>
                <div class="card-body">
                    <p id="ErrorTextMsg" class="errortxt">${requestScope.MESSAGE}</p>
                    <form action="LoginServlet" method="post">
                        <div class="form-group">
                            <div class="mb-3">
                                <input type="text" name="userID" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                       placeholder="Username">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="mb-3">
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1"
                                       placeholder="Password">
                            </div>
                        </div>
                        <button style="width: 100%; background-color:#5CB85C" type="submit"
                                class="btn btn-success">Login</button>
                    </form>
                </div>
                <div class="card-header text-dark">
                    If you don't have an account, please <a href="register.jsp">create an account </a>here
                </div>
            </div>
        </section>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
            integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
            integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous">
    </script>
</html>
