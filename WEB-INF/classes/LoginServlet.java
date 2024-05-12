package servlet;

import entity.User;
import dao.UserDAO;
import database.MyConnection;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
    private String adminEmail = "admin@gmail.com";
    private String adminPassword = "123";

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            String email = request.getParameter("email");
            String password = request.getParameter("pass");

            HttpSession session = request.getSession(true);

            User user = new User();

            if(adminEmail.equals(email) && adminPassword.equals(password)) {   
                user.setRole("admin");
                response.sendRedirect("Admin.jsp");  // redirect to the Admin page  
                session.setAttribute("userobj",user);
                

            }else {
                UserDAO userdao = new UserDAO(MyConnection.getConnection());
                User usr = userdao.UserLogin(email,password);
                if(usr!=null){
                    user.setRole("user");
                    response.sendRedirect("Home.jsp");  // redirect to the Home page  
                    session.setAttribute("userobj",usr);
                     session.setAttribute("userEmail",email);
                }else{
                    session.setAttribute("succMsg","Invalid User Name Or Password!");
                     response.sendRedirect("Login.jsp"); 
                }
            }

        }catch(Exception e){
            out.println(e);
        }
        out.close();
    }

}