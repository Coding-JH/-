package com.xg.service;

import com.xg.pojo.Sensor;
import com.xg.pojo.SensorShow;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 侯景瀚 on 2019/4/29.
 */
@Service
public interface SensorShowService {
    void insertSensorShow(SensorShow sensorShow);

    List<Sensor> findAll();

    void updateSensorShow(SensorShow sensorShow);
}
