package entity;

public class College {
    private int id;
    private String name;
    private String website; 
    private String location;
    private String category;
    private String admission_mode;
    private String address;
    private String status;

    public College() {
    }

    public College(String name, String website, String location, String category, String admission_mode, String address) {
        this.name = name;
        this.location = location;
        this.category = category;
        this.admission_mode = admission_mode;
        this.address = address;
        this.status = status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setWebsite(String website){
        this.website = website;
    }

    public String getWebsite(){
        return website;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLocation() {
        return location;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }

    public void setAdmission_mode(String admission_mode) {
        this.admission_mode = admission_mode;
    }

    public String getAdmission_mode() {
        return admission_mode;
    }

    public void setAdmission_status(String status) {
        this.status = status;
    }

    public String getAdmission_status() {
        return status;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }
}