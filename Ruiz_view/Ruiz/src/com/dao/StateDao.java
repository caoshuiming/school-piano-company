package com.dao;

import com.db.C3p0ConnectionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class StateDao {
private  static Logger logger= LoggerFactory.getLogger(StateDao.class);
    /**
     * 根据id查找所示含义
     * @param state_id
     * @return
     */
    public String getSignByID(int state_id){
        String sql = "select sign from state where state_id=?";
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String str = "";
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setInt(1, state_id);
            rs = pst.executeQuery();
            if (rs.next()){
                str = rs.getString(1);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pst, conn);
        }
        return str;
    }
}
