package com.xg.dao;

import com.xg.pojo.Sensor;
import com.xg.pojo.SensorExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SensorMapper {
    int countByExample(SensorExample example);

    int deleteByExample(SensorExample example);

    int insert(Sensor record);

    int insertSelective(Sensor record);

    List<Sensor> selectByExample(SensorExample example);

    int updateByExampleSelective(@Param("record") Sensor record, @Param("example") SensorExample example);

    int updateByExample(@Param("record") Sensor record, @Param("example") SensorExample example);

    List<Sensor> listAll();

    void deleteByPrimaryKey(Long id);
}