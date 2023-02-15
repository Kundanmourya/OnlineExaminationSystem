<%-- 
    Document   : courses
    Created on : 4 Feb, 2023, 6:13:27 PM
    Author     : Chandan
--%>

<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses | OES </title>
    <link rel="stylesheet" type="text/css" href="./css/topnav.css">
    <link rel="stylesheet" type="text/css" href="./css/table.css"> 
    <link rel="stylesheet" type="text/css" href="./css/style.css"> 
    <link rel="stylesheet" type="text/css" href="./css/course.css"> 
  </head>
  <body style="background-color: lightblue;">
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
                    <li><a class="active" href="./adm-page.jsp?pgprt=2">Courses</a></li>
                    <li><a href="./adm-page.jsp?pgprt=3">Questions</a></li>
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
            <h3>All Added Courses List</h3>
          </div>
          <form class="contact-form" >
            <table>
              <thead>
                <tr>
                  <th scope="col">Courses</th>
                  <th scope="col">Total Marks</th>
                  <th scope="col">Action</th>
                </tr>
              </thead>

            <% 
              ArrayList list=pDAO.getAllCourses();
              for(int i=0;i<list.size();i=i+2){
            %>
      
              <tr>
                <td><%=list.get(i)%></td>
                <td><%=list.get(i+1)%></td>
                <td ><a  href="controller.jsp?page=courses&operation=del&cname=<%=list.get(i)%>" onclick="return confirm('Are you sure you want to delete this ?');" class="del">
                        <div>Delete</div>
                    </a></td>
              </tr>
            <%
              }
            %>

            </table>
          </form>
        </div><br>
          
        <div class="left-container">
          <div class="contact-text">
            <h3>Add New Courses </h3>
          </div>
          <form class="contact-form" action="controller.jsp" >
            <div class="form-group">
              <label for="cname">Course Name</label>
              <label><span>*</span></label>
              <input type="text" class="form-control" id="name" name="coursename" placeholder="Course Name">
            </div>
            <div class="form-group">
              <label for="marks">Total Marks</label>
              <label><span>*</span></label>
              <input type="text" name="totalmarks" class="form-control" placeholder="Total Marks">
            </div>
            <div class="form-group">
              <label for="time">Exam Time</label>
              <label><span>*</span></label>
              <input type="text" class="form-control" name="time" placeholder="MM">
            </div>
            <div>
                <input type="hidden" name="page" value="courses">
                <input type="hidden" name="operation" value="addnew">
            </div>
            <button type="submit" class="btn btn-primary" value="Add">Add Course</button>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>

