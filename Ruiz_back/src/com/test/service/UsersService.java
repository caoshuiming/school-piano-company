package com.test.service;

import com.test.dao.GoodsDao;
import com.test.dao.UsersDao;
import com.test.dao.UsersDaoHigh;
import com.test.db.C3p0ConnectionFactory;
import com.test.pojo.Goods;
import com.test.pojo.Pagination;
import com.test.pojo.Users;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class UsersService {

    /**
     * @return
     */
    public List<Users> getAllUsers() {
        return new UsersDao().selectAllUsers();
    }

    /**
     * 获得库中user总数
     * @return
     */
    public int getUsersCounts(){
        int count  = new UsersDao().selectUsersCounts();
        return count ;
    }

    /**
     * 根据ID删除用户
     *
     * @param id
     * @return
     */
    public boolean removeUsersById(int id) {
        UsersDao usersDao = new UsersDao();
        int ret = usersDao.deleteUsersById(id);
        return ret > 0 ? true : false;
    }

    /**
     * 按照ID查询用户。
     *
     * @param id
     * @return
     */
    public Users getUsersById(int id) {
        return new UsersDao().selectUsersById(id);
    }

    /**
     * 更新用户信息
     *
     * @param users
     * @return
     */
    public boolean modifyUsers(Users users) {
        UsersDao usersDao = new UsersDao();
        int ret = usersDao.updateUsers(users);
        return ret > 0 ? true : false;
    }

    /**
     * 查询用户是否被占用，用户注册。
     * @param username
     * @return
     */
    public boolean checkUsersnameIsHaving(String username) {
        Users users = new UsersDao().selectByUsersname(username);
        if(users == null) {
            // 没被占用，可以用的。
            return true;
        }
        return false;
    }

    /**
     * 插入用户信息
     *
     * @param users
     * @return
     */
    public boolean addUsers(Users users) {
        UsersDao usersDao = new UsersDao();
        int ret = usersDao.insertUsers(users);
        return ret > 0 ? true : false;
    }

    /**
     * 进行批量插入用户
     * 此方式有问题需要解决。
     *
     * @param lines
     * @return
     */
    public boolean addUsersBatch(List<String> lines) {

        long begin = System.currentTimeMillis();
        boolean bool = true;
        Connection conn = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            // 循环遍历list
            for (String line : lines) {
                // 每行的文件格式： 陈小飞1,男,190.0,22,1998-06-11,17777777777
                // 我们需要安装","逗号切分
                String fileds[] = line.split(",");
                // 判断数据是否合法：数组不能为空，并且长度是：6
                if (fileds != null && fileds.length == 7) {
                    Users users = new Users();
                    String user_name = fileds[0];
                    String password = fileds[1];
                    String gender = fileds[2];
                    String email = fileds[3];
                    String birth = fileds[4];
                    String tel = fileds[5];
                    String address=fileds[6];
                    users.setUser_name(user_name);
                    users.setPassword(password);
                    users.setGender(gender);
                    users.setEmail(email);
                    users.setBirth(birth);
                    users.setTel(tel);
                    users.setAddress(address);
                    // 调用DAO
                    UsersDao dao = new UsersDao();
                    dao.insertUsers(users);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, null, conn);
        }
        long end = System.currentTimeMillis();
        // 插入10000个学生耗时 7294 秒。
        System.out.println("批量上传用户耗时：" + (end - begin));

        return bool;
    }

    /**
     * 进行批量插入用户
     * 此方式有问题需要解决。
     *
     * @param lines
     * @return
     */
    public boolean addUsersBatch1(List<String> lines) {

        long begin = System.currentTimeMillis();
        boolean bool = true;
        List<Users> us= new ArrayList<Users>();
        // 循环遍历list
        for (String line : lines) {
            // 每行的文件格式： 陈小飞1,男,190.0,22,1998-06-11,17777777777
            // 我们需要安装","逗号切分
            String fileds[] = line.split(",");
            // 判断数据是否合法：数组不能为空，并且长度是：6
            if (fileds != null && fileds.length == 6) {
                Users users = new Users();
                String user_name = fileds[0];
                String password = fileds[1];
                String gender = fileds[2];
                String email = fileds[3];
                String birth = fileds[4];
                String tel = fileds[5];
                String address=fileds[6];
                users.setUser_name(user_name);
                users.setPassword(password);
                users.setGender(gender);
                users.setEmail(email);
                users.setBirth(birth);
                users.setTel(tel);
                users.setAddress(address);
                // 加入到list
                us.add(users);
            }
        }

        Connection conn = null;
        try {
            conn = C3p0ConnectionFactory.getConnection();
            // 调用批处理
            UsersDaoHigh dao = new UsersDaoHigh(conn);
            dao.insertUsersBatch(us);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            C3p0ConnectionFactory.closeDBResource(null, null, conn);
        }

        long end = System.currentTimeMillis();
        // 插入10000个学生耗时38秒。
        System.out.println("批量上传用户耗时：" + (end - begin));

        return bool;
    }

    /**
     * 数据库分页查询处理
     * @param pageNo
     * @param pageSize
     * @return
     */
    public com.test.pojo.Pagination getUsersByPage (int pageNo, int pageSize) {

        UsersDao usersDao = new UsersDao();

        int counts = usersDao.selectUsersCounts();
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

        List<Users> goodsList = usersDao.selectUsersByPage(pageNo*pageSize , pageSize);
        com.test.pojo.Pagination pagination = new Pagination();
        pagination.setPageSize(pageSize);
        pagination.setPageNo(pageNo);
        pagination.setCounts(counts);
        pagination.setPages(pages);
        pagination.setFirstPage(fistPage);
        pagination.setLastPage(lastPage);
        pagination.setResult(goodsList);

        return pagination;
    }
}