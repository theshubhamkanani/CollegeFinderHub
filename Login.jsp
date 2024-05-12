<%@page language="java" %>
<%@page language="java" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CollegeFinderHub-Login</title>
    <%@include file="My_Component/my_css.jsp" %>
    <style type="text/css">
      body {
        background: url("media/Login.jpg");
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
      <div class="row p-5">
        <div class="col-md-4 offset-md-4">
          <div class="card">
            <div class="card-body">
              <div class="text-center">
                <script src="https://cdn.lordicon.com/lordicon.js"></script>
                <lord-icon src="https://cdn.lordicon.com/neujejkf.json" trigger="loop"
                  colors="primary:#121331,secondary:#4030e8,tertiary:#9cc2f4,quaternary:#3a3347,quinary:#9cc2f4,senary:#b06836,septenary:#f7c7be"
                  style="width:200px;height:200px">
                </lord-icon>
                <h5>Login Page</h5>
              </div>
              <c:if test="${not empty succMsg}">
                <div class="alert alert-primary" role="alert">${ succMsg}</div>
                <c:remove var="succMsg" />
              </c:if>
              <form action="Login" method="post"> 
                <div class="form-group">
                  <label>Enter Email</label>
                  <input id="usermail" type="email" placeholder="Enter your Email" required="required"
                    class="form-control" aria-describedby="emailHelp" name="email" />
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Enter Password</label>
                  <input type="password" placeholder="Enter your Password" required="required" class="form-control" id="exampleInputPassword1" name="pass" />
                </div>
                <button type="submit" class="btn btn-primary badge-pill btn-block" data-toggle="tooltip" data-placement="bottom"
                  title="Login">Login</button>
                <a href="ForgotPassword.jsp" class="btn btn-primary badge-pill btn-block" data-toggle="tooltip"
                  data-placement="bottom" title="Forgot Your Password">Forgot Password</a>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
