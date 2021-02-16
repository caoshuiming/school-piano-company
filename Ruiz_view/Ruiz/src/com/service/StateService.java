package com.service;

import com.dao.StateDao;

public class StateService {

    /**
     * 根据id查找所示含义
     * @param state_id
     * @return
     */
    public String getSignByID(int state_id) {
        return new StateDao().getSignByID(state_id);
    }
}
