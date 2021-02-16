package com.service;


import com.dao.UserDao;
import com.pojo.User;
import com.utils.MD5Utils;

/**
 * 处理业务
 */
public class UserService {


    /**
     * 用于登录。
     *
     * @param username
     * @param password
     * @return
     */
    public static User login(String username, String password) {
        UserDao userDao = new UserDao();
        // 密码需要MD5校验
        password = MD5Utils.stringToMD5(password);
        User user = userDao.selectUserByUsernameAndPassword(username, password);
        return user;
    }

    /**
     * 插入用户。
     * @param user
     * @return
     */
    public static boolean addUser(User user) {
        // 需要把密码进行MD5加密。
        String password = user.getPassword();
        password = MD5Utils.stringToMD5(password);
        user.setPassword(password);
        /////////////////////////
        UserDao userDao = new UserDao();
        int ret = userDao.insertUser(user);
        return ret > 0 ? true : false;
    }

    /**
     * 查询用户是否被占用，用户注册。
     * @param username
     * @return
     */
    public static boolean checkUsernameIsHaving(String username) {
        User user = new UserDao().selectByUsername(username);
        if(user == null) {
            // 没被占用，可以用的。
            return true;
        }
        return false;
    }

    /**
     * 修改用户
     */
    public static boolean updateInfo(User user){
        // 需要把密码进行MD5加密。
        String password = user.getPassword();
        password = MD5Utils.stringToMD5(password);
        user.setPassword(password);
        int ret = UserDao.updateInfoByUserId(user);
        return ret > 0 ? true : false;
    }

}