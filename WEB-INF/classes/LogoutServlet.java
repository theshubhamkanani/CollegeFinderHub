package servlet;

import database.MyConnection;
import dao.CollegeDAO;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class LogoutServlet extends HttpServlet {
    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            HttpSession session = request.getSession(true);
            session.setAttribute("succMsg", "Logout Successfully");
            response.sendRedirect("Login.jsp");
            session.removeAttribute("succMsg");
            session.removeAttribute("userobj");
            
            session.removeAttribute("userName");
            session.removeAttribute("userMobile");
            session.removeAttribute("userEmail");
            session.removeAttribute("userMode");
            session.removeAttribute("genOTP");
           
        }catch(Exception e){
            out.println(e);
        }
        out.close();
    }

}