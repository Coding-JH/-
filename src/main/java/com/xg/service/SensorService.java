package com.xg.service;

import com.xg.pojo.Sensor;

import java.util.List;

/**
 * Created by 侯景瀚 on 2019/4/27.
 */
public interface SensorService {
    void insertSensor(Sensor sensor);

    List<Sensor> findAllSensor();

    void deleteSensor(Long id);

    List<Sensor> searchByName(String name);

}
