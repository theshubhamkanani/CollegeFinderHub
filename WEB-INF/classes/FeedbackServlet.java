package servlet;

import service.FeedbackService;
import service.EmailService;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class FeedbackServlet extends HttpServlet {
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            HttpSession session = request.getSession(true);

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String feedback = request.getParameter("feedback");

            FeedbackService fs = new FeedbackService(name,email,feedback);
            boolean f = fs.saveFeedback();
            
            if(f){
                session.setAttribute("succMsg","Feedback Send Successfully.");
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