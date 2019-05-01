package com.xg.dao;

import com.xg.pojo.SensorShow;
import com.xg.pojo.SensorShowExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SensorShowMapper {
    int countByExample(SensorShowExample example);

    int deleteByExample(SensorShowExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SensorShow record);

    int insertSelective(SensorShow record);

    List<SensorShow> selectByExample(SensorShowExample example);

    SensorShow selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SensorShow record, @Param("example") SensorShowExample example);

    int updateByExample(@Param("record") SensorShow record, @Param("example") SensorShowExample example);

    int updateByPrimaryKeySelective(SensorShow record);

    int updateByPrimaryKey(SensorShow record);
}