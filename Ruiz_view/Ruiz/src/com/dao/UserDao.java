package com.dao;


import com.db.C3p0ConnectionFactory;
import com.pojo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

/**
 * dao: data access object.
 */
public class UserDao {
    private  static Logger logger= LoggerFactory.getLogger(UserDao.class);

    /**
     * 根据ID查询用户。
     *
     * @param id
     * @return
     */

    public User selectUserById(int id) {

        User user = null;
        String sql = "SELECT user_id, user_name, password, gender,email,birth,tel,address FROM user WHERE user_id = ?";
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
                user = new User();
               user.setUser_id(rs.getInt("user_id"));
               user.setUser_name(rs.getString("user_name"));
               user.setPassword(rs.getString("password"));
               user.setGender(rs.getString("gender"));
               user.setEmail(rs.getString("email"));
               user.setBirth(rs.getString("birth"));
               user.setTel(rs.getString("tel"));
               user.setAddress(rs.getString("address"));
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            // 关闭资源
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return user;
    }

    /**
     * 通过用户名、密码查询用户信息，用于登录。
     * @param username
     * @param password
     * @return
     */
    public User selectUserByUsernameAndPassword(String username, String password) {

        String sql = "SELECT user_id, user_name, password, gender,email,birth,tel,address FROM user WHERE user_name = ? AND password = ?";
        User user = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置参数
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            // 查询
            rs = pstmt.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setUser_name(rs.getString("user_name"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setEmail(rs.getString("email"));
                user.setBirth(rs.getString("birth"));
                user.setTel(rs.getString("tel"));
                user.setAddress(rs.getString("address"));
            }
        } catch (Exception e) {

            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return user;
    }

    /**
     * 插入一个用户,用于注册
     *
     * @param user
     * @return
     */
    public int insertUser(User user) {

        int ret = 0;
        String sql = "INSERT INTO user( user_name, password, email) VALUES (?, ?, ?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUser_name());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            ret = pstmt.executeUpdate();
        } catch (Exception e) {

            logger.error(e.getMessage());
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
    public User selectByUsername(String username) {

        String sql = "SELECT user_id, user_name, password, gender,email,birth,tel,address FROM user WHERE user_name = ?";
        User user = null;
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
                user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setUser_name(rs.getString("user_name"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setEmail(rs.getString("email"));
                user.setBirth(rs.getString("birth"));
                user.setTel(rs.getString("tel"));
                user.setAddress(rs.getString("address"));
            }
        } catch (Exception e) {

            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return user;
    }

    /**
     * 根据用户ID修改用户信息
     */
    public static int  updateInfoByUserId(User user){
        int ret = 0;
        String sql = "update user set gender=?,user_name=?,email=?,password=?,birth=? where user_id=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getGender());
            pstmt.setString(2, user.getUser_name());
            pstmt.setString(3,user.getEmail());
            pstmt.setString(4, user.getPassword());
            pstmt.setString(5,user.getBirth());
            pstmt.setInt(6, user.getUser_id());
            ret = pstmt.executeUpdate();
        } catch (Exception e) {

            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }
        return ret;
    }
}