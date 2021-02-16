package com.test.dao;

import com.test.db.C3p0ConnectionFactory;
import com.test.pojo.Manager;
import com.test.pojo.Users;
import com.test.utils.MD5Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * dao: data access object.
 */
public class ManagerDao {

    /**
     * 查询全部管理员
     *
     * @return
     */
    public List<Manager> selectAllManager() {

        List<Manager> managers = new ArrayList<Manager>();
        String sql = "SELECT manager_id, manager_name,password,flag FROM manager";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Manager managers1 = new Manager();
                managers1.setM_id(rs.getInt("manager_id"));
                managers1.setM_name(rs.getString("manager_name"));
                managers1.setPassword(rs.getString("password"));
                managers1.setFlag(rs.getInt("flag"));
                managers.add(managers1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return managers;
    }
    /**
     * 根据ID删除管理员。
     *
     * @param id
     * @return
     */
    public int deleteManagerById(int id) {

        int ret = 0;
        String sql = "DELETE FROM manager WHERE manager_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            // 返回值是指数据库的响应行数，就是删除、或者更新了几行，就返回几。
            ret = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }

        return ret;
    }

    /**
     * 根据ID查询管理员。
     *
     * @param id
     * @return
     */
    public Manager selectManagerById(int id) {

        Manager manager = null;
        String sql = "SELECT manager_id, manager_name, password, flag FROM manager WHERE manager_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置参数
            pstmt.setInt(1, id);
            // 查询
            rs = pstmt.executeQuery();
            // 循环迭代
            while (rs.next()) {
                manager = new Manager();
                manager.setM_id(rs.getInt("manager_id"));
                manager.setM_name(rs.getString("manager_name"));
                manager.setPassword(rs.getString("password"));
                manager.setFlag(rs.getInt("flag"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return manager;
    }

    /**
     * 更新管理员信息
     * @param manager
     * @return
     */
    public int updateManager(Manager manager) {

        int ret = 0;
        String sql = "UPDATE manager SET manager_name = ?, password=?, flag=? WHERE manager_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            String password= MD5Utils.stringToMD5(manager.getPassword());
            // 设置三个参数
            pstmt.setString(1, manager.getM_name());
            pstmt.setString(2, password);
            pstmt.setInt(3, manager.getFlag());
            pstmt.setInt(4, manager.getM_id());
            ret = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }

        return ret;
    }
    /**
     * 通过用户名、密码查询用户信息，用于登录。
     * @param m_name
     * @param password
     * @return
     */
    public Manager selectUserByManagernameAndPassword(String m_name, String password) {

        String sql = "SELECT manager_id, manager_name, password, flag FROM manager WHERE manager_name = ? AND password = ?";
        Manager manager = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置参数
            pstmt.setString(1, m_name);
            pstmt.setString(2, password);
            // 查询
            rs = pstmt.executeQuery();
            while (rs.next()) {
                manager = new Manager();
                manager.setM_id(rs.getInt("manager_id"));
                manager.setM_name(rs.getString("manager_name"));
                manager.setPassword(rs.getString("password"));
                manager.setFlag(rs.getInt("flag"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return manager;
    }

    /**
     * 插入一个管理员。
     *
     * @param manager
     * @return
     */
    public int insertManager(Manager manager) {

        int ret = 0;
        String sql = "INSERT INTO manager(manager_name, password, flag) VALUES (?, ?, ?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, manager.getM_name());
            pstmt.setString(2, manager.getPassword());
            pstmt.setInt(3, manager.getFlag());
            ret = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }

        return ret;
    }

    /**
     * 通过用户名查询用户信息。
     * @param m_name
     * @return
     */
    public Manager selectByManagername(String m_name) {

        String sql = "SELECT manager_id, manager_name, password, flag FROM manager WHERE manager_name = ?";
        Manager manager = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置参数
            pstmt.setString(1, m_name);
            // 查询
            rs = pstmt.executeQuery();
            while (rs.next()) {
                manager = new Manager();
                manager.setM_id(rs.getInt("manager_id"));
                manager.setM_name(rs.getString("manager_name"));
                manager.setPassword(rs.getString("password"));
                manager.setFlag(rs.getInt("flag"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return manager;
    }
}