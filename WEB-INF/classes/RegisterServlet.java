package servlet;

import entity.User;
import dao.UserDAO;
import database.MyConnection;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            HttpSession session = request.getSession(true);
            
            String usrOTP = request.getParameter("otp");
            String Password = request.getParameter("pass");
            String RePassword = request.getParameter("re_pass");

            String Name = (String)session.getAttribute("userName");
            String Mobile_no = (String)session.getAttribute("userMobile");
            String Email = (String)session.getAttribute("userEmail");
            String genOTP = (String)session.getAttribute("genOTP");

            User usr = new User(Name,Mobile_no,Email,Password,"user");
            UserDAO userdao = new UserDAO(MyConnection.getConnection());

            if(userdao.CheckUser(Email)){
                if(Password.equals(RePassword)){
                    if(genOTP.equals(usrOTP)){
                        boolean f = userdao.addUser(usr);
                        if(f) {   
                            session.setAttribute("succMsg","Registration Successfully");
                            response.sendRedirect("Login.jsp");

                            session.removeAttribute("userName");
                            session.removeAttribute("userMobile");
                            session.removeAttribute("userEmail");
                            session.removeAttribute("userMode");
                            session.removeAttribute("genOTP");
                        }else {
                            session.setAttribute("succMsg","Somthing went wrong! Please try again.");
                            session.setAttribute("userMode","self");
                            response.sendRedirect("SendOTP.jsp");
                        }
                    }else{
                        session.setAttribute("succMsg","OTP  is Incorrect! Please try again.");
                        session.setAttribute("userMode","self");
                        response.sendRedirect("SendOTP.jsp");
                    }
                }else {
                    session.setAttribute("succMsg","Password Does not Match! Please try again.");
                    session.setAttribute("userMode","self");
                    response.sendRedirect("SendOTP.jsp");
                }
            }else{
                session.setAttribute("succMsg","User already Register.");
                session.setAttribute("userMode","self");
                response.sendRedirect("Signup.jsp");
            } 
        }catch(Exception e){
            out.println(e);
        }
        out.close();
    }

}