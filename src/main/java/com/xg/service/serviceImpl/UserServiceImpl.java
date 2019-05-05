package com.xg.service.serviceImpl;

import com.xg.dao.UserMapper;
import com.xg.pojo.User;
import com.xg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 侯景瀚 on 2019/4/27.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;
    @Override
    public boolean checkUser(String name) {
        long count = userMapper.countByName(name);
        return count == 0;
    }

    @Override
    public User loginUser(String name) {
        return userMapper.findUserByname(name);
    }

    @Override
    public void insert(User user) {
        userMapper.insert(user);
    }
}
