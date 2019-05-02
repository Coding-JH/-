package com.xg.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xg.common.ResultMap;
import com.xg.pojo.Sensor;
import com.xg.service.SensorShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by 侯景瀚 on 2019/5/1.
 */
@Controller
@RequestMapping("/hard")
public class sensorShowController {
    @Autowired
    SensorShowService sensorShowService;

    /**
     * 展示硬件
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("show")
    @ResponseBody
    public ResultMap listSensor(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){

        PageHelper.startPage(pn,3);
        List<Sensor> hardList= sensorShowService.findAll();
        model.addAttribute("hardList",hardList);
        PageInfo pageInfo=new PageInfo(hardList,3);
        ResultMap resultMap=new ResultMap();
        resultMap.setData(pageInfo);
        return resultMap;
    }
}
