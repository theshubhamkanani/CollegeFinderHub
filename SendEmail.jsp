<%@page language="java" import="database.MyConnection,entity.User,dao.UserDAO" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin-Send Mail</title>
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

    <div class="container p-2">
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-body">
                    <div class="text-center text-success">
                        <script src="https://cdn.lordicon.com/lordicon.js"></script>
                        <lord-icon src="https://cdn.lordicon.com/nqisoomz.json" trigger="loop" delay="1500" state="in-unfold"
                            style="width:250px;height:250px">
                        </lord-icon>

                        <%  String email = request.getParameter("email"); %>

                        <c:if test="${not empty succMsg}">
                            <div class="alert alert-primary" role="alert">${ succMsg}</div>
                            <c:remove var="succMsg" />
                        </c:if>

                        <h5>Email Service</h5>
                    </div>
                    <form action="SendEmailToUser" method="POST">
                        <div class="form-group">
                            <label>User Email Address</label>
                            <input type="text" name="email" required class="form-control" value="<%= email %>" readonly />
                        </div>
                        <div class="form-group">
                            <label>Your Massage</label> 
                            <textarea required rows="10"
                                placeholder="Enter Your Massage here... (Don't Need Write Email Structure, just Write Your Massage, Email Structure will Generate Automatically)"
                                cols="" name="massage" class="form-control"></textarea>
                        </div>      
                        <button class="btn btn-primary">Send Mail</button>
                        <a href="Help.jsp" class="btn btn-primary">Back</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>