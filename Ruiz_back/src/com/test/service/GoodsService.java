package com.test.service;

import com.test.dao.GoodsDao;
import com.test.pojo.Goods;
import com.test.pojo.Pagination;

import java.util.List;

public class GoodsService {


    /**
     * 数据库分页查询处理
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getGoodsByPage (int pageNo, int pageSize) {

        GoodsDao goodsDao = new GoodsDao();

        int counts = goodsDao.selectGoodsCounts();
        int pages = counts % pageSize == 0 ? counts / pageSize : counts / pageSize + 1;

        boolean fistPage = pageNo == 0 ? true : false;
        boolean lastPage = false;

        if(pageNo == pages - 1) {
            lastPage = true;
        }

        // 如果页码大于总页数：页码就等于总页数。
        if(pageNo > pages) {
            pageNo = pages - 1;// 页码从0开始，所以减一。
        }

        List<Goods> goodsList = goodsDao.selectGoodsByPage(pageNo*pageSize , pageSize);
        Pagination pagination = new Pagination();
        pagination.setPageSize(pageSize);
        pagination.setPageNo(pageNo);
        pagination.setCounts(counts);
        pagination.setPages(pages);
        pagination.setFirstPage(fistPage);
        pagination.setLastPage(lastPage);
        pagination.setResult(goodsList);

        return pagination;
    }


    /**
     * 数据库添加物品
     * @param goods
     * @return
     */
    public boolean insertGoodsService(Goods goods){
        int result = new GoodsDao().insertGoods(goods);
        return result > 0 ? true : false;
    }

    /**
     * 通过id删除goods
     * @param goods_id
     * @return
     */
    public boolean deleteGoodsByIdService(int goods_id) {
        int result = new GoodsDao().deleteGoodsById(goods_id);
        return result > 0 ? true : false;
    }

    /**
     * 获得库中goods总数
     * @return
     */
    public int getGoodsCounts(){
        int count  = new GoodsDao().selectGoodsCounts();
        return count ;
    }

    /**
     * 根据id获取一个goods对象
     * @param id
     * @return
     */
    public Goods getGoodsById(int id) {
        return new GoodsDao().selectGoodsById(id);
    }

    /**
     * 修改goods信息
     * @param goods
     * @return
     */
    public boolean modifyGoods(Goods goods){
        return new GoodsDao().updateGoods(goods) > 0 ? true : false;
    }

    /**
     * 批量删除处理
     * @param data
     * @return
     */
    public int deleteBatchGoods(String data){
        return new GoodsDao().deleteBatchGoods(data);
    }

}
