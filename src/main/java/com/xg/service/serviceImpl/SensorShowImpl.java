package com.xg.service.serviceImpl;

import com.xg.dao.SensorShowMapper;
import com.xg.pojo.SensorShow;
import com.xg.service.SensorShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 侯景瀚 on 2019/4/29.
 */
@Service
public class SensorShowImpl implements SensorShowService {

    @Autowired
    SensorShowMapper sensorShowMapper;
    @Override
    public void insertSensorShow(SensorShow sensorShow) {
        sensorShowMapper.insertSelective(sensorShow);
    }
}
