package com.test.dao;

import com.test.db.C3p0ConnectionFactory;
import com.test.pojo.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class UsersDao {

    /**
     * 查询全部学生
     *
     * @return
     */
    public List<Users> selectAllUsers() {

        List<Users> users = new ArrayList<Users>();
        String sql = "SELECT user_id, user_name,password, gender, email, birth, tel,address FROM user";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Users users1 = new Users();
                users1.setUser_id(rs.getInt("user_id"));
                users1.setUser_name(rs.getString("user_name"));
                users1.setPassword(rs.getString("password"));
                users1.setGender(rs.getString("gender"));
                users1.setEmail(rs.getString("email"));
                users1.setBirth(rs.getString("birth"));
                users1.setTel(rs.getString("tel"));
                users1.setAddress(rs.getString("address"));
                users.add(users1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return users;
    }

    /**
     * 分页查询全部学生
     * @param start 从哪里开始查（0开始）
     * @param pageSize 一页查询几条。
     * @return
     */
    public List<Users> selectUsersByPage(int start, int pageSize) {

        System.out.println("selectUsersByPage(" + start + "," + pageSize + ")");
        List<Users> users = new ArrayList<Users>();
        String sql = "SELECT user_id, user_name,password, gender, email, birth, tel,address FROM user LIMIT ?, ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置参数
            pstmt.setInt(1, start);
            pstmt.setInt(2, pageSize);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Users users1 = new Users();
                users1.setUser_id(rs.getInt("user_id"));
                users1.setUser_name(rs.getString("user_name"));
                users1.setPassword(rs.getString("password"));
                users1.setGender(rs.getString("gender"));
                users1.setEmail(rs.getString("email"));
                users1.setBirth(rs.getString("birth"));
                users1.setTel(rs.getString("tel"));
                users1.setAddress(rs.getString("address"));
                users.add(users1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return users;
    }
    /**
     * 查询学生的人数
     * @return
     */
    public int selectUsersCounts() {

        int counts = 0;
        String sql = "SELECT COUNT(user_id) cnt FROM user";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置参数
            rs = pstmt.executeQuery();
            while (rs.next()) {
                counts = rs.getInt("cnt");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }
        return counts;
    }

    /**
     * 根据ID删除用户。
     *
     * @param id
     * @return
     */
    public int deleteUsersById(int id) {

        int ret = 0;
        String sql = "DELETE FROM user WHERE user_id = ?";
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
     * 根据ID查询学生。
     * @param id
     * @return
     */
    public Users selectUsersById(int id) {

        Users users = null;
        String sql = "SELECT user_id,user_name,password, gender, email, birth, tel,address FROM user WHERE user_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                users = new Users();
                users.setUser_id(rs.getInt("user_id"));
                users.setUser_name(rs.getString("user_name"));
                users.setPassword(rs.getString("password"));
                users.setGender(rs.getString("gender"));
                users.setEmail(rs.getString("email"));
                users.setBirth(rs.getString("birth"));
                users.setTel(rs.getString("tel"));
                users.setAddress(rs.getString("address"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return users;
    }

    /**
     * 更新用户信息
     * @param users
     * @return
     */
    public int updateUsers(Users users) {

        int ret = 0;
        String sql = "UPDATE user SET user_name = ?, password=?, gender = ?, email = ?, birth = ?, tel = ?, address = ? WHERE user_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置七个参数
            pstmt.setString(1, users.getUser_name());
            pstmt.setString(2, users.getPassword());
            pstmt.setString(3, users.getGender());
            pstmt.setString(4, users.getEmail());
            pstmt.setString(5, users.getBirth());
            pstmt.setString(6, users.getTel());
            pstmt.setString(7, users.getAddress());
            pstmt.setInt(8, users.getUser_id());
            ret = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }

        return ret;
    }

    /**
     * 插入用户
     * @param users
     * @return
     */
    public int insertUsers(Users users) {

        int ret = 0;
        String sql = "INSERT INTO user(user_name, password, gender, email, birth, tel, address ) VALUES (?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置6个参数
            pstmt.setString(1, users.getUser_name());
            pstmt.setString(2, users.getPassword());
            pstmt.setString(3, users.getGender());
            pstmt.setString(4, users.getEmail());
            pstmt.setString(5, users.getBirth());
            pstmt.setString(6, users.getTel());
            pstmt.setString(7, users.getAddress());
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
     * @param username
     * @return
     */
    public Users selectByUsersname(String username) {
        String sql = "SELECT user_id, user_name, password, gender, email, birth, tel ,address FROM user WHERE user_name = ?";
        Users users = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置参数
            pstmt.setString(1, username);
            // 查询
            rs = pstmt.executeQuery();
            while (rs.next()) {
                users = new Users();
                users.setUser_id(rs.getInt("user_id"));
                users.setUser_name(rs.getString("user_name"));
                users.setPassword(rs.getString("password"));
                users.setPassword(rs.getString("gender"));
                users.setEmail(rs.getString("email"));
                users.setBirth(rs.getString("birth"));
                users.setTel(rs.getString("tel"));
                users.setAddress(rs.getString("address"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return users;
    }
}
