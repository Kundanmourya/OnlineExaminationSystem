<%-- 
    Document   : std-page
    Created on : 3 Feb, 2023, 5:56:14 PM
    Author     : Chandan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> </title> 
    </head>
    <body>
    <%
        if(session.getAttribute("userStatus")!=null){
            if(session.getAttribute("userStatus").equals("1")){
    %>
            	

            <% 
                if(request.getParameter("pgprt").equals("1")){
                
            %>
            
                    <jsp:include page="exam.jsp"></jsp:include>
            
            <%
                
                }
                else if(request.getParameter("pgprt").equals("2")){
            %>
            
                    <jsp:include page="results.jsp"></jsp:include>
                
            <%
                
                }
                else{
            %>
            
                    <jsp:include page="profile.jsp"></jsp:include>
            
    <%
                }
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
            

