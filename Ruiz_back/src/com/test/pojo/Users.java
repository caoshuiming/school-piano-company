package com.test.pojo;

public class Users {
    private int user_id;
    private String user_name;
    private String password;
    private String gender;
    private String email;
    private String birth;
    private String tel;
    private String address;

    public Users(int user_id, String user_name, String password, String gender, String email, String birth, String tel, String address) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.password = password;
        this.gender = gender;
        this.email = email;
        this.birth = birth;
        this.tel = tel;
        this.address = address;
    }

    public Users(String user_name, String password, String gender, String email, String birth, String tel, String address) {
        this.user_name = user_name;
        this.password = password;
        this.gender = gender;
        this.email = email;
        this.birth = birth;
        this.tel = tel;
        this.address = address;
    }

    public Users() {

    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Users{" +
                "user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", password=" + password +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", birth='" + birth + '\'' +
                ", tel='" + tel + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
