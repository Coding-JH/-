package com.xg.controller;

import com.xg.common.ResultMap;
import com.xg.pojo.SensorDesc;
import com.xg.service.SensorDescService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 侯景瀚 on 2019/4/30.
 */
@Controller
@RequestMapping("SensorDesc")
public class SensorDescController {
    @Autowired
    SensorDescService sensorDescService;

    @RequestMapping("/add")
    public ResultMap addSensorData(SensorDesc sensorDesc){
        ResultMap resultMap=new ResultMap();


        return null;


    }





}
