<%-- 
    Document   : dashboard
    Created on : 4 Feb, 2023, 6:20:35 PM
    Author     : Chandan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
    <% 
        if(session.getAttribute("userStatus")!=null){
            String loginConfirm=session.getAttribute("userStatus").toString();
            if(loginConfirm.equals("1")){
                if(pDAO.getUserType(session.getAttribute("userId").toString()).equals("admin")){
                    response.sendRedirect("adm-page.jsp?pgprt=0"); 
                }
                else if(pDAO.getUserType(session.getAttribute("userId").toString()).equals("student")){
                    response.sendRedirect("std-page.jsp?pgprt=0");
                }
            }
            else if(!loginConfirm.equals("1")){
                response.sendRedirect("login.jsp");
            }
        }
        else response.sendRedirect("login.jsp");
    %>
    </body>
</html>
