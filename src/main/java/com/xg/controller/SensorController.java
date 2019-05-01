package com.xg.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xg.common.IDUtils;
import com.xg.common.ResultMap;
import com.xg.pojo.Sensor;
import com.xg.pojo.SensorShow;
import com.xg.service.SensorService;
import com.xg.service.SensorShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * Created by 侯景瀚 on 2019/4/27.
 */
@Controller
@RequestMapping("/sensor")
public class SensorController {
    @Autowired
    SensorService sensorService;
    @Autowired
    SensorShowService sensorShowService;
    /**
     * 增加传感器
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public ResultMap addSensor(Sensor sensor, SensorShow sensorShow){
        Long id=IDUtils.genItemId();
        ResultMap resultMap=new ResultMap();
        if(sensor!=null) {
            sensor.setId(id);
            sensor.setCreated(new Date());
            sensor.setUpdated(new Date());
            sensorService.insertSensor(sensor);
        }
        if(null!=sensorShow){
            sensorShow.setId(id);
            sensorShowService.insertSensorShow(sensorShow);
        }

        resultMap.setMsg("添加成功");
        return resultMap;
    }
    /**
     * 删除传感器
     */
    @RequestMapping("/delete")
    @ResponseBody
    public ResultMap deleteSensor(Long id){
        ResultMap resultMap=new ResultMap();
        sensorService.deleteSensor(id);
        resultMap.setMsg("删除成功");
        return resultMap;
    }
    /**
     * 展示传感器
     */
    @RequestMapping("/list")
    @ResponseBody
    public ResultMap listSensor(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){

        PageHelper.startPage(pn,3);
        List<Sensor> sensorList= sensorService.findAllSensor();
        model.addAttribute("sensorList",sensorList);
        PageInfo pageInfo=new PageInfo(sensorList,3);
        ResultMap resultMap=new ResultMap();
        resultMap.setData(pageInfo);
        return resultMap;
    }
    /**
     * 展示硬件
     */
    @RequestMapping("/showSensor")
    public String showSensor(){
        return "showSensor";
    }

}
