package com.xg.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xg.common.ResultMap;
import com.xg.pojo.Sensor;
import com.xg.pojo.SensorShow;
import com.xg.service.SensorShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Mr.Hou on 2019/5/1.
 */
@Controller
@RequestMapping("/hard")
public class sensorShowController {
    @Autowired
    SensorShowService sensorShowService;

    /**
     * 修改传感器数据(弹出一个表单)
     * @param sensorShow
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public ResultMap updateSensor(SensorShow sensorShow, HttpServletRequest request){
        System.out.println("请求体中的值："+request.getParameter("text"));
        System.out.println(sensorShow.getText());
        System.out.println("将要更新的数据："+sensorShow);
        sensorShowService.updateSensorShow(sensorShow);
        return ResultMap.ok();
    }
    /**
     * 展示硬件
     * @param pn 固定一个数字
     * @param model
     * @return
     */
    @RequestMapping("show")
    @ResponseBody
    public ResultMap listSensor(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){

        PageHelper.startPage(pn,3);
        List<Sensor> hardList= sensorShowService.findAll();
        PageInfo pageInfo=new PageInfo(hardList,3);
        model.addAttribute("hardList", hardList);
        return ResultMap.ok();
    }
}
