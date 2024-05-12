<%@page language="java" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#">CollegeFinderHub</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <c:choose>
        <c:when test="${userobj.role eq 'admin'}">
          <li class="nav-item active">
            <a class="nav-link" href="Admin.jsp"><i class="fa-solid fa-house"></i> Home
              <span class="sr-only">(current)</span></a>
          </li>
        </c:when>
        <c:when test="${userobj.role eq 'user'}">
          <li class="nav-item active">
            <a class="nav-link" href="Home.jsp"><i class="fa-solid fa-house"></i> Home
              <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="Help.jsp"><i class="fa-solid fa-address-card"></i> FeedBack
              <span class="sr-only">(current)</span></a>
          </li>
        </c:when>
        <c:otherwise>
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i> Home
                    <span class="sr-only">(current)</span></a>
                </li>
        </c:otherwise>
      </c:choose>
      <c:if test="${userobj.role eq 'admin'}">
        <li class="nav-item">
          <a class="nav-link" href="addCollege.jsp"><i class="fa-solid fa-plus"></i> Add College</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="viewCollege.jsp"><i class="fa-solid fa-building-columns"></i> View College</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="Help.jsp"><i class="fa-solid fa-address-card"></i> View User FeedBack
            <span class="sr-only">(current)</span></a>
        </li>
      </c:if>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <c:if test="${userobj.role eq 'admin'}">
        <a href="#" class="btn btn-light mr-2"><i class="fa-solid fa-user"></i> Admin</a>
        <a href="Logout" class="btn btn-light"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
      </c:if>

      <c:if test="${userobj.role eq 'user'}">
        <a href="#" class="btn btn-light mr-2" data-toggle="modal" data-target="#UserProfile"><i
            class="fa-solid fa-user"></i> ${userobj.name}</a>
        <a href="Logout" class="btn btn-light"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
      </c:if>

      <c:if test="${empty userobj}">
        <a href="Login.jsp" class="btn btn-light mr-2"><i class="fa-solid fa-user"></i> Login</a>
        <a href="Signup.jsp" class="btn btn-light"><i class="fa-solid fa-user-plus"></i> Signup</a>
      </c:if>
    </form>
  </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="UserProfile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">User Profile : ${userobj.name}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="card">
          <div class="card-body">
            <div class="text-center text-primary">
              <script src="https://cdn.lordicon.com/lordicon.js"></script>
              <lord-icon src="https://cdn.lordicon.com/fmasbomy.json" trigger="loop" delay="2000" state="hover-looking-around"
                style="width:250px;height:250px">
              </lord-icon>
            </div>
            <table class="table">
              <tbody>
                <tr>
                  <th scope="row">Name</th>
                  <th>${userobj.name}</th>
                </tr>
                <tr>
                  <th scope="row">Mobile No</th>
                  <th>${userobj.mobile_no}</th>
                </tr>
                <tr>
                  <th scope="row">Email</th>
                  <th>${userobj.email}</th>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">
          Close
        </button>
        <a href="editProfile.jsp" class="btn btn-primary">Edit</a>
        <% 
          session = request.getSession(false);
          String useremail = (String)session.getAttribute("userEmail");
        %>
        <a href="deleteUser?uemail=<%=useremail%>" class="btn btn-danger">Delete Profile</a>
      </div>
    </div>
  </div>
</div>