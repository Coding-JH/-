package com.xg.service.serviceImpl;

import com.xg.dao.SensorDescMapper;
import com.xg.dao.SensorMapper;
import com.xg.pojo.Sensor;
import com.xg.service.SensorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 侯景瀚 on 2019/4/27.
 */
@Service
public class SensorServiceImpl implements SensorService  {

    @Autowired
    SensorMapper sensorMapper;
    @Autowired
    SensorDescMapper sensorDescMapper;
    @Override
    public void insertSensor(Sensor sensor) {
        sensorMapper.insertSelective(sensor);

    }

    @Override
    public List<Sensor> findAllSensor() {
        return sensorMapper.listAll();
    }

    @Override
    public void deleteSensor(Long id) {
        sensorMapper.deleteByPrimaryKey(id);
        sensorDescMapper.deleteByPrimaryKey(id);
    }
}
