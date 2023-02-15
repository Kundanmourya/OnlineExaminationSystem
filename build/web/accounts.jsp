<%-- 
    Document   : accounts
    Created on : 3 Feb, 2023, 7:00:31 PM
    Author     : Chandan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body>
        <div class="wrapper">
            <nav>
                <input type="checkbox" id="show-menu">
                <label for="show-menu" class="menu-icon">&#9776;</label>
                <div class="logo">
                    <a href="#">Online Examination System</a>
                </div>
                <div class="content">
                    <ul class="links">
                        <li><a href="./adm-page.jsp?pgprt=0">Profile</a></li>
                        <li><a href="./adm-page.jsp?pgprt=2">Courses</a></li>
                        <li><a href="./adm-page.jsp?pgprt=3">Questions</a></li>
                        <li><a class="active" href="./adm-page.jsp?pgprt=1">Accounts</a></li>
                        <li><a href="controller.jsp?page=logout">Logout</a></li>
                    </ul>
                </div>
            </nav>
        </div><br>

        <div class="topnav">
            <table class="tab-middle-oi">
                <thead>
                    <tr style="background: lightblue; text-align: center; font-weight: 600">
                        <td colspan="5">
                            <a href="./register.html">Add New Student</a>
                        </td>
                    </tr>
                    <tr class="tab-header-oi">
                        <td colspan="5">
                            <span>List of All Register Student</span>
                        </td>
                    </tr>
                </thead>

                <thead>
                    <tr>
                        <th scope="col">Name</th>   
                        <th scope="col">email</th>
                        <th scope="col">City</th>
                        <th scope="col">Address</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                
                <tbody>

            <%
                ArrayList list=pDAO.getAllUsers();
                User user;
                for(int i=0;i<list.size();i++){
                    user=(User)list.get(i);
                    if(user.getUserId()!= Integer.parseInt(session.getAttribute("userId").toString())) {
            %>
                    <tr>
                        <td><%=user.getFirstName()+" "+user.getLastName() %></td>
                            <td><%=user.getEmail() %></td>
                            <td><%=user.getCity() %></td>
                            <td><%=user.getAddress() %></td>
                            <td><a href="controller.jsp?page=accounts&operation=del&uid=<%=user.getUserId() %>" onclick="return confirm('Are you sure you want to delete this ?');">
                                <div>Delete</div>
                                </a>
                            </td>
                    </tr>
            <%
                    }
                } 
            %>
                </tbody>
            </table>
        </div>
    </body>
</html>