package servlet;

import database.MyConnection;
import dao.CollegeDAO;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class deleteCollegeServlet extends HttpServlet {
    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            int Id = Integer.parseInt(request.getParameter("id"));

            HttpSession session = request.getSession(true);

            CollegeDAO cldao = new CollegeDAO(MyConnection.getConnection());
            boolean rs = cldao.deleteCollege(Id);
            if(rs){
             session.setAttribute("succMsg","Record Deleted Successfully!");
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