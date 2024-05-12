package service;

import java.io.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class EmailService {
    public static String getOTP(){
        try{
            Random random = new Random();
            return String.format("%06d",random.nextInt(1000000));
        }catch(Exception e){
            System.out.println(e);
        }
        return "000000";
    }
    public static boolean RegisterEmail(String name, String email, String genOTP) {
        boolean f = false;

        String msg = "";
        String msg1 = "";

        try{
            FileReader r = new FileReader("S:\\Education\\Tomcat8\\webapps\\CollegeFinderHub\\EmailMSG\\RegisterEmail.txt");
            try{
                int i;
                while((i = r.read()) != -1){
                    msg += (char)i;
                }
                msg1 = msg.replaceAll("studentemail", name);
                msg = msg1;
                msg1 = msg.replaceAll("genOTP", genOTP);
            }catch(Exception e){
                System.out.println(e);
            }finally{
                r.close();
            }
            
        }catch(Exception e){
            System.out.println(e);
        }

        // Recipient's email ID needs to be mentioned.
        String to = email;
        // Sender's email ID needs to be mentioned

        String from = "patelgrouphelp@gmail.com";
        // Assuming you are sending email from through gmails smtp
        
        String host = "smtp.gmail.com";
        // Get system properties
        Properties properties = System.getProperties();
        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, "ttqjefjgggyiebea");
            }
        });
        // Used to debug SMTP issues
        session.setDebug(true);
        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // Set Subject: header field
            message.setSubject("Registration OTP for CollegeFinderHub");
            // Now set the actual message
            message.setText(msg1);
            // Send message
            Transport.send(message);
            System.out.println("Registration OTP Sent successfully....");
            return f = true;
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        return f;
    }

    public static boolean ForgotPasswordEmail(String email, String genOTP) {
        boolean f = false;

        String msg = "";
        String msg1 = "";

        try{
            FileReader r = new FileReader("S:\\Education\\Tomcat8\\webapps\\CollegeFinderHub\\EmailMSG\\ForgotPasswordEmail.txt");
            try{
                int i;
                while((i = r.read()) != -1){
                    msg += (char)i;
                }
                msg1 = msg.replaceAll("studentemail", email);
                msg = msg1;
                msg1 = msg.replaceAll("genOTP", genOTP);
            }catch(Exception e){
                System.out.println(e);
            }finally{
                r.close();
            }
            
        }catch(Exception e){
            System.out.println(e);
        }

        // Recipient's email ID needs to be mentioned.
        String to = email;
        // Sender's email ID needs to be mentioned

        String from = "patelgrouphelp@gmail.com";
        // Assuming you are sending email from through gmails smtp
        
        String host = "smtp.gmail.com";
        // Get system properties
        Properties properties = System.getProperties();
        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, "ttqjefjgggyiebea");
            }
        });
        // Used to debug SMTP issues
        session.setDebug(true);
        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // Set Subject: header field
            message.setSubject("Password Recovery OTP for CollegeFinderHub");
            // Now set the actual message
            message.setText(msg1);
            // Send message
            Transport.send(message);
            System.out.println("Password Recovery OTP Sent successfully....");
            return f = true;
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        return f;
    }

    public static void FeedbackEmail(String name, String email) {
        String msg = "";
        String msg1 = "";

        try{
            FileReader r = new FileReader("S:\\Education\\Tomcat8\\webapps\\CollegeFinderHub\\EmailMSG\\FeedbackEmail.txt");
            try{
                int i;
                while((i = r.read()) != -1){
                    msg += (char)i;
                }
                msg1 = msg.replaceAll("studentemail", name);

            }catch(Exception e){
                System.out.println(e);
            }finally{
                r.close();
            }
            
        }catch(Exception e){
            System.out.println(e);
        }

        // Recipient's email ID needs to be mentioned.
        String to = email;
        // Sender's email ID needs to be mentioned

        String from = "patelgrouphelp@gmail.com";
        // Assuming you are sending email from through gmails smtp
        
        String host = "smtp.gmail.com";
        // Get system properties
        Properties properties = System.getProperties();
        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, "ttqjefjgggyiebea");
            }
        });
        // Used to debug SMTP issues
        session.setDebug(true);
        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // Set Subject: header field
            message.setSubject("Thank You for Your Feedback!");
            // Now set the actual message
            message.setText(msg1);
            // Send message
            Transport.send(message);
            System.out.println("Thank You message Sent successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }

    public static boolean sendUserMail(String email, String name, String usermsg){
        boolean f = false;
        String msg = "";
        String msg1 = "";

        try{
            FileReader r = new FileReader("S:\\Education\\Tomcat8\\webapps\\CollegeFinderHub\\EmailMSG\\SendUserEmail.txt");
            try{
                int i;
                while((i = r.read()) != -1){
                    msg += (char)i;
                }
                msg1 = msg.replaceAll("studentemail", name);
                msg = msg1;
                msg1 = msg.replaceAll("adminmsg", usermsg);

            }catch(Exception e){
                System.out.println(e);
            }finally{
                r.close();
            }
        }catch(Exception e){
            System.out.println(e);
        }

        // Recipient's email ID needs to be mentioned.
        String to = email;
        // Sender's email ID needs to be mentioned

        String from = "patelgrouphelp@gmail.com";
        // Assuming you are sending email from through gmails smtp
        
        String host = "smtp.gmail.com";
        // Get system properties
        Properties properties = System.getProperties();
        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, "ttqjefjgggyiebea");
            }
        });
        // Used to debug SMTP issues
        session.setDebug(true);
        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // Set Subject: header field
            message.setSubject("Appreciation for Your Feedback on CollegeFinderHub");
            // Now set the actual message
            message.setText(msg1);
            // Send message
            Transport.send(message);
            System.out.println("Admin message Sent successfully....");

            f = true;
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        return f;
    }
}