package com.test.dao;

import com.mchange.v2.c3p0.C3P0ProxyConnection;
import com.test.db.C3p0ConnectionFactory;
import com.test.pojo.Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 商品处理
 */
public class GoodsDao {

    /**
     * 分页查询全部商品
     * @param start
     * @param pageSize
     * @return
     */
    public List<Goods> selectGoodsByPage(int start, int pageSize ){

        List<Goods> goodsList = new ArrayList<Goods>();
        String sql = "SELECT goods_id,goods_name,img_url,price,brand,category,stock,payed_num,description FROM goods LIMIT ?, ?;";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = C3p0ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1,start);
            preparedStatement.setInt(2,pageSize);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Goods goods = new Goods();
                goods.setGoods_id(resultSet.getInt("goods_id"));
                goods.setGoods_name(resultSet.getString("goods_name"));
                goods.setImg_url(resultSet.getString("img_url"));
                goods.setPrice(resultSet.getFloat("price"));
                goods.setBrand(resultSet.getString("brand"));
                goods.setCategory(resultSet.getString("category"));
                goods.setStock(resultSet.getInt("stock"));
                goods.setPayed_num(resultSet.getInt("payed_num"));
                goods.setDescription(resultSet.getString("description"));
                goodsList.add(goods);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(resultSet,preparedStatement,connection);
        }
        return goodsList;
    }

    /**
     * 查询所有商品总库存数
     * @return
     */
    public int selectGoodsCounts(){

        int counts = 0;
        String sql ="SELECT COUNT(goods_id) cnt FROM goods;";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = C3p0ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                counts = resultSet.getInt("cnt");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(resultSet,preparedStatement,connection);
        }
        return counts;
    }

    /**
     * 添加商品
     * @param goods
     * @return
     */
    public int insertGoods(Goods goods){
        int result = 0;
        String sql = "INSERT INTO goods (goods_name,img_url,price,brand,category,stock,payed_num,description) VALUES(?,?,?,?,?,?,0,?);";
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = C3p0ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1,goods.getGoods_name());
            preparedStatement.setString(2,goods.getImg_url());
            preparedStatement.setFloat(3,goods.getPrice());
            preparedStatement.setString(4,goods.getBrand());
            preparedStatement.setString(5,goods.getCategory());
            preparedStatement.setInt(6,goods.getStock());
            preparedStatement.setString(7,goods.getDescription());

            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null,preparedStatement,connection);
        }
        return result;
    }

    /**
     * 根据id删除goods
     * @param goods_id
     * @return
     */
    public int deleteGoodsById(int goods_id){
        int result = 0;
        String sql = "DELETE FROM goods WHERE goods_id = ?;";
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = C3p0ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,goods_id);

            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null,preparedStatement,connection);
        }
        return result;
    }


    /**
     * 批量删除
     * @param data
     * @return
     */
    public int deleteBatchGoods(String data){
        int result = 0;
        String sql = "DELETE FROM goods WHERE goods_id IN("+data+");";
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = C3p0ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null,preparedStatement,connection);
        }
        return result;
    }

    /**
     * 根据id查询单个goods
     * @param id
     * @return
     */
    public Goods selectGoodsById(int id){
        Goods goods = null;
        String sql = "SELECT goods_id,goods_name,img_url,price,brand,category,stock,payed_num,description FROM goods WHERE goods_id = ?;";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = C3p0ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                goods = new Goods();
                goods.setGoods_id(resultSet.getInt("goods_id"));
                goods.setGoods_name(resultSet.getString("goods_name"));
                goods.setImg_url(resultSet.getString("img_url"));
                goods.setPrice(resultSet.getFloat("price"));
                goods.setBrand(resultSet.getString("brand"));
                goods.setCategory(resultSet.getString("category"));
                goods.setStock(resultSet.getInt("stock"));
                goods.setPayed_num(resultSet.getInt("payed_num"));
                goods.setDescription(resultSet.getString("description"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(resultSet,preparedStatement,connection);
        }
        return goods;
    }

    /**
     * 修改goods信息
     * @param goods
     * @return
     */
    public int updateGoods(Goods goods){

        int result = 0;
        String sql = "UPDATE goods SET goods_name = ?,img_url = ?,price = ?,brand = ?,category = ?,stock = ?,description = ? WHERE goods_id  = ?;";
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = C3p0ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1,goods.getGoods_name());
            preparedStatement.setString(2,goods.getImg_url());
            preparedStatement.setFloat(3,goods.getPrice());
            preparedStatement.setString(4,goods.getBrand());
            preparedStatement.setString(5,goods.getCategory());
            preparedStatement.setInt(6,goods.getStock());
            preparedStatement.setString(7,goods.getDescription());
            preparedStatement.setInt(8,goods.getGoods_id());

            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null,preparedStatement,connection);
        }
        return result;

    }

}
