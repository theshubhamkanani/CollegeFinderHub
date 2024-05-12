package service;

import database.MyConnection;
import java.sql.*;
import java.util.*;

public class FeedbackService{
    private int id;
    private String name;
    private String email;
    private String feedback;

    private Connection con = MyConnection.getConnection();
    private PreparedStatement ps;
    private ResultSet rs;

    public FeedbackService(){

    }
    public FeedbackService(String name, String email, String feedback){
        this.name = name;
        this.email = email;
        this.feedback = feedback;
    }
    public void setId(int id){
        this.id = id;
    }
    public void setName(String name){
        this.name = name;
    }
    public void setEmail(String email){
        this.email = email;
    }
    public void setFeedback(String feedback){
        this.feedback = feedback;
    }

    public int getId(){
        return id;
    }
    public String getName(){
        return name;
    }
    public String getEmail(){
        return email;
    }
    public String getFeedback(){
        return feedback;
    }

    public boolean saveFeedback(){
        boolean f = false;
        try{
            ps = con.prepareStatement("INSERT INTO feedback(name,email,feedback) VALUES(?,?,?)");
            ps.setString(1,this.name);
            ps.setString(2,this.email);
            ps.setString(3,this.feedback);
            int i = ps.executeUpdate();

            if(i==1){
                f = true;
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return f;
    }

    public List<FeedbackService> getAllFeedback(){
        List<FeedbackService> list = new ArrayList<FeedbackService>();
        FeedbackService fs = null;
        try{
            ps = con.prepareStatement("SELECT * FROM feedback ORDER BY id DESC");
            rs = ps.executeQuery();

            while(rs.next()){
                fs = new FeedbackService();
                fs.setId(rs.getInt(1));
                fs.setName(rs.getString(2));
                fs.setEmail(rs.getString(3));
                fs.setFeedback(rs.getString(4)); 

                list.add(fs);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }

    public boolean deleteFeedback(int id){
        boolean f = false;
        try{
            ps = con.prepareStatement("DELETE FROM feedback WHERE id = ?");
            ps.setInt(1,id);
            int i = ps.executeUpdate();

            if(i==1){
                f = true;
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return f;
    }
}