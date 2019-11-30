package com.alliswell.service.impl;

import com.alliswell.mapper.UserMapper;
import com.alliswell.pojo.User;
import com.alliswell.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(User user) {
        return userMapper.selByUser(user);
    }
}
