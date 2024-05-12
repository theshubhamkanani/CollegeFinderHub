package dao;

import java.sql.*;
import java.util.*;
import entity.User;

public class UserDAO{
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public UserDAO(Connection con) {
        this.con = con;
    }
    
    public boolean addUser(User usr){
        boolean f = false;

        try{
            ps = con.prepareStatement("INSERT INTO users(name,mobile_no,email,password,role) VALUES(?,?,?,?,?)");
            ps.setString(1,usr.getName());
            ps.setString(2,usr.getMobile_no());
            ps.setString(3,usr.getEmail());
            ps.setString(4,usr.getPassword());
            ps.setString(5,usr.getRole());
            
            int i = ps.executeUpdate();

            if(i==1){
                f = true;
            }
        }catch(Exception e){
            System.out.println(e);
        }

        return f;
    }

    public User UserLogin(String email, String pass){
        User usr = null;
        try{
            ps = con.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
            ps.setString(1,email);
            ps.setString(2,pass);
            rs = ps.executeQuery();
            while(rs.next()){
                usr = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return usr;
    }

    public boolean updateProfile(User usr){
        boolean f = false;
        try{
            ps = con.prepareStatement("UPDATE users SET name=?, mobile_no=?, email=? WHERE id=?");
            ps.setString(1,usr.getName());
            ps.setString(2,usr.getMobile_no());
            ps.setString(3,usr.getEmail());
            ps.setInt(4,usr.getId());

            int i = ps.executeUpdate();
            if(i==1){
                f = true;
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return f;
    }
    public boolean forgotPassword(String email, String password){
        boolean f = false;
        try{
            ps = con.prepareStatement("UPDATE users SET password = ? WHERE email = ?");
            ps.setString(1,password);
            ps.setString(2,email);
            int i = ps.executeUpdate();
            if(i==1){
                f = true;
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return f;
    }
    public boolean CheckUser(String email){  
        boolean f = true;
        try{
            ps = con.prepareStatement("SELECT * FROM users WHERE email = ?");
            ps.setString(1,email);
            rs = ps.executeQuery();
            if(rs.isBeforeFirst()){
                f = false;
            }else{
                f = true;
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return f;
    }
    public User getUserByEmail(String email){
        User usr = null;

        try{
            ps = con.prepareStatement("SELECT * FROM Users WHERE email = ?");
            ps.setString(1,email);
            rs = ps.executeQuery();

            while(rs.next()){
                usr = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return usr;
    }

    public boolean deleteUser(String email){
        boolean f = false;

        try{
            ps = con.prepareStatement("DELETE FROM users WHERE email = ?");
            ps.setString(1,email);
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