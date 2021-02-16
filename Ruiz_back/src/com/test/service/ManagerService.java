package com.test.service;

import com.test.dao.ManagerDao;
import com.test.dao.UsersDao;
import com.test.pojo.Manager;
import com.test.pojo.Users;
import com.test.utils.MD5Utils;

import java.util.List;

/**
 * 处理业务
 */
public class ManagerService {

    /**
     * 用于登录。
     *
     * @param m_name
     * @param password
     * @return
     */
    public boolean login(String m_name, String password) {
        ManagerDao managerDao = new ManagerDao();
        // 密码需要MD5校验
        password = MD5Utils.stringToMD5(password);
        Manager manager = managerDao.selectUserByManagernameAndPassword(m_name, password);
        // 通过返回值，如果是空的说明用户名，密码错误，否则正确。
        if (manager != null) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 用于登录。
     *
     * @param m_name
     * @param password
     * @return
     */
    public Manager login1(String m_name, String password) {
        ManagerDao managerDao = new ManagerDao();
        // 密码需要MD5校验
        password = MD5Utils.stringToMD5(password);
        Manager manager = managerDao.selectUserByManagernameAndPassword(m_name, password);
//        System.out.println("name="+manager.getM_name()+"  pass"+manager.getPassword());
        return manager;
    }

    /**
     * 插入管理员。
     * @param manager
     * @return
     */
    public boolean addManager(Manager manager) {
        // 需要把密码进行MD5加密。
        String password = manager.getPassword();
        password = MD5Utils.stringToMD5(password);
        manager.setPassword(password);
        /////////////////////////
        ManagerDao managerDao = new ManagerDao();
        int ret = managerDao.insertManager(manager);
        return ret > 0 ? true : false;
    }

    /**
     * 查询管理员名是否被占用，管理员注册。
     * @param m_name
     * @return
     */
    public boolean checkManagernameIsHaving(String m_name) {
        Manager manager = new ManagerDao().selectByManagername(m_name);
        if(manager == null) {
            // 没被占用，可以用的。
            return true;
        }
        return false;
    }

    /**
     * 根据ID删除管理员
     *
     * @param id
     * @return
     */
    public boolean removeManagerById(int id) {
        ManagerDao managerDao = new ManagerDao();
        int ret = managerDao.deleteManagerById(id);
        return ret > 0 ? true : false;
    }

    /**
     * 按照ID查询管理员。
     *
     * @param id
     * @return
     */
    public Manager getManagerById(int id) {
        return new ManagerDao().selectManagerById(id);
    }

    /**
     * 更新管理员信息
     *
     * @param manager
     * @return
     */
    public boolean modifyManager(Manager manager) {
        ManagerDao managerDao = new ManagerDao();
        int ret = managerDao.updateManager(manager);
        return ret > 0 ? true : false;
    }

    /**
     * @return
     */
    public List<Manager> getAllManager() {
        return new ManagerDao().selectAllManager();
    }
}