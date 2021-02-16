package com.service;

import com.dao.GoodsDao;
import com.db.C3p0ConnectionFactory;
import com.pojo.Goods;

import java.sql.Connection;
import java.util.List;

public class GoodsService {


    /**
     * 获取所有商品信息,用于分页的页数计算
     * @return
     */
    public List<Goods> getAllGoods(int minprice, int maxprice){
        return new GoodsDao().getAllGoods(minprice, maxprice);
    }

    /**
     * 获取所有商品信息(分类by类别)
     * @return
     */
    public List<Goods> getAllGoodsByCategory(String category, int minprice, int maxprice){
        return new GoodsDao().getAllGoodsByCategory(category, minprice, maxprice);
    }


    /**
     * 获取所有商品信息(分类by品牌)
     * @return
     */
    public List<Goods> getAllGoodsByBrand(String brand, int minprice, int maxprice){
        return new GoodsDao().getAllGoodsByBrand(brand, minprice, maxprice);
    }


    /**
     * 获取所有商品信息(分类by类别，品牌)
     * @return
     */
    public List<Goods> getAllGoodsByCategoryBrand(String category, String brand, int minprice, int maxprice){
        return new GoodsDao().getAllGoodsByCategoryBrand(category, brand, minprice, maxprice);
    }





    /**
     * 通过名字查询商品。
     *
     * @param searchkey
     * @return
     */
    public List<Goods> getAllGoodsBySearchkey(String searchkey, int minprice, int maxprice) {
        return  new GoodsDao().getAllGoodsBySearchkey(searchkey, minprice, maxprice);
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
        return new GoodsDao().getGoodsByPageSearchkey(start, per, searchkey, sort, minprice, maxprice);
    }

    /**
     *通过商品ID获取商品
     */
    public  static Goods getGoodsByID(Integer id){
        return  GoodsDao.selectGoodsById(id);
    }

    /**
     *通过关键字查询，用于搜索框的自动补全
     */
    public static List<String> getNames(String keywords){
        return GoodsDao.selectGoodsNameByKeyWords(keywords);
    }


    /**
     * 获取所有的商品
     */
    public static List<Goods> getAll(){
        return GoodsDao.selectAll();
    }

    /**
     * 根据用户ID获取商品
     */
    public  static List<Goods> getGoodsByUserID(Integer user_id){
        return GoodsDao.selectGoodsByUser_Id(user_id);
    }

    /**
     * 批量插入数据
     */
    public static boolean addGoodsBatch(List<String> lines){
        boolean bool = true;
        Connection conn = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            // 循环遍历list
            for (String line : lines) {
                // 每行的文件格式： 陈小飞1,男,190.0,22,1998-06-11,17777777777
                // 我们需要安装","逗号切分
                System.out.println(line);
                String fileds[] = line.split(",",9);
                // 判断数据是否合法：数组不能为空，并且长度是：6
                if (fileds != null && fileds.length == 9) {
                    Goods goods = new Goods();
                    int id =Integer.parseInt(fileds[0]);
                    String name = fileds[1];
                    String imgurl = fileds[2];
                    float price= Float.parseFloat(fileds[3]);
                    String brand = fileds[4];
                    String category = fileds[5];
                    int stock=Integer.parseInt(fileds[6]);
                    int paynum=Integer.parseInt(fileds[7]);
                    String des=fileds[8];
                    goods.setGoods_id(id);
                    goods.setGoods_name(name);
                    goods.setImg_url(imgurl);
                    goods.setPrice(price);
                    goods.setBrand(brand);
                    goods.setCategory(category);
                    goods.setStock(stock);
                    goods.setPayed_num(paynum);
                    goods.setDescription(des);
                    // 调用DAO
                    GoodsDao.insertGoods(goods);
                }else {
                    System.out.println(fileds == null);
                    System.out.println(fileds.length);
                    //System.out.println("文件为空");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, null, conn);
        }
        System.out.println("业务层添加成功");
        return bool;
    }


    /**
     * 按页码获取商品信息
     * @param page
     * @return
     */
    public List<Goods> getGoodsByPage(int page, int per, int sort, int minprice, int maxprice){
        return new GoodsDao().getGoodsByPage(per * page, per, sort, minprice, maxprice);
    }

    /**
     * 按页码获取商品信息(分类by类别品牌)
     * @param page
     * @param per
     * @param brand
     * @param category
     * @return
     */
    public List<Goods> getGoodsByPageBrandCategory(int page, int per, String brand, String category, int sort, int minprice, int maxprice) {
        return new GoodsDao().getGoodsByPageBrandCategory(per * page, per, brand, category, sort, minprice, maxprice);
    }


    /**
     * 按页码获取商品信息(分类by类别)
     * @param page
     * @param per
     * @param category
     * @return
     */
    public List<Goods> getGoodsByPageCategory(int page, int per, String category, int sort, int minprice, int maxprice) {
        return new GoodsDao().getGoodsByPageCategory(per * page, per, category, sort, minprice, maxprice);
    }



    /**
     * 按页码获取商品信息(分类by品牌)
     * @param page
     * @param per
     * @param brand
     * @return
     */
    public List<Goods> getGoodsByPageBrand(int page, int per, String brand, int sort, int minprice, int maxprice) {
        return new GoodsDao().getGoodsByPageBrand(per * page, per, brand, sort, minprice, maxprice);
    }

    /**
     * //根据用户id查找心愿清单商品信息
     */

    public List<Goods> selectWishlistByUser_Id(int user_id) {
        return  new GoodsDao().selectWishlistByUser_Id(user_id);
    }

}
