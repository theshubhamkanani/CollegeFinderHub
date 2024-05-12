package servlet;

import database.MyConnection;
import dao.UserDAO;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class deleteUserServlet extends HttpServlet {
    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            String email = request.getParameter("uemail");

            HttpSession session = request.getSession(true);

            UserDAO userdao = new UserDAO(MyConnection.getConnection());
            boolean rs = userdao.deleteUser(email);
            if(rs){
             session.setAttribute("succMsg","User Profile Deleted Successfully!");
             response.sendRedirect("Login.jsp");
             session.removeAttribute("userobj");
            }else{
             session.setAttribute("succMsg","Somthing went wrong! Please try again.");
             response.sendRedirect("Home.jsp");
            }

        }catch(Exception e){
            out.println(e);
        }
        out.close();
    }

}