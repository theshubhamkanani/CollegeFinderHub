package servlet;

import entity.College;
import database.MyConnection;
import dao.CollegeDAO;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class updateCollegeServlet extends HttpServlet {
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            int Id = Integer.parseInt(request.getParameter("ID"));
            String CollegeName = request.getParameter("CollegeName");
            String Website = request.getParameter("CollegeWebsite");
            String Location = request.getParameter("Location");
            String Category = request.getParameter("Category");
            String AdmissionMode = request.getParameter("AdmissionMode");
            String AdmissionStatus = request.getParameter("AdmissionStatus");
            String Address = request.getParameter("Address");

            College clg = new College();
            clg.setId(Id);
            clg.setName(CollegeName);
            clg.setWebsite(Website);
            clg.setLocation(Location);
            clg.setCategory(Category);
            clg.setAdmission_mode(AdmissionMode);
            clg.setAdmission_status(AdmissionStatus);
            clg.setAddress(Address);

            HttpSession session = request.getSession(true);

            CollegeDAO cldao = new CollegeDAO(MyConnection.getConnection());
            boolean rs = cldao.updateCollege(clg);
            if(rs){
             session.setAttribute("succMsg","Record Update Successfully!");
             response.sendRedirect("viewCollege.jsp");
            }else{
             session.setAttribute("succMsg","Somthing went wrong! Please try again.");
             response.sendRedirect("viewCollege.jsp");
            }

        }catch(Exception e){
            out.println(e);
        }
        out.close();
    }

}