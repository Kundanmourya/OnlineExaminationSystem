<%-- 
    Document   : login
    Created on : 01 Feb, 2023, 4:31:02 AM
    Author     : Chandan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | OES </title>
        <link rel="stylesheet" type="text/css" href="./css/topnav.css">
        <link rel="stylesheet" type="text/css" href="./css/style.css">
    </head>
    <body style="background-image: url(./image/image.png); ">
        <div class="wrapper">
            <nav>
                <input type="checkbox" id="show-menu">
                <label for="show-menu" class="menu-icon">&#9776;</label>
                <div class="logo">
                    <a href="#">Online Examination System</a>
                </div>
                <div class="content">
                    <ul class="links">
                        <li><a class="active" href="./index.html">Home</a></li>
                        <li><a href="">About</a></li>
                        <li><a href="#">Login</a></li>
                    </ul>
                </div>
            </nav>
        </div><br>
        <div class="form">
            <h2>Login Form</h2>
            <p></p>
            <form method="post" action="controller.jsp">
                <input type="hidden" name="page" value="login"> 
                <div class="error-text"></div>
                <div class="input">
                    <label>Username</label>
                    <input type="text" name="username" placeholder="Enter Username" required>
                </div>
                <div class="input">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Password" required>
                </div>
            <% 
                if(request.getSession().getAttribute("userStatus")!=null){
                    if(request.getSession().getAttribute("userStatus").equals("-1")){ 
            %>
                    <p style="color: red;font-size: 17px">username or password is incorrect</p>
                    
            <%
                    }
                }
            %>
                <div class="submit">
                    <input type="submit" value="Login" name="login" class="button">
                </div>
            </form>
        </div>
        </div>
    </body>
</html>
