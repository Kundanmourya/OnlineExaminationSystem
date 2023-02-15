<%-- 
    Document   : questions
    Created on : 5 Feb, 2023, 2:48:52 PM
    Author     : Chandan
--%>


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
    <link rel="stylesheet" type="text/css" href="./css/course.css"> 
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

    <div class="container-body">
      <div class="content-form">
        <div class="right-container">
          <div class="contact-text">
              <h3>Show All Question for</h3>
          </div>
          <form class="contact-form" >
            <div class="form-group">
              <label for="cname">Select Course</label>
              <label><span>*</span></label>
              <input type="hidden" name="pgprt" value="4">
              <select name="coursename" class="form-control">

          <% 
              ArrayList list1=pDAO.getAllCourses();
              for(int i=0; i<list1.size(); i=i+2){
          %>
                <option value="<%= list1.get(i)%>"><%=list1.get(i)%></option>
          <%
              }
          %>
              </select>
            </div>
            <button type="submit" class="btn btn-primary" value="Show">Show</button>
          </form>
        </div>

        <div class="left-container">
          <div class="contact-text">
            <h3>Add New Question </h3>
          </div>
          <form class="contact-form" action="controller.jsp" >
            <div class="form-group">
              <label for="cname">Course Name</label>
              <label><span>*</span></label>
              <select name="coursename" class="form-control">
          <% 
              ArrayList list=pDAO.getAllCourses();
              for(int i=0; i<list.size(); i=i+2){
          %>
                <option value="<%= list.get(i)%>"><%=list.get(i)%></option>
          <%
              }
          %>
              </select>
            </div>

            <div class="form-group">
              <label for="marks">Your Question:</label>
              <label><span>*</span></label>
              <input type="text" name="question" class="form-control" placeholder="Type your question here">
            </div>
            <div class="form-group">
              <label for="marks">Options:</label>
              <label><span>*</span></label>
              <input type="text" name="opt1" class="form-control" placeholder="First Option">
              <input type="text" name="opt2" class="form-control" placeholder="Second Option">
              <input type="text" name="opt3" class="form-control" placeholder="Third Option">
              <input type="text" name="opt4" class="form-control" placeholder="Fourth Option">
            </div>
            <div class="form-group">
              <label for="marks">Correct Answer: </label>
              <label><span>*</span></label>
              <input type="text" name="correct" class="form-control" placeholder="Correct Answer">
            </div>
            <div>
              <input type="hidden" name="page" value="questions">
              <input type="hidden" name="operation" value="addnew">
            </div>
            <button type="submit" class="btn btn-primary" value="Add" name="submit">Add Question</button>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>

