package com.sevlet;


import com.pojo.Goods;
import com.pojo.Pagination;
import com.service.GoodsService;
import com.utils.ConfigFactory;
import com.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GoodsListServlet", urlPatterns = {"/goodslist.action"})
public class GoodsListServlet extends HttpServlet {

    private static Logger logger = LoggerFactory.getLogger(GoodsListServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        goodsList(req, resp);
    }

    /**
     * 获取所有的商品并分页
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    private void goodsList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String _page = req.getParameter("page");
        String brand = req.getParameter("brand");
        String category = req.getParameter("category");
        String _sort = req.getParameter("sort");

        String searchkey = req.getParameter("searchkey");

        // 价格筛选
        String _minprice = req.getParameter("minprice");
        String _maxprice = req.getParameter("maxprice");
        int minprice = StringUtils.isEmpty(_minprice) ? 0 : Integer.parseInt(_minprice);
        int maxprice = StringUtils.isEmpty(_maxprice) ? 1600000 : Integer.parseInt(_maxprice);

        // 商品列表默认第一页
        int page = StringUtils.isEmpty(_page) ? 0 : Integer.parseInt(_page);

        // 默认不排序,0 默认排序 1 价格升序 2 价格降序 3 时间降序
        int sort = StringUtils.isEmpty(_sort) ? 0 : Integer.parseInt(_sort);

        // 获取每一页显示的商品数量,默认12,由管理员在config.xml设置
        int per = ConfigFactory.getInt("common.per", 12);

        // 计算页数
        List<Goods> all;
        if(!StringUtils.isEmpty(searchkey)){
            all = new GoodsService().getAllGoodsBySearchkey(searchkey, minprice, maxprice);
        }else {
            if (StringUtils.isEmpty(brand) && StringUtils.isEmpty(category)) {
                all = new GoodsService().getAllGoods(minprice, maxprice);
//            logger.info("1============" + all.size());
            } else if (StringUtils.isEmpty(brand) && !StringUtils.isEmpty(category)) {
                all = new GoodsService().getAllGoodsByCategory(category, minprice, maxprice);
//            logger.info("2============" + all.size());
            } else if (!StringUtils.isEmpty(brand) && StringUtils.isEmpty(category)) {
                all = new GoodsService().getAllGoodsByBrand(brand, minprice, maxprice);
//            logger.info("3============" + all.size());
            } else {
                all = new GoodsService().getAllGoodsByCategoryBrand(category, brand, minprice, maxprice);
//            logger.info("4============" + all.size());
            }
        }

        int pages = all.size() / per;

        // 数据异常简单处理
        if(page < 0){
            page = 0;
        }
        if(page > pages){
            page = pages - 1;
        }

        // 查询结果
        List<Goods> list = new ArrayList<Goods>();
        if(!StringUtils.isEmpty(searchkey)){
            list = new GoodsService().getGoodsByPageSearchkey(page, per, searchkey, sort, minprice, maxprice);
        }else {
            if (StringUtils.isEmpty(brand) && StringUtils.isEmpty(category)) {
                list = new GoodsService().getGoodsByPage(page, per, sort, minprice, maxprice);
                //logger.info("1============" + list.size());
            } else if (StringUtils.isEmpty(brand) && !StringUtils.isEmpty(category)) {
                list = new GoodsService().getGoodsByPageCategory(page, per, category, sort, minprice, maxprice);
                //logger.info("2============" + list.size());
            } else if (!StringUtils.isEmpty(brand) && StringUtils.isEmpty(category)) {
                list = new GoodsService().getGoodsByPageBrand(page, per, brand, sort, minprice, maxprice);
                //logger.info("3============" + list.size());
            } else {
                list = new GoodsService().getGoodsByPageBrandCategory(page, per, brand, category, sort, minprice, maxprice);
                //logger.info("4============" + list.size());
            }
        }

        Pagination pagination = new Pagination();
        pagination.setCounts(all.size());
        pagination.setPageSize(per);
        pagination.setPages(pages);
        pagination.setPageNo(page);
        pagination.setFirstPage(page == 0);
        pagination.setLastPage(page == pages);
        pagination.setResult(list);

        // 日志
        // logger.info("传过去的页码编号" + pagination.getPageNo());

        req.setAttribute("pagination", pagination);
        req.setAttribute("category", category);
        req.setAttribute("brand", brand);
        req.setAttribute("sort", sort);
        req.setAttribute("minprice", minprice);
        req.setAttribute("maxprice", maxprice);
        req.setAttribute("searchkey", searchkey);
        req.getRequestDispatcher("shop.jsp").forward(req, resp);
    }

}
