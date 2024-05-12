<%@page language="java" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CollegeFinderHub-Admin</title>
    <style type="text/css">
      .back-img {
        background: url("media/Admin.jpg");
        width: 100%;
        height: 94vh;
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment: fixed;
      }
    </style>
    <%@include file="My_Component/my_css.jsp"%>
  </head>
  <body>
    <c:if test="${userobj.role ne 'admin'}">
      <c:redirect url="Login.jsp"></c:redirect>
    </c:if>
    <%@include file="My_Component/navbar.jsp"%>
    <div class="container-fluid back-img">
      <div class="text-center">
        <h1 class="text-white p-4">Welcome Admin</h1>
      </div>
    </div>
  </body>
</html>
