package com.xg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 侯景瀚 on 2019/4/27.
 */
@Controller
public class hello {

    @RequestMapping("/hello")
    public String hello(){
        return "hello";
    }
}
