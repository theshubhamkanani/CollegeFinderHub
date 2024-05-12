<%@page language="java" import="service.EmailService" %> <%@page language="java"
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
            background: url("media/Register.jpg");
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
                            <lord-icon src="https://cdn.lordicon.com/pjvkqmkl.json" trigger="loop" delay="1000" state="morph-add"
                                colors="primary:#121331,secondary:#2516c7,tertiary:#ffffff" style="width:250px;height:250px">
                            </lord-icon>
                            <h5>OTP Validation</h5>
                        </div>
                        <c:if test="${not empty succMsg}">
                            <div class="alert alert-primary" role="alert">${ succMsg}</div>
                            <c:remove var="succMsg" />
                        </c:if>
                        <form action="ForgotPassword" method="POST">
                            <%  
                                session = request.getSession(false);
                                String email = (String)session.getAttribute("userEmail");
                                String mode = (String)session.getAttribute("userMode");

                                if(email != null && mode.equals("ForgotUser")){
                                    email = (String)session.getAttribute("userEmail");
                                }else{
                                    String password = request.getParameter("pass"); 
                                    String rePassword = request.getParameter("re_pass");
                                    email = request.getParameter("email");

                                    session.setAttribute("userEmail",email);
                                    session.setAttribute("userMode","ForgotUser");

                                    String genOTP = EmailService.getOTP();
                                    boolean f = EmailService.ForgotPasswordEmail(email,genOTP);
                                    if(f) {   
                                        session.setAttribute("succMsg","OTP Send Successfully");
                                        session.setAttribute("genOTP",genOTP);
                                        response.sendRedirect("OTPValidation.jsp");
                                    }else {
                                        session.setAttribute("succMsg","Somthing went wrong! Please try again.");
                                        response.sendRedirect("OTPValidation.jsp");
                                    }
                                    
                                }  
                            %>
                            <div class="form-group">
                                <label>Your Email</label>
                                <input type="text" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                    name="email" value="<%= email %>" readonly />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Enter OTP</label>
                                <input type="text" placeholder="Enter One-Time-Password" required="required" class="form-control" id="exampleInputPassword1" name="otp" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Enter Your New Password</label>
                                <input type="password" placeholder="Create New Password" required="required" class="form-control" id="exampleInputPassword1" name="pass" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Confirm Your New Password</label>
                                <input type="password" placeholder="Re-Enter Your New password" required="required" class="form-control" id="exampleInputPassword1" name="re_pass" />
                            </div>

                            <button type="submit" class="btn btn-primary badge-pill btn-block">
                                Forgot My Password
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>