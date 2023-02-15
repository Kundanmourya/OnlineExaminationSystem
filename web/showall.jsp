<%-- 
    Document   : show-all
    Created on : 8 Feb, 2023, 4:55:45 PM
    Author     : Chandan
--%>


<%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"></jsp:useBean>

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
                        <li><a href="./adm-page.jsp?pgprt=0">Profile</a></li>
                        <li><a href="./adm-page.jsp?pgprt=2">Courses</a></li>
                        <li><a class="active" href="./adm-page.jsp?pgprt=3">Questions</a></li>
                        <li><a href="./adm-page.jsp?pgprt=1">Accounts</a></li>
                        <li><a href="controller.jsp?page=logout">Logout</a></li>
                    </ul>
                </div>
            </nav>
        </div><br>

        <div class="topnav">
            <table class="tab-middle-oi">
                <thead>
                    <tr class="tab-header-oi">
                        <td colspan="8">
                            <span>List of All Questions</span>
                        </td>
                    </tr>
                </thead>

                <thead>
                    <tr>
                        <th scope="col">Sr No.</th>   
                        <th scope="col">Questions</th>   
                        <th scope="col">Option 1</th>
                        <th scope="col">Option 2</th>
                        <th scope="col">Option 3</th>
                        <th scope="col">Option 4</th>
                        <th scope="col">Correct Option</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
            
            <%
                if(request.getParameter("coursename")!=null){
                    ArrayList list=pDAO.getAllQuestions(request.getParameter("coursename"));
                    for(int i=0;i<list.size();i++){
                        Questions question=(Questions)list.get(i);
                   
            %>
            
                <tbody>
                    <tr>
                        <td><%=i+1 %></td>
                        <td><%=question.getQuestion() %></td>
                        <td><%=question.getOpt1() %></td>
                        <td><%=question.getOpt2() %></td>
                        <td><%=question.getOpt3() %></td>
                        <td><%=question.getOpt4() %></td>
                        <td><%=question.getCorrect() %></td>
                        <td><a href="controller.jsp?page=questions&operation=delQuestion&qid=<%=question.getQuestionId() %>" onclick="return confirm('Are you sure you want to delete this ?');">
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
