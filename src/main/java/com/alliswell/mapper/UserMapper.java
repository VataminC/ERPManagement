package com.alliswell.mapper;

import com.alliswell.pojo.User;

public interface UserMapper {
    /**
     * 查询用户是否存在
     * @param user
     * @return
     */
    User selByUser(User user);

    User selById(int id);
}
