<%-- 
    Document   : profile
    Created on : 2 Feb, 2023, 4:10:56 AM
    Author     : Chandan
--%>

<%@page import="myPackage.classes.User"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | OES </title>
        <link rel="stylesheet" type="text/css" href="./css/topnav.css">
        <link rel="stylesheet" type="text/css" href="./css/table.css"> 
        <link rel="stylesheet" type="text/css" href="./css/style.css"> 
    </head>
    <body style="background-image: url(./image/profile.png);">
        
    <%
        User user=pDAO.getUserDetails(session.getAttribute("userId").toString());
        if(user.getType().endsWith("admin")){
    %>
        
        <div class="wrapper">
            <nav>
                <input type="checkbox" id="show-menu">
                <label for="show-menu" class="menu-icon">&#9776;</label>
                <div class="logo">
                    <a href="#">Online Examination System</a>
                </div>
                <div class="content">
                    <ul class="links">
                        <li><a class="active" href="./adm-page.jsp?pgprt=0">Profile</a></li>
                        <li><a href="./adm-page.jsp?pgprt=2">Courses</a></li>
                        <li><a href="./adm-page.jsp?pgprt=3">Questions</a></li>
                        <li><a href="./adm-page.jsp?pgprt=1">Accounts</a></li>
                        <li><a href="controller.jsp?page=logout">Logout</a></li>
                    </ul>
                </div>
            </nav>
        </div><br>
        
        <div class="form">              
        
    <%
        }
        else{
    %>
           <div class="wrapper">
                <nav>
                    <input type="checkbox" id="show-menu">
                    <label for="show-menu" class="menu-icon">&#9776;</label>
                    <div class="logo">
                        <a href="#">Welcome, <%=user.getFirstName()%></a>
                    </div>
                    <div class="content">
                        <ul class="links">
                            <li><a class="active" href="./std-page.jsp?pgprt=0">Profile</a></li>
                            <li><a href="./std-page.jsp?pgprt=1">Exams</a></li>
                            <li><a href="./std-page.jsp?pgprt=2">Results</a></li>
                            <li><a href="controller.jsp?page=logout">Logout</a></li>
                        </ul>
                    </div>
                </nav>
            </div><br>

            <div class="form">
    <%
        }
        if(request.getParameter("pedt")==null){
    %>

                <h2>Profile</h2>
                <p></p>
                <form>
                    <input type="hidden" name="page" value="login"> 
                    <div class="error-text"></div>
                    <div class="input">
                        <label>Name</label>
                        <input type="text" disabled name="name" placeholder="Name" value="<%=user.getFirstName()+" " %><%=user.getLastName() %>" required>
                    </div>
                    <div class="input">
                        <label>Email</label>
                        <input type="text" disabled name="email" placeholder="Email Id" value="<%=user.getEmail() %>" required>
                    </div>
                    <div class="input">
                        <label>Contact</label>
                        <input type="text" disabled name="contact" placeholder="Contact No" value="<%=user.getContact() %>" required>
                    </div>
                    <div class="input">
                        <label>Address</label>
                        <input type="text" disabled name="address" placeholder="Address" value="<%=user.getAddress() %>" required>
                    </div>
                    
                </form>
        <%
            if(user.getType().equals("admin")){
        %>
                <br>
                <a href="adm-page.jsp?pgprt=0&pedt=1"><span class="add-btn">Edit Profile</span></a>
        <% 
            }
            else{
        %>
                <br>
                <a href="std-page.jsp?pgprt=0&pedt=1"><span class="add-btn">Edit Profile</span></a>
        <% 
            }
        %>

    <%
        }
        else{
    %>
                <h2>Edit Profile</h2>
                <p></p>
                <form action="controller.jsp">
                    <input type="hidden" name="page" value="profile"> 
                    <input type="hidden" name="utype" value="<%=user.getType()%>">
                    <input type="hidden" name="page" value="login"> 
                    <div class="error-text"></div>
                    <div class="input">
                        <label>First Name</label>
                        <input type="text"  name="fname" placeholder="First Name" value="<%=user.getFirstName() %>" required>
                    </div>
                    <div class="input">
                        <label>Last Name</label>
                        <input type="text"  name="fname" placeholder="Last Name" value="<%=user.getLastName() %>" required>
                    </div>
                    <div class="input">
                        <label>Email</label>
                        <input type="text"  name="email" placeholder="Email Id" value="<%=user.getEmail() %>" required>
                    </div>
                    <div class="input">
                        <label>Contact</label>
                        <input type="text"  name="contact" placeholder="Contact No" value="<%=user.getContact() %>" required >
                    </div>
                    <div class="input">
                        <label>Address</label>
                        <input type="text"  name="address" placeholder="Address" value="<%=user.getAddress() %>" required >
                    </div>
                    <div class="submit">
                        <input type="submit" value="Submit" name="login" class="button">
                    </div>
                </form>
            </div>

    <%
        }
    %>

        </div>
    </body>
</html>