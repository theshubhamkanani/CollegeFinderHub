<%@page language="java" import="java.util.*,service.FeedbackService" %>

<!DOCTYPE html> 
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CollegeFinderHub</title>
    <%@include file="My_Component/my_css.jsp" %>
    <style type="text/css">
      body {
        background: url("media/FeedBack.jpg");
        width: 100%;
        height: 90vh;
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment: fixed;
      }
    </style>
  </head>
  <body>
    <%@include file="My_Component/navbar.jsp" %>

    <c:if test="${userobj.role eq 'user'}">
      <div class="container-fluid fd-custom">
        <div class="row p-5">
          <div class="col-md-4 offset-md-4">
            <div class="card">
              <div class="card-body">
                <div class="text-center">
                  <script src="https://cdn.lordicon.com/lordicon.js"></script>
                  <lord-icon src="https://cdn.lordicon.com/zfzufhzk.json" trigger="loop" delay="1500" state="in-dynamic"
                    colors="primary:#121131,secondary:#4030e8,tertiary:#ffffff,quaternary:#ffffff,quinary:#3a3347"
                    style="width:250px;height:250px">
                  </lord-icon>
                  <h5>FeedBack</h5>
                </div>
                <c:if test="${not empty succMsg}">
                  <div class="alert alert-primary" role="alert">${ succMsg}</div>
                  <c:remove var="succMsg" />
                </c:if>
                
                <form action="Feedback" method="post">
                  <div class="form-group">
                    <label>Your Name</label>
                    <input type="text" required="required" class="form-control" id="exampleInputEmail1"
                      aria-describedby="emailHelp" name="name" value="${userobj.name}" readonly/>
                  </div>
                  <div class="form-group">
                    <label>Your Email</label>
                    <input type="email" required="required" class="form-control" id="exampleInputEmail1"
                      aria-describedby="emailHelp" name="email" value="${userobj.email}" readonly/>
                  </div>
                  <div class="form-group">
                    <label>Enter Your Opinion</label>
                    <textarea required rows="6" cols="" name="feedback" class="form-control" maxlength="990"></textarea>
                  </div>
                  <button type="submit" class="btn btn-primary badge-pill btn-block" data-toggle="tooltip"
                    data-placement="bottom" title="Login">Send FeedBack</button>
                    <a class="btn btn-primary badge-pill btn-block" href="Home.jsp">Back </a>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </c:if>

    <c:if test="${userobj.role eq 'admin'}">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h5 class="text-center text-primary">User Feedback</h5>
            <c:if test="${not empty succMsg}">
              <div class="alert alert-primary" role="alert">${ succMsg}</div>
              <c:remove var="succMsg" />
            </c:if>
            <% 
              FeedbackService feedback = new FeedbackService();
              List<FeedbackService> list = feedback.getAllFeedback();

              if(list.isEmpty()){
              %>
              <div class="alert alert-warning" role="alert">NO FEEDBACK!</div>
              <%
              }

              for(FeedbackService fs : list){ %>
      
            <div class="card mt-2">
              <div class="card-body">
                <div class="text-center text-primary">
                  <i class="fa-solid fa-comment-dots fa-3x" style="color: #74C0FC;"></i></i>
                </div>
      
                <h6>USER NAME : <%= fs.getName() %></h6>
                <p> USER GMAIL ACCOUNT: <%= fs.getEmail() %></p>
                <div class="form-group">
                  <label><%= fs.getName() %> FeedBack</label>
                  <textarea required rows="6" cols="" name="Address" class="form-control" readonly><%= fs.getFeedback() %></textarea>
                </div>
                <br />
                <div class="form-row">
                  <div class="text-center">
                    <a href="SendEmail.jsp?email=<%=fs.getEmail() %>" class="btn btn-sm bg-primary text-white">Send Email</a>
                    <a href="deleteFeedback?id=<%=fs.getId() %>" class="btn btn-sm bg-danger text-white">Delete</a> 
                  </div>
                </div>
              </div>
            </div>
      
            <%}
            %>
          </div>
        </div>
      </div>
    </c:if>
    <%@include file="My_Component/Footer.jsp"%>
  </body>
</html>
