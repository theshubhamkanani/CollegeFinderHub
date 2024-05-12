package servlet;

import entity.User;
import database.MyConnection;
import dao.UserDAO;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class UpdateProfileServlet extends HttpServlet {
    
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            int Id = Integer.parseInt(request.getParameter("id"));
            String Name = request.getParameter("name");
            String Mobile_No = request.getParameter("mobile_no");
            String Email = request.getParameter("email");

            User usr = new User();
            usr.setId(Id);
            usr.setName(Name);
            usr.setMoblie_no(Mobile_No);
            usr.setEmail(Email);
            

            HttpSession session = request.getSession(true);

            UserDAO userdao = new UserDAO(MyConnection.getConnection());
            boolean rs = userdao.updateProfile(usr);
            if(rs){
                session.setAttribute("succMsg","Profile Update Successfully!");
                response.sendRedirect("Home.jsp");
            }else{
                session.setAttribute("succMsg","Somthing went wrong! Please try again.");
                response.sendRedirect("editProfile.jsp");
            }

        }catch(Exception e){
            out.println(e);
        }
        out.close();
    }

}