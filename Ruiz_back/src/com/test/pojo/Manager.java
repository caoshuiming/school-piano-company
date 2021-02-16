package com.test.pojo;

public class Manager {
    private int m_id;
    private String m_name;
    private String password;
    private int flag;

    public Manager(int m_id, String m_name, String password, int flag) {
        this.m_id = m_id;
        this.m_name = m_name;
        this.password = password;
        this.flag = flag;
    }

    public Manager(String m_name, String password, int flag) {
        this.m_name = m_name;
        this.password = password;
        this.flag = flag;
    }
    public Manager() {

    }

    public int getM_id() {
        return m_id;
    }

    public void setM_id(int m_id) {
        this.m_id = m_id;
    }

    public String getM_name() {
        return m_name;
    }

    public void setM_name(String m_name) {
        this.m_name = m_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "Manager{" +
                "m_id=" + m_id +
                ", m_name='" + m_name + '\'' +
                ", password='" + password + '\'' +
                ", flag=" + flag +
                '}';
    }
}
