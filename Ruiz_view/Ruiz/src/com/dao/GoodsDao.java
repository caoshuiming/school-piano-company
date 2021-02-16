package com.dao;

import com.db.C3p0ConnectionFactory;
import com.db.DBUtils;
import com.pojo.Goods;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GoodsDao {
    private static Logger logger = LoggerFactory.getLogger(GoodsDao.class);

    /**
     * 用JSONUtils插入数据
     * 使用批处理
     * @return
     */
    public int[] insertByJSONUtils(List<Goods> goods){
        int[] ret = {};
        String sql = "INSERT INTO goods(goods_name,img_url,price,brand,category,stock,payed_num,description) VALUES(?,?,?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = DBUtils.getConnection();
            pst = conn.prepareStatement(sql);
            for (Goods good : goods) {
                if(good.getGoods_name().length()>0){
                    pst.setString(1, good.getGoods_name());
                    pst.setString(2, good.getImg_url());
                    pst.setFloat(3, good.getPrice());
                    pst.setString(4, good.getBrand());
                    pst.setString(5, good.getCategory());
                    pst.setInt(6, good.getStock());
                    pst.setInt(7, good.getPayed_num());
                    pst.setString(8, good.getDescription());
                    pst.addBatch();
                }
            }
            ret = pst.executeBatch();
        } catch (SQLException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            DBUtils.closeDBResource(null, pst, conn);
        }
        return ret;
    }

    /**
     * 通过查询关键字获取所有商品,用于查询结果页面的页数计算
     * @param searchkey
     * @param minprice
     * @param maxprice
     * @return
     */
    public List<Goods> getAllGoodsBySearchkey(String searchkey, int minprice, int maxprice) {
        List<Goods> list = new ArrayList<Goods>();
        String sql = "SELECT goods_id,goods_name, img_url, price, brand,category, stock, payed_num,description FROM goods WHERE goods_name LIKE ? AND price>=? AND price<=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + searchkey + "%");
            pstmt.setInt(2, minprice);
            pstmt.setInt(3, maxprice);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Goods goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setBrand(rs.getString("brand"));
                goods.setCategory(rs.getString("category"));
                goods.setStock(rs.getInt("stock"));
                goods.setPayed_num(rs.getInt("payed_num"));
                goods.setDescription(rs.getString("description"));
                list.add(goods);
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return list;
    }


    /**
     * 通过查询关键字获取分页后的商品信息
     * @param start
     * @param per
     * @param searchkey
     * @param sort
     * @param minprice
     * @param maxprice
     * @return
     */
    public List<Goods> getGoodsByPageSearchkey(int start, int per, String searchkey, int sort, int minprice, int maxprice){
        List<Goods> list = new ArrayList<Goods>();
        String sql = "SELECT goods_id,goods_name, img_url, price, brand,category, stock, payed_num,description FROM goods WHERE goods_name LIKE ? AND price>=? AND price<=?";
        switch (sort){
            case 1:
                sql = sql + " ORDER BY price LIMIT ?,?";
                break;
            case 2:
                sql = sql + " ORDER BY price DESC LIMIT ?,?";
                break;
            case 3:
                sql = sql + " ORDER BY goods_id DESC LIMIT ?,?";
                break;
            case 4:
                sql = sql + " ORDER BY payed_num DESC LIMIT ?,?";
                break;
            default:
                sql = sql + " LIMIT ?,?";
                break;
        }
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + searchkey + "%");
            pstmt.setInt(2, minprice);
            pstmt.setInt(3, maxprice);
            pstmt.setInt(4, start);
            pstmt.setInt(5, per);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Goods goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setBrand(rs.getString("brand"));
                goods.setCategory(rs.getString("category"));
                goods.setStock(rs.getInt("stock"));
                goods.setPayed_num(rs.getInt("payed_num"));
                goods.setDescription(rs.getString("description"));
                list.add(goods);
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return list;
    }

    /**
     * 通过名字查询商品。
     *
     * @param name
     * @return
     */
    public static List<Goods> selectGoodsName(String name) {
        List<Goods> list = new ArrayList<Goods>();
        String sql = "SELECT goods_id,goods_name, img_url, price, brand,category, stock, payed_num,description FROM goods WHERE goods_name LIKE ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + name + "%");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Goods goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setBrand(rs.getString("brand"));
                goods.setCategory(rs.getString("category"));
                goods.setStock(rs.getInt("stock"));
                goods.setPayed_num(rs.getInt("payed_num"));
                goods.setDescription(rs.getString("description"));
                list.add(goods);
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return list;
    }

    /**
     * 通过ID查询商品。
     *
     * @param id
     * @return
     */
    public static Goods selectGoodsById(int id) {

        Goods goods = null;
        String sql = "SELECT goods_id,goods_name, img_url, price, brand,category, stock, payed_num,description FROM goods WHERE goods_id= ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setBrand(rs.getString("brand"));
                goods.setCategory(rs.getString("category"));
                goods.setStock(rs.getInt("stock"));
                goods.setPayed_num(rs.getInt("payed_num"));
                goods.setDescription(rs.getString("description"));
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return goods;
    }

    /**
     * 插入商品
     */
    public static int insertGoods(Goods goods){
        int ret=0;
        String sql = "INSERT INTO goods(goods_id,goods_name, img_url, price, brand,category, stock, payed_num,description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置6个参数
            pstmt.setInt(1, goods.getGoods_id());
            pstmt.setString(2, goods.getGoods_name());
            pstmt.setString(3, goods.getImg_url());
            pstmt.setFloat(4, goods.getPrice());
            pstmt.setString(5, goods.getBrand());
            pstmt.setString(6, goods.getCategory());
            pstmt.setInt(7,goods.getStock());
            pstmt.setInt(8,goods.getPayed_num());
            pstmt.setString(9,goods.getDescription());
            ret = pstmt.executeUpdate();
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, pstmt, conn);
        }
        System.out.println("底层插入成功");
        return ret;
    }

    /**
     * 通过关键字查询，用于搜索框的自动补全
     */
    public static List<String> selectGoodsNameByKeyWords(String keywords){
        List<String> list = new ArrayList<String>();
        String sql = "SELECT goods_name FROM goods WHERE goods_name LIKE ? LIMIT 0, 10";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keywords + "%");
            rs = pstmt.executeQuery();
            while (rs.next()) {

                list.add(rs.getString("goods_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return list;
    }

    /**
     * 获取所有的商品
     */
    public static List<Goods> selectAll(){
        List<Goods> list=new ArrayList<Goods>();
        String sql = "SELECT goods_id,goods_name, img_url, price, brand,category, stock, payed_num,description FROM goods";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Goods goods=null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                goods=new Goods();
                goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setBrand(rs.getString("brand"));
                goods.setCategory(rs.getString("category"));
                goods.setStock(rs.getInt("stock"));
                goods.setPayed_num(rs.getInt("payed_num"));
                goods.setDescription(rs.getString("description"));
                list.add(goods);
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }
        return list;
    }




    /**
     * 获取所有商品信息，用于分页时计算页数,根据价格筛选
     * @return
     */
    public List<Goods> getAllGoods(int minprice, int maxprice){
        List<Goods> list = new ArrayList<Goods>();
        String sql = "SELECT goods_id,goods_name,img_url,price,brand,category,stock,payed_num,description FROM goods WHERE price>=? AND price<=?";
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setInt(1, minprice);
            pst.setInt(2, maxprice);
            rs = pst.executeQuery();
            while(rs.next()){
                Goods goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setBrand(rs.getString("brand"));
                goods.setCategory(rs.getString("category"));
                goods.setStock(rs.getInt("stock"));
                goods.setPayed_num(rs.getInt("payed_num"));
                goods.setDescription(rs.getString("description"));
                list.add(goods);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pst, conn);
        }
        return list;
    }


    /**
     * 获取所有商品信息(分类by品牌)
     * @return
     */
    public List<Goods> getAllGoodsByBrand(String brand, int minprice, int maxprice){
        List<Goods> list = new ArrayList<Goods>();
        String sql = "SELECT goods_id,goods_name,img_url,price,brand,category,stock,payed_num,description FROM goods WHERE brand=? AND price>=? AND price<=?";
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1, brand);
            pst.setInt(2, minprice);
            pst.setInt(3, maxprice);
            rs = pst.executeQuery();
            while(rs.next()){
                Goods goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setBrand(rs.getString("brand"));
                goods.setCategory(rs.getString("category"));
                goods.setStock(rs.getInt("stock"));
                goods.setPayed_num(rs.getInt("payed_num"));
                goods.setDescription(rs.getString("description"));
                list.add(goods);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pst, conn);
        }
        return list;
    }

    /**
     * 获取所有商品信息(分类by类别)
     * @return
     */
    public List<Goods> getAllGoodsByCategory(String category, int minprice, int maxprice){
        List<Goods> list = new ArrayList<Goods>();
        String sql = "SELECT goods_id,goods_name,img_url,price,brand,category,stock,payed_num,description FROM goods WHERE category=? AND price>=? AND price<=?";
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1, category);
            pst.setInt(2, minprice);
            pst.setInt(3, maxprice);
            rs = pst.executeQuery();
            while(rs.next()){
                Goods goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setBrand(rs.getString("brand"));
                goods.setCategory(rs.getString("category"));
                goods.setStock(rs.getInt("stock"));
                goods.setPayed_num(rs.getInt("payed_num"));
                goods.setDescription(rs.getString("description"));
                list.add(goods);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pst, conn);
        }
        return list;
    }


    /**
     * 获取所有商品信息(分类by类别，品牌)
     * @return
     */
    public List<Goods> getAllGoodsByCategoryBrand(String category, String brand, int minprice, int maxprice){
        List<Goods> list = new ArrayList<Goods>();
        String sql = "SELECT goods_id,goods_name,img_url,price,brand,category,stock,payed_num,description FROM goods WHERE category=? AND brand=? AND price>=? AND price<=?";
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1, category);
            pst.setString(2, brand);
            pst.setInt(3, minprice);
            pst.setInt(4, maxprice);
            rs = pst.executeQuery();
            while(rs.next()){
                Goods goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setBrand(rs.getString("brand"));
                goods.setCategory(rs.getString("category"));
                goods.setStock(rs.getInt("stock"));
                goods.setPayed_num(rs.getInt("payed_num"));
                goods.setDescription(rs.getString("description"));
                list.add(goods);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pst, conn);
        }
        return list;
    }



    /**
     * 按页码获取商品信息(不分类)
     * @param start 查询起始点
     * @param per 一次查多少条数据
     * @return
     */
    public List<Goods> getGoodsByPage(int start, int per, int sort, int minprice, int maxprice) {
        List<Goods> list = new ArrayList<Goods>();
        String sql = "SELECT goods_id,goods_name,img_url,price,brand,category,stock,payed_num,description FROM goods WHERE price>=? AND price<=?";
        switch (sort){
            case 1:
                sql = sql + " ORDER BY price LIMIT ?,?";
                break;
            case 2:
                sql = sql + " ORDER BY price DESC LIMIT ?,?";
                break;
            case 3:
                sql = sql + " ORDER BY goods_id DESC LIMIT ?,?";
                break;
            case 4:
                sql = sql + " ORDER BY payed_num DESC LIMIT ?,?";
                break;
            default:
                sql = sql + " LIMIT ?,?";
                break;
        }
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setInt(1, minprice);
            pst.setInt(2, maxprice);
            pst.setInt(3, start);
            pst.setInt(4, per);
            rs = pst.executeQuery();
            while(rs.next()){
                Goods goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setBrand(rs.getString("brand"));
                goods.setCategory(rs.getString("category"));
                goods.setStock(rs.getInt("stock"));
                goods.setPayed_num(rs.getInt("payed_num"));
                goods.setDescription(rs.getString("description"));
                list.add(goods);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pst, conn);
        }
        return list;
    }


    /**
     * 按页码获取商品信息(分类by类别和品牌)
     * @param start
     * @param per
     * @param brand
     * @param category
     * @return
     */
    public List<Goods> getGoodsByPageBrandCategory(int start, int per, String brand, String category, int sort, int minprice, int maxprice) {
        List<Goods> list = new ArrayList<Goods>();
        String sql = "SELECT goods_id,goods_name,img_url,price,brand,category,stock,payed_num,description FROM goods WHERE brand=? AND category=? AND price>=? AND price<=?";
        switch (sort){
            case 1:
                sql = sql + " ORDER BY price LIMIT ?,?";
                break;
            case 2:
                sql = sql + " ORDER BY price DESC LIMIT ?,?";
                break;
            case 3:
                sql = sql + " ORDER BY goods_id DESC LIMIT ?,?";
                break;
            case 4:
                sql = sql + " ORDER BY payed_num DESC LIMIT ?,?";
                break;
            default:
                sql = sql + " LIMIT ?,?";
                break;
        }
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1, brand);
            pst.setString(2, category);
            pst.setInt(3, minprice);
            pst.setInt(4, maxprice);
            pst.setInt(5, start);
            pst.setInt(6, per);
            rs = pst.executeQuery();
            while(rs.next()){
                Goods goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setBrand(rs.getString("brand"));
                goods.setCategory(rs.getString("category"));
                goods.setStock(rs.getInt("stock"));
                goods.setPayed_num(rs.getInt("payed_num"));
                goods.setDescription(rs.getString("description"));
                list.add(goods);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pst, conn);
        }
        return list;
    }



    /**
     * 按页码获取商品信息(分类by类别)
     * @param start
     * @param per
     * @param category
     * @return
     */
    public List<Goods> getGoodsByPageCategory(int start, int per, String category, int sort, int minprice, int maxprice) {
        List<Goods> list = new ArrayList<Goods>();
        String sql = "SELECT goods_id,goods_name,img_url,price,brand,category,stock,payed_num,description FROM goods WHERE category=? AND price>=? AND price<=?";
        switch (sort){
            case 1:
                sql = sql + " ORDER BY price LIMIT ?,?";
                break;
            case 2:
                sql = sql + " ORDER BY price DESC LIMIT ?,?";
                break;
            case 3:
                sql = sql + " ORDER BY goods_id DESC LIMIT ?,?";
                break;
            case 4:
                sql = sql + " ORDER BY payed_num DESC LIMIT ?,?";
                break;
            default:
                sql = sql + " LIMIT ?,?";
                break;
        }
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1, category);
            pst.setInt(2, minprice);
            pst.setInt(3, maxprice);
            pst.setInt(4, start);
            pst.setInt(5, per);
            rs = pst.executeQuery();
            while(rs.next()){
                Goods goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setBrand(rs.getString("brand"));
                goods.setCategory(rs.getString("category"));
                goods.setStock(rs.getInt("stock"));
                goods.setPayed_num(rs.getInt("payed_num"));
                goods.setDescription(rs.getString("description"));
                list.add(goods);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pst, conn);
        }
        return list;
    }



    /**
     * 按页码获取商品信息(分类by品牌)
     * @param start
     * @param per
     * @param brand
     * @return
     */
    public List<Goods> getGoodsByPageBrand(int start, int per, String brand, int sort, int minprice, int maxprice) {
        List<Goods> list = new ArrayList<Goods>();
        String sql = "SELECT goods_id,goods_name,img_url,price,brand,category,stock,payed_num,description FROM goods WHERE brand=? AND price>=? AND price<=?";
        switch (sort){
            case 1:
                sql = sql + " ORDER BY price LIMIT ?,?";
                break;
            case 2:
                sql = sql + " ORDER BY price DESC LIMIT ?,?";
                break;
            case 3:
                sql = sql + " ORDER BY goods_id DESC LIMIT ?,?";
                break;
            case 4:
                sql = sql + " ORDER BY payed_num DESC LIMIT ?,?";
                break;
            default:
                sql = sql + " LIMIT ?,?";
                break;
        }
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1, brand);
            pst.setInt(2, minprice);
            pst.setInt(3, maxprice);
            pst.setInt(4, start);
            pst.setInt(5, per);
            rs = pst.executeQuery();
            while(rs.next()){
                Goods goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setBrand(rs.getString("brand"));
                goods.setCategory(rs.getString("category"));
                goods.setStock(rs.getInt("stock"));
                goods.setPayed_num(rs.getInt("payed_num"));
                goods.setDescription(rs.getString("description"));
                list.add(goods);
            }
        } catch (SQLException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(rs, pst, conn);
        }
        return list;
    }

    /**
     * 根据用户ID获取商品信息，
     */
    public static List<Goods> selectGoodsByUser_Id(int user_id) {
        List<Goods> list=new ArrayList<Goods>();

        String sql = "select goods.goods_id, goods_name, img_url, price from goods left join cart on goods.goods_id=cart.goods_id WHERE cart.user_id=? ;";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置参数
            pstmt.setInt(1, user_id);
            // 查询
            rs = pstmt.executeQuery();
            // 循环迭代
            while (rs.next()) {
                Goods  goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                list.add(goods);
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            // 关闭资源
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }
        return list;
    }


    /**
     * 根据用户ID获取心愿单信息
     */

    public static List<Goods> selectWishlistByUser_Id(int user_id) {
        List<Goods> list=new ArrayList<Goods>();

        String sql = "select goods.goods_id, goods_name, img_url, price,stock from goods left join wishlist on goods.goods_id=wishlist.goods_id WHERE wishlist.user_id=? ;";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            pstmt = conn.prepareStatement(sql);
            // 设置参数
            pstmt.setInt(1, user_id);
            // 查询
            rs = pstmt.executeQuery();
            // 循环迭代
            while (rs.next()) {
                Goods  goods = new Goods();
                goods.setGoods_id(rs.getInt("goods_id"));
                goods.setGoods_name(rs.getString("goods_name"));
                goods.setImg_url(rs.getString("img_url"));
                goods.setPrice(rs.getFloat("price"));
                goods.setStock(rs.getInt("stock"));
                list.add(goods);

            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        } finally {
            // 关闭资源
            C3p0ConnectionFactory.closeDBResource(rs, pstmt, conn);
        }

        return list;
    }


}
