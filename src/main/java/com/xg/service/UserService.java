package com.xg.service;

import com.xg.pojo.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {

    User loginUser(String name);

    void insert(User user);

    boolean checkUser(String userName);
}
