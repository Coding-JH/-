package com.xg.service.serviceImpl;

import com.xg.common.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

/**
 * Created by 侯景瀚 on 2019/3/31.
 */
public abstract class RedisServiceImpl {

    @Value("${ARTICLE_INFO_EXPIRE}")
    protected int tokenExpire;
    @Value("${ARTICLE_INFO_PRE}")
    protected String tokenKey;
    @Autowired
    protected RedisService redisService;

}
