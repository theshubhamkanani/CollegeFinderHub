<%@page language="java"
import="java.sql.*,java.util.*,database.MyConnection,entity.College,dao.CollegeDAO"
%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en"> 
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin-Edit College</title>
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
              <lord-icon src="https://cdn.lordicon.com/fsvddbfp.json" trigger="loop" delay="1500" state="in-reveal"
                colors="primary:#121331,secondary:#4030e8,tertiary:#ffffff" style="width:250px;height:250px">
              </lord-icon>

              <% int id = Integer.parseInt(request.getParameter("id"));
              CollegeDAO clgdao = new CollegeDAO(MyConnection.getConnection());
              College clg = clgdao.getCollegeById(id); %>

              <h5>Edit College</h5>
            </div>
            <form action="updateCollege" method="POST">
              <input type="hidden" value="<%=clg.getId() %>" name="ID"/>
              <div class="form-group">
                <label>Enter College Name</label>
                <input
                  type="text"
                  name="CollegeName"
                  value="<%=clg.getName() %>"
                  required
                  class="form-control"
                />
              </div>
              <div class="form-group">
                <label>College Official Website</label>
                <input type="text" placeholder="Enter College Official Website" name="CollegeWebsite" value="<%=clg.getWebsite() %>" required class="form-control" />
              </div>
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label>State</label>
                  <select
                    name="Location"
                    class="custom-select"
                    id="inlineFormCustomSelectPref"
                  >
                    <option value="<%=clg.getLocation() %>">
                      <%=clg.getLocation() %>
                    </option>
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
                <div class="form-group col-md-4">
                  <label>Course</label>
                  <select
                    name="Category"
                    class="custom-select"
                    id="inlineFormCustomSelectPref"
                  >
                    <option value="<%=clg.getCategory() %>">
                      <%=clg.getCategory() %>
                    </option>
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
                <div class="form-group col-md-4">
                  <label>Admission Mode</label>
                  <select
                    name="AdmissionMode"
                    class="custom-select"
                    id="inlineFormCustomSelectPref"
                  >
                    <option value="<%=clg.getAdmission_mode() %>">
                      <%=clg.getAdmission_mode() %>
                    </option>
                    <option value="Centralized Counseling">Centralized Counseling</option>
                    <option value="Direct Admission">Direct Admission</option>
                    <option value="Distance Learning">Distance Learning</option>
                    <option value="Entrance Exam">Entrance Exam</option>
                    <option value="Foreign Student Quota">Foreign Student Quota</option>
                    <option value="Government Nomination">Government Nomination</option>
                    <option value="Hostel Quota">Hostel Quota</option>
                    <option value="Industry Sponsorship">Industry Sponsorship</option>
                    <option value="Joint Seat Allocation">Joint Seat Allocation</option>
                    <option value="Lateral Entry">Lateral Entry</option>
                    <option value="Management Quota">Management Quota</option>
                    <option value="Merit List">Merit List</option>
                    <option value="National Level Entrance Test">National Level Entrance Test</option>
                    <option value="Online Admission">Online Admission</option>
                    <option value="Payment Seat">Payment Seat</option>
                    <option value="Quota for Minorities">Quota for Minorities</option>
                    <option value="Reservation Quota">Reservation Quota</option>
                    <option value="Sponsored Seat">Sponsored Seat</option>
                    <option value="Transfer Admission">Transfer Admission</option>
                    <option value="University Entrance Test">University Entrance Test</option>
                  </select>
                </div>
                <div class="form-group col-md-4">
                  <label>Admission Status</label>
                  <select name="AdmissionStatus" class="form-control">
                    <option
                      class="Active"
                      value="<%=clg.getAdmission_status() %>"
                    >
                      <%=clg.getAdmission_status() %>
                    </option>
                    <option class="Active" value="Active">Active</option>
                    <option class="Inactive" value="Inactive">Inactive</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label>Enter College Address</label>
                <textarea
                  required
                  rows="6"
                  cols=""
                  name="Address"
                  class="form-control"
                >
<%=clg.getAddress() %></textarea
                >
              </div>
              <button class="btn btn-primary">Update Details</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
