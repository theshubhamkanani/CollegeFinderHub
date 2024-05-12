<%@page language="java" import="java.sql.*,java.util.*,database.MyConnection,entity.College,dao.CollegeDAO" %>
<%@page language="java" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin-View College</title>
    <%@include file="My_Component/my_css.jsp"%>
    <style type="text/css">
      body {
        background: url("media/College.jpg");
        width: 100%;
        height: 90vh;
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment: fixed;
      }
    </style>
  </head>
  <body>
    <c:if test="${userobj.role ne 'admin'}">
      <c:redirect url="Login.jsp"></c:redirect>
    </c:if>
    <%@include file="My_Component/navbar.jsp"%>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h5 class="text-center text-primary">All Colleges</h5>
          <c:if test="${not empty succMsg}">
            <div class="alert alert-primary" role="alert">${ succMsg}</div>
            <c:remove var="succMsg" />
          </c:if>
          <% 
              CollegeDAO clgdao = new CollegeDAO(MyConnection.getConnection());
              List<College> list = clgdao.getAllCollege();
              for(College clg : list){%>


              <div class="card mt-2">
                <div class="card-body">
                  <div class="text-center text-primary">
                    <i class="fa-solid fa-building-columns fa-3x"></i>
                  </div>

                  <h6><%= clg.getName() %></h6>
                  <p><%= clg.getAddress() %></p>
                  <br />
                  <div class="form-row">
                    <div class="form-group col-md-3">
                      <input
                        type="text"
                        class="form-control form-control-sm"
                        value="State: <%= clg.getLocation() %>"
                        readonly
                      />
                    </div>
                    <div class="form-group col-md-3">
                      <input
                        type="text"
                        class="form-control form-control-sm"
                        value="Course: <%= clg.getCategory() %>"
                        readonly
                      />
                    </div>
                    <div class="form-group col-md-3">
                      <input
                        type="text"
                        class="form-control form-control-sm"
                        value="Admission_mode: <%= clg.getAdmission_mode() %>"
                        readonly
                      />
                    </div>
                    <div class="form-group col-md-3">
                      <input
                        type="text"
                        class="form-control form-control-sm"
                        value="Admission_Status: <%= clg.getAdmission_status() %>"
                        readonly
                      />
                    </div>
                    <div class="text-center">
                      <a href="editCollege.jsp?id=<%=clg.getId() %>" class="btn btn-sm bg-success text-white">Edit</a>
                      <a href="deleteCollege?id=<%=clg.getId() %>" class="btn btn-sm bg-danger text-white">Delete</a>
                    </div>
                  </div>
                </div>
              </div>

                <%}
              %>

          
        </div>
      </div>
    </div>
  </body>
</html>
