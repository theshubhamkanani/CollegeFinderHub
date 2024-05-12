package servlet;

import entity.College;
import database.MyConnection;
import dao.CollegeDAO;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class addCollegeServlet extends HttpServlet {
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
           String CollegeName = request.getParameter("CollegeName");
           String CollegeWebsite = request.getParameter("CollegeWebsite");
           String Location = request.getParameter("Location");
           String Category = request.getParameter("Category");
           String AdmissionMode = request.getParameter("AdmissionMode");
           String AdmissionStatus = request.getParameter("AdmissionStatus");
           String Address = request.getParameter("Address");

           College clg = new College();
           clg.setName(CollegeName);
           clg.setWebsite(CollegeWebsite);
           clg.setLocation(Location);
           clg.setCategory(Category);
           clg.setAdmission_mode(AdmissionMode);
           clg.setAdmission_status(AdmissionStatus);
           clg.setAddress(Address);

           HttpSession session = request.getSession(true);

           CollegeDAO cldao = new CollegeDAO(MyConnection.getConnection());
           boolean rs = cldao.addCollege(clg);
           if(rs){
            session.setAttribute("succMsg","Record added Successfully!");
            response.sendRedirect("viewCollege.jsp");
           }else{
            session.setAttribute("succMsg","Somthing went wrong! Please try again.");
            response.sendRedirect("addCollege.jsp");
           }

        }catch(Exception e){
            out.println(e);
        }
        out.close();
    }

}