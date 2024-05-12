package servlet;

import database.MyConnection;
import service.FeedbackService;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class DeleteFeedbackServlet extends HttpServlet {
    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{ 
            int Id = Integer.parseInt(request.getParameter("id"));

            HttpSession session = request.getSession(true);

            FeedbackService fs = new FeedbackService();
            boolean f = fs.deleteFeedback(Id);
            
            if(f){
                session.setAttribute("succMsg","Feedback Delete Successfully.");
                response.sendRedirect("Help.jsp");

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