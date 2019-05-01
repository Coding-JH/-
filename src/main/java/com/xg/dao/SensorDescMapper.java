package com.xg.dao;

import com.xg.pojo.SensorDesc;
import com.xg.pojo.SensorDescExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SensorDescMapper {
    int countByExample(SensorDescExample example);

    int deleteByExample(SensorDescExample example);

    int insert(SensorDesc record);

    int insertSelective(SensorDesc record);

    List<SensorDesc> selectByExample(SensorDescExample example);

    int updateByExampleSelective(@Param("record") SensorDesc record, @Param("example") SensorDescExample example);

    int updateByExample(@Param("record") SensorDesc record, @Param("example") SensorDescExample example);

    void deleteByPrimaryKey(Long id);
}