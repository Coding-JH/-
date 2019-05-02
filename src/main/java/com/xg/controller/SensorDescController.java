package com.xg.controller;

import com.alibaba.fastjson.JSON;
import com.xg.common.IDUtils;
import com.xg.common.ResultMap;
import com.xg.pojo.SensorDesc;
import com.xg.service.SensorDescService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * Created by 侯景瀚 on 2019/4/30.
 */
@RestController
@RequestMapping("/sensorDesc")
public class SensorDescController {
    @Autowired
    SensorDescService sensorDescService;

    @RequestMapping("/add")
    public ResultMap addSensorData(){  //温度的变化

        String res="22-111-88";
        String[] arr=res.split("-");
        ResultMap resultMap=new ResultMap();
        String data=JSON.toJSONString(arr);

        SensorDesc sensorDesc=new SensorDesc();
        sensorDesc.setNewdata(data);
        sensorDesc.setTime(new Date());
        sensorDesc.setId(IDUtils.genItemId());
        //sensorDescService.addData(data);
        return null;


    }





}
