package com.xg.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xg.common.FastDfsClient;
import com.xg.common.IDUtils;
import com.xg.common.PictureResult;
import com.xg.common.ResultMap;
import com.xg.pojo.Sensor;
import com.xg.pojo.SensorShow;
import com.xg.service.SensorService;
import com.xg.service.SensorShowService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by Mr.Hou on 2019/4/27.
 */
@Controller
@RequestMapping("/sensor")
public class SensorController {
    @Autowired
    SensorService sensorService;
    @Autowired
    SensorShowService sensorShowService;

    @Value("${tracker_server}")
    private String tracker_server;
    /** 获取图片服务器的地址 */
    @Value("${IMAGE_SERVER_URL}")
    private String imageServerUrl;

    /**
     * 搜索Sensor
     * @param name
     * @param model
     * @return
     */
    @RequestMapping("/search")
    public String search(@RequestParam String name, Model model){
        List<Sensor> searchList=sensorService.searchByName(name);
        model.addAttribute("searchList",searchList);
        return "/sensor/list";
    }


    /**
     * 上传图片
     * @param uploadFile
     * @return
     */
    @RequestMapping("/pic/upload")
    @ResponseBody
    public PictureResult uploadFile(MultipartFile uploadFile) {
        // 把图片上传到图片服务器
        FastDfsClient fastDFSClient = new FastDfsClient(tracker_server);
        // 得到一个图片地址和文件名
        String url = null;
        // 成功
        Integer error = 0;
        // 错误消息
        String message = null;
        try {
            url = fastDFSClient.uploadFile(uploadFile.getBytes(), FilenameUtils.getExtension(uploadFile.getOriginalFilename()));
        } catch (IOException e) {
            e.printStackTrace();
            // 失败
            error = 1;
            message = "图片上传失败！";
        }
        // 补充为完整的url
        url = imageServerUrl + url;
        // 响应json
        return new PictureResult().setError(error).setUrl(url).setMessage(message);
    }

    /**
     * 增加传感器
     * @param sensor
     * @param sensorShow
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
     * @param id 传感器的id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public ResultMap deleteSensor(Long id){
        sensorService.deleteSensor(id);
        return ResultMap.build(500,"删除成功");
    }
    /**
     * 展示传感器
     * @param pn 传感器总数
     * @param model
     * @return
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
     * 跳转到硬件展示页面
     * @return
     */
    @RequestMapping("/showSensor")
    public String showSensor(){
        return "showSensor";
    }

}
