package com.xg.service.serviceImpl;

import com.xg.dao.SensorDescMapper;
import com.xg.service.SensorDescService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 侯景瀚 on 2019/4/30.
 */
@Service
public class SensorDescServiceImpl extends RedisServiceImpl  implements SensorDescService {

    @Autowired
    SensorDescMapper sensorDescMapper;
}
