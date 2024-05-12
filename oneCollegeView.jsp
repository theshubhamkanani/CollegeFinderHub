<%@page language="java"
import="java.sql.*,java.util.*,database.MyConnection,entity.College,dao.CollegeDAO"
%> <%@page language="java" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>CollegeFinderHub-View</title>
  <%@include file="My_Component/my_css.jsp"%>
  <style type="text/css">
    body {
      background: url("media/OneCollege.jpg");
      width: 100%;
      height: 90vh;
      background-repeat: no-repeat;
      background-size: cover;
      background-attachment: fixed;
    }
  </style>
</head>

<body>
  <c:if test="${empty userobj}">
    <c:redirect url="Login>jsp"></c:redirect>
  </c:if>
  <%@include file="My_Component/navbar.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <% int id = Integer.parseInt(request.getParameter("id")); 
        CollegeDAO clgdao = new CollegeDAO(MyConnection.getConnection());
        College clg = clgdao.getCollegeById(id); %>
        <div class="card mt-5">
          <div class="card-body">
            <div class="text-center text-primary">
              <i class="fa-solid fa-building-columns fa-3x"></i>
            </div>

            <h6><%= clg.getName() %></h6>
            <p><%= clg.getAddress() %></p>
            <br />
            <div class="form-row">
              <div class="form-group col-md-3">
                <input type="text" class="form-control form-control-sm" value="State: <%= clg.getLocation() %>"
                  readonly />
              </div>
              <div class="form-group col-md-3">
                <input type="text" class="form-control form-control-sm" value="Course: <%= clg.getCategory() %>"
                  readonly />
              </div>
              <div class="form-group col-md-3">
                <input type="text" class="form-control form-control-sm"
                  value="Admission_mode: <%= clg.getAdmission_mode() %>" readonly />
              </div>
              <div class="form-group col-md-3">
                <input type="text" class="form-control form-control-sm"
                  value="Admission_Status: <%= clg.getAdmission_status() %>" readonly />
              </div>
              <div class="text-center">
                <a href="Home.jsp" class="btn btn-sm bg-primary text-white">Back</a>
                <a href="<%= clg.getWebsite() %>" target="_blank" class="btn btn-sm bg-primary text-white">Visit College official WebSite</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>