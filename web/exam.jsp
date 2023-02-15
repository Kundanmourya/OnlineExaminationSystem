<%-- 
    Document   : exam
    Created on : 10 Feb, 2023, 6:22:31 PM
    Author     : Chandan
--%>

<%@page import="myPackage.classes.Exams"%>
<%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Exam | OES </title>
	     <link rel="stylesheet" type="text/css" href="./css/topnav.css">
	    <link rel="stylesheet" type="text/css" href="./css/table.css"> 
	    <link rel="stylesheet" type="text/css" href="./css/style.css"> 
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
                        <li><a class="active" href="./std-page.jsp?pgprt=1">Exams</a></li>
                        <li><a href="./std-page.jsp?pgprt=2">Results</a></li>
                        <li><a href="controller.jsp?page=logout">Logout</a></li>
                    </ul>
                </div>
            </nav>
        </div><br> 
        
        <div class="form" style="width:100%;" >
         
        <%
            if(session.getAttribute("examStarted")!=null){
               if(session.getAttribute("examStarted").equals("1")){
        %>
                <span id="remainingTime" style="position: fixed;top:90px;left: 300px;font-size: 23px;background: rgba(255,0,77,0.38);border-radius: 5px;padding: 10px;box-shadow: 2px -2px 6px 0px;"></span>
                   
                <script>
                    var time = <%=pDAO.getRemainingTime(Integer.parseInt(session.getAttribute("examId").toString())) %>;
                    time--;
                    var sec=60;                    
                    document.getElementById("remainingTime").innerHTML =  time+" : "+sec;
                    
                    var x= window.setInterval(timerFunction, 1000);

                    function timerFunction(){
                        sec--;
                        
                        if (time < 0) {
                            clearInterval(x);
                            document.getElementById("remainingTime").innerHTML = "00 : 00";
                            document.getElementById("myform").submit();
                        }
                        document.getElementById("remainingTime").innerHTML =  time+" : "+sec;
                        if(sec==0){
                            sec=60;
                            time--;   
                        }
                    }
                </script>
                
            <h2>All the Best!</h2>
            <p></p>
            <form id="myform" action="controller.jsp" style="width:100%">
                <div class="error-text"></div>
                
                <%
                ArrayList list=pDAO.getQuestions(request.getParameter("coursename"),20);
                Questions question;
                %>
                <input type="hidden" name="size" value="<%=list.size()%>">
                <input type="hidden" name="totalmarks" value="<%=pDAO.getTotalMarksByName(request.getParameter("coursename"))%>">
                
                <%
                for(int i=0;i<list.size();i++){
                    question=(Questions)list.get(i);
                %>
                
                <br><hr><br>
                <h4>Q<label class="question-label"><%=i+1%></label>.) <%=question.getQuestion()%></h4><br>
                <div>
                    <input type="radio" id="c1<%=i%>" name="ans<%=i%>" value="<%=question.getOpt1()%>" required>
                    <label for="c1<%=i%>"><%=question.getOpt1()%></label>
                </div><br>
                <div>
                    <input type="radio" id="c1<%=i%>" name="ans<%=i%>" value="<%=question.getOpt2()%>" required>
                    <label for="c2<%=i%>"><%=question.getOpt2()%></label>
                </div><br>
                <div>
                    <input type="radio" id="c1<%=i%>" name="ans<%=i%>" value="<%=question.getOpt3()%>" required>
                    <label for="c3<%=i%>"><%=question.getOpt3()%></label>
                </div><br>
                <div>
                    <input type="radio" id="c1<%=i%>" name="ans<%=i%>" value="<%=question.getOpt4()%>" required>
                    <label for="c4<%=i%>"><%=question.getOpt4()%></label>
                </div>
                
                
                    <input type="hidden" name="question<%=i%>" value="<%=question.getQuestion()%>">
                    <input type="hidden" name="qid<%=i%>" value="<%=question.getQuestionId()%>">
                
            
            <%
                }
                
            %>
                <input type="hidden" name="page" value="exams">
                <input type="hidden" name="operation" value="submitted"> 
                    <div class="submit">
                    <input type="submit" value="Done" name="Done" class="button">
                </div>  
            </form>
        
            
        <%
            }
        }
        else if(request.getParameter("showresult")!=null){
            if(request.getParameter("showresult").equals("1")){
                Exams result= pDAO.getResultByExamId(Integer.parseInt(request.getParameter("eid")));
        %>

        <h2>Result of Recent Exam</h2><br><hr><br>
            <p></p>
            <form>
                <span class="tag">Exam Date: </span><span class="val"><%=result.getDate() %></span><br><br>
                <span class="tag">Start Time: </span><span class="val"><%=result.getStartTime() %></span><br><br>
                <span class="tag">End Time: </span><span class="val"><%=result.getEndTime() %></span><br><br>
                <span class="tag">Course Name: </span><span class="val"><%=result.getcName() %></span><br><br>
                <span class="tag">Obt Marks: </span><span class="val"><%=result.getObtMarks() %></span><br><br>
                <span class="tag">Total Marks: </span><span class="val"><%=result.gettMarks() %></span><br><br>
                <span class="tag">Result: </span><span class="val"><%=result.getStatus() %></span><br><br>
            </form>
        </div>
    
    <%
            }
        }
        else if(session.getAttribute("examStarted")==null ){
    %>

        <h2>Select Course to Give Exam</h2>
        <p></p>
        <form action="controller.jsp">
            <label>Select Course</label>
            <input type="hidden" name="page" value="exams">
            <input type="hidden" name="operation" value="startexam">
            <select name="coursename" class="text">
        <% 
            ArrayList list1=pDAO.getAllCourses();
    
            for(int i=0;i<list1.size();i=i+2){
        %>
                <option value="<%=list1.get(i)%>"><%=list1.get(i)%></option>
        <%
            }
        %>
            </select>
            <div class="submit">
                <input type="submit" value="Start Exam" class="button">
            </div>     
        </form>

    <% 
        }
    %>
    </body>
</html>
