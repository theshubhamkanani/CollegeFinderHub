package entity;

public class User{
    private int id;
    private String name;
    private String mobile_no;
    private String email;
    private String password;
    private String role;
    
    public User(){
        super();
    }
    public User(String name, String mobile_no, String email, String password, String role){
        this.name = name;
        this.mobile_no = mobile_no;
        this.email = email;
        this.password = password;
        this.role = role;
    }
    public User(int id, String name, String mobile_no, String email, String password, String role){
        this.id = id;
        this.name = name;
        this.mobile_no = mobile_no;
        this.email = email;
        this.password = password;
        this.role = role;
    }
    //setters and getters for all the attributes of User
    public int getId() { 
        return id; 
    }
    public void setId(int id) { 
        this.id = id; 
    } 
    public String getName() { 
        return name; 
    }
    public void setName(String name) { 
        this.name = name; 
    }  
    public String getMobile_no() { 
        return mobile_no; 
    }
    public void setMoblie_no(String mobile_no) { 
        this.mobile_no = mobile_no; 
    }
    public String getEmail() { 
        return email; 
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() { 
        return password; 
    }
    public void setPassword(String password) {
        this.email = password;
    }
    public String getRole() { 
        return role; 
    }
    public void setRole(String role) {
        this.role = role;
    }
}