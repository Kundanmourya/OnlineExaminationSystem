<%-- 
    Document   : adm-page
    Created on : 1 Feb, 2023, 6:03:03 PM
    Author     : Chandan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<!DOCTYPE html>
<html>
    <head>
        <title></title>
    </head>
    <body>
        <%
            if(session.getAttribute("userStatus")!=null){
                if(session.getAttribute("userStatus").equals("1")){
            
        %>
                
                <% 
                    if(request.getParameter("pgprt").equals("1")){
                
                %>
            
                        <jsp:include page="accounts.jsp"></jsp:include>
            
                <%
                
                    }
                    else if(request.getParameter("pgprt").equals("2")){
            
                %>
            
                        <jsp:include page="courses.jsp"/>
                
                <%
                
                    }
                    else if(request.getParameter("pgprt").equals("3")){
                %>
            
                        <jsp:include page="questions.jsp"/>
                <%
                    }
                    else if(request.getParameter("pgprt").equals("4")){
                %>
            
                        <jsp:include page="showall.jsp"/>
                <%
                    }
                    else{
                %>
            
                    <jsp:include page="profile.jsp"/>
            
                <%
                    }
                %>
            
            <%
                }
                else{
                    response.sendRedirect("login.jsp");
                }
            }
            else{
                response.sendRedirect("login.jsp");
            }
        %>
    
    </body>
</html>