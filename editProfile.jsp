<%@page language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit User Profile</title>
    <%@include file="My_Component/my_css.jsp"%>
    <style type="text/css">
      body {
        background: url("media/UpdateProfile.jpg");
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

    <div class="continer-fluid">
      <div class="row p-4">
        <div class="col-md-4 offset-md-4">
          <div class="card">
            <div class="card-body">
              <div class="text-center">
                <script src="https://cdn.lordicon.com/lordicon.js"></script>
                <lord-icon src="https://cdn.lordicon.com/szoiozyr.json" trigger="loop" delay="2000" stroke="light"
                  colors="primary:#121331,secondary:#4030e8,tertiary:#faddd1,quaternary:#242424,quinary:#9ce5f4"
                  style="width:200px;height:200px">
                </lord-icon>
                <h5>Edit Profile</h5>
                <c:if test="${not empty succMsg}">
                  <div class="alert alert-primary" role="alert">
                    ${ succMsg}
                  </div>
                  <c:remove var="succMsg" />
                </c:if>
              </div>
              <form action="UpdateProfile" method="POST">
                <input type="hidden" name="id" value="${userobj.id}" />
                <div class="form-group">
                  <label>Enter Full Name </label>
                  <input
                    type="text"
                    required="required"
                    class="form-control"
                    id="exampleInputEmail1"
                    aria-describedby="emailHelp"
                    name="name"
                    value="${userobj.name}"
                  />
                </div>
                <div class="form-group">
                  <label>Enter Mobile Number </label>
                  <input
                    type="text"
                    required="required"
                    class="form-control"
                    id="exampleInputEmail1"
                    aria-describedby="emailHelp"
                    name="mobile_no"
                    value="${userobj.mobile_no}"
                  />
                </div>
                <div class="form-group">
                  <label>Enter Mobile Email </label>
                  <input
                    type="text"
                    required="required"
                    class="form-control"
                    id="exampleInputEmail1"
                    aria-describedby="emailHelp"
                    name="email"
                    value="${userobj.email}"
                  />
                </div>
                <button type="submit" class="btn btn-primary badge-pill btn-block">
                  Update
                </button>
                <a href="Home.jsp" class="btn btn-primary badge-pill btn-block">Back</a>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
