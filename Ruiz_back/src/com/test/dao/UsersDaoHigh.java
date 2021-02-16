package com.test.dao;

import com.test.db.C3p0ConnectionFactory;
import com.test.pojo.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

/**
 * JDBC 的一些高级玩法。
 */
public class UsersDaoHigh {

    private Connection conn;

    /**
     * 初始化DAO的时候就带一个数据库链接。
     * @param conn
     */
    public UsersDaoHigh(Connection conn) {
        this.conn = conn;
    }

    /**
     * 批量插入用户信息
     * @param us
     * @return
     */
    public int[] insertUsersBatch(List<Users> us) {

        int ret[] = null;
        String sql = "INSERT INTO user(user_name, password, gender, email, birth, tel, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            // 循环。
            for(Users users :us) {
                // 设置6个参数
                pstmt.setString(1, users.getUser_name());
                pstmt.setString(2, users.getPassword());
                pstmt.setString(3, users.getGender());
                pstmt.setString(4, users.getEmail());
                pstmt.setString(5, users.getBirth());
                pstmt.setString(6, users.getTel());
                pstmt.setString(7, users.getAddress());
                // 添加批处理
                pstmt.addBatch();
            }
            // 执行批处理
            pstmt.executeBatch();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, null);
        }

        return ret;
    }
}
