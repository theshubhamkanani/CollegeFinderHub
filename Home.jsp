<%@page language="java"
import="java.sql.*,java.util.*,database.MyConnection,entity.College,dao.CollegeDAO"
%> <%@page language="java" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CollegeFinderHub-Home</title>
    <%@include file="My_Component/my_css.jsp" %>
    <%@include file="My_Component/navbar.jsp" %>
    <style type="text/css">
      body {
         background: url("media/Home.jpg");
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
        <c:redirect url="Login.jsp"></c:redirect>
    </c:if>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-white">All Colleges</h5>
                <c:if test="${not empty succMsg}">
                    <div class="alert alert-primary" role="alert">${ succMsg}</div>
                    <c:remove var="succMsg" />
                </c:if>
                <div class="card">
                    <div class="card-body">
                        <form class="form-inline" action="SearchCollege.jsp" method="GET">
                            <div class="form-group col-md-5 mt-1">
                                <h5>State</h5>
                            </div>
                            <div class="form-group col-md-4 mt-1">
                                <h5>Course</h5>
                            </div>
                            <div class="form-group col-md-5">
                                <select name="Location" class="custom-select" id="inlineFormCustomSelectPref">
                                    <option selected value="Location">Select State</option>
                                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                                    <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                    <option value="Assam">Assam</option>
                                    <option value="Bihar">Bihar</option>
                                    <option value="Chhattisgarh">Chhattisgarh</option>
                                    <option value="Goa">Goa</option>
                                    <option value="Gujarat">Gujarat</option>
                                    <option value="Haryana">Haryana</option>
                                    <option value="Himachal Pradesh">Himachal Pradesh</option>
                                    <option value="Jharkhand">Jharkhand</option>
                                    <option value="Karnataka">Karnataka</option>
                                    <option value="Kerala">Kerala</option>
                                    <option value="Madhya Pradesh">Madhya Pradesh</option>
                                    <option value="Maharashtra">Maharashtra</option>
                                    <option value="Manipur">Manipur</option>
                                    <option value="Meghalaya">Meghalaya</option>
                                    <option value="Mizoram">Mizoram</option>
                                    <option value="Nagaland">Nagaland</option>
                                    <option value="Odisha">Odisha</option>
                                    <option value="Punjab">Punjab</option>
                                    <option value="Rajasthan">Rajasthan</option>
                                    <option value="Sikkim">Sikkim</option>
                                    <option value="Tamil Nadu">Tamil Nadu</option>
                                    <option value="Telangana">Telangana</option>
                                    <option value="Tripura">Tripura</option>
                                    <option value="Uttar Pradesh">Uttar Pradesh</option>
                                    <option value="Uttarakhand">Uttarakhand</option>
                                    <option value="West Bengal">West Bengal</option>
                                </select>
                            </div>

                            <div class="form-group col-md-5">
                                <select name="Category" class="custom-select" id="inlineFormCustomSelectPref">
                                    <option selected value="Category">Select Course</option>
                                    <option value="Anthropology">Anthropology</option>
                                    <option value="Architecture">Architecture</option>
                                    <option value="Biochemistry">Biochemistry</option>
                                    <option value="Biology">Biology</option>
                                    <option value="Biomedical Engineering">Biomedical Engineering</option>
                                    <option value="Business Administration">Business Administration</option>
                                    <option value="Chemical Engineering">Chemical Engineering</option>
                                    <option value="Chemistry">Chemistry</option>
                                    <option value="Civil Engineering">Civil Engineering</option>
                                    <option value="Computer Science">Computer Science</option>
                                    <option value="Criminology">Criminology</option>
                                    <option value="Data Science">Data Science</option>
                                    <option value="Economics">Economics</option>
                                    <option value="Electrical Engineering">Electrical Engineering</option>
                                    <option value="English Literature">English Literature</option>
                                    <option value="Environmental Science">Environmental Science</option>
                                    <option value="Finance">Finance</option>
                                    <option value="Genetics">Genetics</option>
                                    <option value="Geography">Geography</option>
                                    <option value="History">History</option>
                                    <option value="Industrial Design">Industrial Design</option>
                                    <option value="Information Technology">Information Technology</option>
                                    <option value="International Relations">International Relations</option>
                                    <option value="Journalism">Journalism</option>
                                    <option value="Linguistics">Linguistics</option>
                                    <option value="Management">Management</option>
                                    <option value="Marketing">Marketing</option>
                                    <option value="Mathematics">Mathematics</option>
                                    <option value="Mechanical Engineering">Mechanical Engineering</option>
                                    <option value="Microbiology">Microbiology</option>
                                    <option value="Music">Music</option>
                                    <option value="Neuroscience">Neuroscience</option>
                                    <option value="Nursing">Nursing</option>
                                    <option value="Nutrition">Nutrition</option>
                                    <option value="Philosophy">Philosophy</option>
                                    <option value="Physics">Physics</option>
                                    <option value="Political Science">Political Science</option>
                                    <option value="Psychology">Psychology</option>
                                    <option value="Public Health">Public Health</option>
                                    <option value="Robotics Engineering">Robotics Engineering</option>
                                    <option value="Sociology">Sociology</option>
                                    <option value="Software Engineering">Software Engineering</option>
                                    <option value="Sports Science">Sports Science</option>
                                    <option value="Statistics">Statistics</option>
                                    <option value="Supply Chain Management">Supply Chain Management</option>
                                    <option value="Telecommunications Engineering">Telecommunications Engineering</option>
                                    <option value="Theater Arts">Theater Arts</option>
                                    <option value="Urban Planning">Urban Planning</option>
                                    <option value="Veterinary Science">Veterinary Science</option>
                                    <option value="Zoology">Zoology</option>
                                </select>
                            </div>
                            <button class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>  
                <% 
                    CollegeDAO clgdao = new CollegeDAO(MyConnection.getConnection());
                    List<College> list = clgdao.getAllCollegeForUser();
                    for(College clg : list){%>
                        <div class="card mt-2">
                <div class="card-body">
                  <div class="text-center text-primary">
                    <i class="fa-solid fa-building-columns fa-3x"></i>
                  </div>

                  <h6><%= clg.getName() %></h6>
                  <%
                    if(clg.getAddress().length() > 0 && clg.getAddress().length() < 120){
                  %>      
                  <p><%= clg.getAddress() %>.</p>
                  <%
                    }else{
                  %> 
                  <p><%= clg.getAddress().substring(0,120) %>...</p>
                  <%
                    }
                  %>  
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
                      <a href="oneCollegeView.jsp?id=<%=clg.getId() %>" class="btn btn-sm bg-primary text-white" data-toggle="tooltip" data-placement="bottom" title="View More Details">View Detail</a>
                    </div>
                    
                  </div>
                </div>
              </div>

                <%}%>
  
            </div>
        </div>
    </div>
</body>

</html>