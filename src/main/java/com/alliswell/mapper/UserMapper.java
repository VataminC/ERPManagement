package com.alliswell.mapper;

import com.alliswell.pojo.User;

public interface UserMapper {
    /**
     * 根据用户名跟密码查找
     * @param user
     * @return
     */
    User selByUser(User user);

    /**
     * 通过用户id 查找
     * @param id
     * @return
     */
    User selById(int id);

    /**
     * 通过用户名查找
     * @param name
     * @return
     */
    User selByName(String name);

    /**
     *  插入一条数据并返回插入的条数
     * @param user
     * @return
     */
    int insUser(User user);
}
