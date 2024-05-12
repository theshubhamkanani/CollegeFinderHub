<%@page language="java" %> <%@page language="java"
%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
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
            background: url("media/ForgotPassword.jpg");
            width: 100%;
            height: 90vh;
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }
    </style>
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
                        <lord-icon src="https://cdn.lordicon.com/fmjvulyw.json" trigger="loop" delay="2000"
                            colors="primary:#121331,secondary:#ffffff,tertiary:#3a3347,quaternary:#4030e8,quinary:#f9c9c0,senary:#f24c00"
                            style="width:250px;height:250px">
                        </lord-icon>
                            <h5>Forgot Password</h5>
                        </div>
                        <c:if test="${not empty succMsg}">
                            <div class="alert alert-primary" role="alert">${ succMsg}</div>
                            <c:remove var="succMsg" />
                        </c:if>
                        <form action="OTPValidation.jsp" method="POST">
                            <% session.setAttribute("userMode","ForgotPass"); %>
                            <div class="form-group">
                                <label>Enter Your Email</label>
                                <input type="email" placeholder="Enter Your Register Email Id" required="required" class="form-control"
                                    aria-describedby="emailHelp" name="email" />
                            </div>
                            <button type="submit" class="btn btn-primary badge-pill btn-block">
                                Send OTP
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>