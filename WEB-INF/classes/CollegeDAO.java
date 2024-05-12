package dao;

import java.sql.*;
import java.util.*;
import entity.College;

public class CollegeDAO{
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public CollegeDAO(Connection con) {
        this.con = con;
    }
    
    public boolean addCollege(College clg){
        boolean f = false;

        try{
            ps = con.prepareStatement("INSERT INTO colleges(name,website,location,category,admission_mode,admission_status,address) VALUES(?,?,?,?,?,?,?)");
            ps.setString(1,clg.getName());
            ps.setString(2,clg.getWebsite());
            ps.setString(3,clg.getLocation());
            ps.setString(4,clg.getCategory());
            ps.setString(5,clg.getAdmission_mode());
            ps.setString(6,clg.getAdmission_status());
            ps.setString(7,clg.getAddress());

            int i = ps.executeUpdate();

            if(i==1){
                f = true;
            }
        }catch(Exception e){
            System.out.println(e);
        }

        return f;
    }
    
    public List<College> getAllCollege(){
        List<College> list = new ArrayList<College>();
        College clg = null;

        try{
            ps = con.prepareStatement("SELECT * FROM colleges ORDER BY id DESC");
            rs = ps.executeQuery();

            while(rs.next()){
                clg = new College();
                clg.setId(rs.getInt(1));
                clg.setName(rs.getString(2));
                clg.setWebsite(rs.getString(3));
                clg.setLocation(rs.getString(4));
                clg.setCategory(rs.getString(5));
                clg.setAdmission_mode(rs.getString(6));
                clg.setAdmission_status(rs.getString(7));
                clg.setAddress(rs.getString(8));

                list.add(clg);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }

    public List<College> getAllCollegeForUser(){
        List<College> list = new ArrayList<College>();
        College clg = null;

        try{
            ps = con.prepareStatement("SELECT * FROM colleges WHERE admission_status = ? ORDER BY id DESC");
            ps.setString(1,"Active");
            rs = ps.executeQuery();

            while(rs.next()){
                clg = new College();
                clg.setId(rs.getInt(1));
                clg.setName(rs.getString(2));
                clg.setWebsite(rs.getString(3));
                clg.setLocation(rs.getString(4));
                clg.setCategory(rs.getString(5));
                clg.setAdmission_mode(rs.getString(6));
                clg.setAdmission_status(rs.getString(7));
                clg.setAddress(rs.getString(8));

                list.add(clg);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }

    public College getCollegeById(int id){
        College clg = null;

        try{
            ps = con.prepareStatement("SELECT * FROM colleges WHERE id = ?");
            ps.setInt(1,id);
            rs = ps.executeQuery();

            while(rs.next()){
                clg = new College();
                clg.setId(rs.getInt(1));
                clg.setName(rs.getString(2));
                clg.setWebsite(rs.getString(3));
                clg.setLocation(rs.getString(4));
                clg.setCategory(rs.getString(5));
                clg.setAdmission_mode(rs.getString(6));
                clg.setAdmission_status(rs.getString(7));
                clg.setAddress(rs.getString(8));
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return clg;
    }

    public boolean updateCollege(College clg){
        boolean f = false;

        try{
            ps = con.prepareStatement("UPDATE colleges SET name=?,website=?,location=?,category=?,admission_mode=?,admission_status=?,address=? WHERE id=?");
            ps.setString(1,clg.getName());
            ps.setString(2,clg.getWebsite());
            ps.setString(3,clg.getLocation());
            ps.setString(4,clg.getCategory());
            ps.setString(5,clg.getAdmission_mode());
            ps.setString(6,clg.getAdmission_status());
            ps.setString(7,clg.getAddress());
            ps.setInt(8,clg.getId());

            int i = ps.executeUpdate();

            if(i==1){
                f = true;
            }
        }catch(Exception e){
            System.out.println(e);
        }

        return f;
    }

    public boolean deleteCollege(int id){
        boolean f = false;

        try{
            ps = con.prepareStatement("DELETE FROM colleges WHERE id = ?");
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

    public List<College> getCollegeORLocationAndCategory(String Location, String Category){
        List<College> list = new ArrayList<College>();
        College clg = null;
        try{
            ps = con.prepareStatement("SELECT * FROM colleges WHERE admission_status = ? AND (location = ? OR category = ?) ORDER BY id DESC");
            ps.setString(1,"Active");
            ps.setString(2,Location);
            ps.setString(3,Category);
            rs = ps.executeQuery();

            while(rs.next()){
                clg = new College();
                clg.setId(rs.getInt(1));
                clg.setName(rs.getString(2));
                clg.setWebsite(rs.getString(3));
                clg.setLocation(rs.getString(4));
                clg.setCategory(rs.getString(5));
                clg.setAdmission_mode(rs.getString(6));
                clg.setAdmission_status(rs.getString(7));
                clg.setAddress(rs.getString(8));

                list.add(clg);
            }

        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }

     public List<College> getCollegeANDLocationAndCategory(String Location, String Category){
        List<College> list = new ArrayList<College>();
        College clg = null;
        try{
            ps = con.prepareStatement("SELECT * FROM colleges WHERE location = ? AND category = ? AND admission_status = ? ORDER BY id DESC");
            ps.setString(1,Location);
            ps.setString(2,Category);
            ps.setString(3,"Active");
            rs = ps.executeQuery();

            while(rs.next()){
                clg = new College();
                clg.setId(rs.getInt(1));
                clg.setName(rs.getString(2));
                clg.setWebsite(rs.getString(3));
                clg.setLocation(rs.getString(4));
                clg.setCategory(rs.getString(5));
                clg.setAdmission_mode(rs.getString(6));
                clg.setAdmission_status(rs.getString(7));
                clg.setAddress(rs.getString(8));

                list.add(clg);
            }

        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
}