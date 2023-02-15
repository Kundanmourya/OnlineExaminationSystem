<%-- 
    Document   : result
    Created on : 10 Feb, 2023, 6:50:17 PM
    Author     : Chandan
--%>


<%@page import="myPackage.classes.Answers"%>
<%@page import="myPackage.classes.Exams"%>
<%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Show questions | OES </title>
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
                        <li><a href="./std-page.jsp?pgprt=0">Profile</a></li>
                        <li><a href="./std-page.jsp?pgprt=1">Exams</a></li>
                        <li><a class="active" href="./std-page.jsp?pgprt=2">Results</a></li>
                        <li><a href="controller.jsp?page=logout">Logout</a></li>
                    </ul>
                </div>
            </nav>
        </div><br>

        <div class="topnav">
        <%
            if(request.getParameter("eid")==null){
        %>
            <table class="tab-middle-oi" align="center">
                <thead>
                    <tr class="tab-header-oi">
                        <td colspan="5">
                            <span>List of All Given Exam</span>
                        </td>
                    </tr>
                </thead>

                <thead>
                    <tr>
                        <th scope="col">Date</th>   
                        <th scope="col">Course</th>   
                        <th scope="col">Time</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
           <%
                ArrayList list=pDAO.getAllResultsFromExams(Integer.parseInt(session.getAttribute("userId").toString()));
                for(int i=0;i<list.size();i++){
                    Exams e=(Exams)list.get(i);
            %>

                <tbody>
                    <tr>
                        <td><%=e.getDate() %></td>
                        <td><%=e.getcName() %></td>
                        <td><%=e.getStartTime()+" - "+e.getEndTime()%></td>
                    <%  if(e.getStatus()!=null){
                            if(e.getStatus().equals("Pass")){
                    %>
                        <td style="background: #00cc33;color:white"> <%=e.getStatus()%> </td>
                    <% 
                            }
                            else{
                    %>
                        <td style="background: #ff3333;color:white"> <%=e.getStatus()%> </td>
                    <%
                            }
                        }
                        else{
                    %>
                        <td style="background: bisque ;">Terminated</td>
                    <% 
                        }
                    %>
                        <td> <a href="std-page.jsp?pgprt=2&eid=<%=e.getExamId()%>">Details</a> </td>
                    </tr>
            <%
                } 
            %>
                </tbody>
            </table>
        <%
            }
            else{
        %>
            <table class="tab-middle-oi" align="center">
                <thead>
                    <tr class="tab-header-oi">
                        <td colspan="5">
                            <span>Result Details</span>
                        </td>
                    </tr>
                </thead>

                <tbody>
            <%
                ArrayList list=pDAO.getAllAnswersByExamId(Integer.parseInt(request.getParameter("eid")));
                for(int i=0;i<list.size();i++){
                    Answers a=(Answers) list.get(i);
            %>
                    <tr>
                        <td rowspan="2"><%=i+1 %>)</td>
                        <td colspan="2"><%=a.getQuestion()%></td>
                        <td rowspan="2"><%=a.getStatus() %></td>
                    </tr>
                    <tr>
                        <td><%="Your Ans: "+a.getAnswer()%></td>
                        <td><%="Correct Ans: "+a.getCorrectAns() %></td>
                    </tr>

            <%
                }
            %>
                </tbody>
        <%
            }
        %>
            </table>  

        </div>
    </body>
</html>