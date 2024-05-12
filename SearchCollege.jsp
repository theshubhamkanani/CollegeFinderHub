<%@page language="java" import="java.sql.*,java.util.*,database.MyConnection,entity.College,dao.CollegeDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>AllColleges</title>
    <%@include file="My_Component/my_css.jsp"%>
    <style type="text/css">
      body {
        background: url("media/AllCollegeView.jpg");
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
          <script>
            $(function () {
                var current_progress = 0;
                var interval = setInterval(function () {
                  current_progress += 10;
                  $("#dynamic")
                    .css("width", current_progress + "%")
                    .attr("aria-valuenow", current_progress)
                    .text(current_progress + "% Complete");
                  if (current_progress >= 100)
                    clearInterval(interval);
                }, 10);
              });
          </script>
          
          <h5 class="text-center text-primary">All Colleges</h5>
          <div class="d-flex justify-content-center">
            <div class="progress">
              <div id="dynamic" class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar"
                aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                <span id="current-progress"></span>
              </div>
            </div>
          </div>
          <% 
            String Location = request.getParameter("Location");
            String Category = request.getParameter("Category");
            
            CollegeDAO clgdao = new CollegeDAO(MyConnection.getConnection());
            List<College> list = null;
            if("Location".equals(Location) && "Category".equals(Category)){
                list = new ArrayList<College>();
%>
                <div class="alert alert-danger" role="alert">Please Select Location Or Course First!</div>
<%
            }else if("Location".equals(Location) || "Category".equals(Category)){
                list = clgdao.getCollegeORLocationAndCategory(Location, Category);
            }else{
                list = clgdao.getCollegeANDLocationAndCategory(Location, Category);
            }

            if(list.isEmpty()){
%>
                <div class="alert alert-warning" role="alert">NO COLLEGES FOUND!</div>
<%
            }
            
            if(list != null){
                for(College clg : list){
%>
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
                                  value="Location: <%= clg.getLocation() %>"
                                  readonly
                                />
                            </div>
                            <div class="form-group col-md-3">
                                <input
                                  type="text"
                                  class="form-control form-control-sm"
                                  value="Category: <%= clg.getCategory() %>"
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
                                <a href="oneCollegeView.jsp?id=<%=clg.getId() %>" class="btn btn-sm bg-primary text-white">View Detail</a>
                            </div>
                        </div>
                    </div>
                </div>
<%
                }
            }
%>
        </div>
      </div>
        <div class="text-center">
            <a href="Home.jsp" class="btn btn-sm bg-primary text-white">Back</a>
        </div>
    </div>
  </body>
</html>
