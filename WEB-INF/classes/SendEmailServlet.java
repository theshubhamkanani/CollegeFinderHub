package servlet;

import service.EmailService;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SendEmailServlet extends HttpServlet {
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            HttpSession session = request.getSession(true);

            String email = request.getParameter("email");
            String name = "Student";
            String massage = request.getParameter("massage");

            boolean f = EmailService.sendUserMail(email, name, massage);
            
            if(f){
                session.setAttribute("succMsg","Email Send Successfully.");
                response.sendRedirect("Help.jsp");
                EmailService.FeedbackEmail(name, email);

            }else{
                session.setAttribute("succMsg","Somthing went wrong! Please try again.");
                response.sendRedirect("Help.jsp"); 
            }

        }catch(Exception e){
            out.println(e);
        }
        out.close();
    }

}