package servlet;

import entity.User;
import dao.UserDAO;
import database.MyConnection;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ForgotPasswordServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            HttpSession session = request.getSession(true);
            
            String usrOTP = request.getParameter("otp");
            String Password = request.getParameter("pass");
            String RePassword = request.getParameter("re_pass");

            String Email = (String)session.getAttribute("userEmail");
            String genOTP = (String)session.getAttribute("genOTP");
            UserDAO userdao = new UserDAO(MyConnection.getConnection());
            boolean f = userdao.CheckUser(Email);

           
            if(!f){
                if(Password.equals(RePassword)){
                    if(genOTP.equals(usrOTP)){
                        f = userdao.forgotPassword(Email,Password);
                        if(f) {   
                            session.setAttribute("succMsg","Password Update Successfully");
                            response.sendRedirect("Login.jsp");

                            session.removeAttribute("userEmail");
                            session.removeAttribute("userPassword");
                            session.removeAttribute("genOTP");  
                        }else {
                            session.setAttribute("succMsg","Somthing went wrong! Please try again.");
                            response.sendRedirect("ForgotPassword.jsp");
                        }
                    }else{
                        session.setAttribute("succMsg","OTP  is Incorrect! Please try again.");
                        response.sendRedirect("ForgotPassword.jsp");
                    }
                }else{
                    session.setAttribute("succMsg","Password Does not Match! Please try again.");
                    response.sendRedirect("ForgotPassword.jsp");
                }
            }else{
                session.setAttribute("succMsg","User Not Found! Please Register First.");
                response.sendRedirect("ForgotPassword.jsp");
            }
                
            
        }catch(Exception e){
            out.println(e);
        }
        out.close();
    }

}