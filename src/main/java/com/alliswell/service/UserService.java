package com.alliswell.service;

import com.alliswell.pojo.User;

public interface UserService {
    User login(User user);

    User findUserByName(String name);

    int addUser(User user);
}
