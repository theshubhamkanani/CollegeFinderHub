<%@page language="java" %> <%@page language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CollegeFinderHub-Signup</title>
    <%@include file="My_Component/my_css.jsp" %>
    <style type="text/css">
      body {
        background: url("media/Register.jpg");
        width: 100%;
        height: 90vh;
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment: fixed;
      }
    </style>
    <script src="JavaScript/MyValidation.js"></script>
  </head>
  <body>
    <%@include file="My_Component/navbar.jsp"%>

     
    <div class="container-fluid">
      <div class="row p-4">
        <div class="col-md-4 offset-md-4">
          <div class="card">
            <div class="card-body">
              <div class="text-center">
                <script src="https://cdn.lordicon.com/lordicon.js"></script>
                <lord-icon src="https://cdn.lordicon.com/piolrlvu.json" trigger="loop" delay="100" state="hover-roll"
                  style="width:250px;height:250px">
                </lord-icon>
                <h5>Registration</h5>
              </div>
              <c:if test="${not empty succMsg}">
                <div class="alert alert-primary" role="alert">${ succMsg}</div>
                <c:remove var="succMsg" />
              </c:if>
              <form action="SendOTP.jsp" method="POST">
                <% 
                          session = request.getSession(false);
                          String email = (String)session.getAttribute("userEmail");
                          String name = (String)session.getAttribute("userName");
                          String mobile = (String)session.getAttribute("userMobile");
                          String mode = (String)session.getAttribute("userMode");
                          if(mode != null){
                            session.setAttribute("userMode","other");
                          }
                      %>
                <div class="form-group">
                  <label>Your Full Name</label>
                  <input type="text" placeholder="Enter Your Full Name" required="required" class="form-control" id="exampleInputEmail1"
                    aria-describedby="emailHelp" name="name" <% if(email != null){ %> value="<%= name %>" <% } %> />
                </div>
                <div class="form-group">
                  <label>Mobile Number</label>
                  <input id="usermobile" type="number" placeholder="Enter Your Mobile Number" required="required" class="form-control"
                    aria-describedby="emailHelp" name="mobile_no" <% if(email != null){ %> value="<%= mobile %>" <% } %> />
                </div>
                <div class="form-group">
                  <label>Work Email</label>
                  <input type="email" placeholder="Enter Work Email" required="required" class="form-control" aria-describedby="emailHelp" name="email" <% if(email != null){ %> value="<%= email %>" <% } %> />
                </div>
                <button type="submit" class="btn btn-primary badge-pill btn-block">Send OTP</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
