package com.xg.controller;

import com.xg.common.IDUtils;
import com.xg.common.ResultMap;
import com.xg.pojo.User;
import com.xg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 登录
     * @param user
     * @param session
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public ResultMap login(User user, HttpSession session){
        String code=user.getPassword();
        User user1=userService.loginUser(user.getUsername());
        ResultMap resultMap=new ResultMap();
        if(null!=user1){
            if(user1.getPassword().equals(code)){
                session.setAttribute("name",user1.getUsername());
                resultMap.setStatus(200);
                resultMap.setMsg("登录成功");
                return resultMap;
            }else {
                resultMap.setStatus(500);
                resultMap.setMsg("用户名或密码错误");
                return resultMap;
            }
        }else {
            resultMap.setStatus(500);
            resultMap.setMsg("用户名不存在");
            return resultMap;
        }
    }
    /**
     * 退出登录的功能
     * @param session
     * @return
     */
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session) {
        session.invalidate();
        return "login";
    }
    /**
     * 注册
     * @param user
     * @param session
     * @return
     */
    @RequestMapping("/regist")
    public ResultMap register(User user, HttpSession session) {
        ResultMap resultMap=new ResultMap();
        //数据库用户名重复校验
        String userName=user.getUsername();
        boolean flag=userService.checkUser(userName);
        if(flag){
            resultMap.setMsg("用户名可用^_^");
        }else{
            resultMap.setMsg("用户名不可用!");
            return resultMap;
        }
        user.setId(IDUtils.genItemId());
        user.setUpdated(new Date());
        user.setCreated(new Date());
        userService.insert(user);
        session.setAttribute("name", user.getUsername());
        return resultMap;
    }

    /**
     * 检验用户名（后端）
     * @param userName
     * @return
     */
    public ResultMap checkUser(@RequestParam("userName") String userName){
        ResultMap resultMap=new ResultMap();
        //先判断用户名是否是合法的表达式;
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if(!userName.matches(regx)){
            resultMap.setMsg("用户名必须是6-16位数字和字母的组合或者2-5位中文");
        }
        //数据库用户名重复校验
        boolean flag=userService.checkUser(userName);
        if(flag){
            resultMap.setMsg("用户名可用^_^");
            return resultMap;
        }else{
            resultMap.setMsg("用户名不可用!");
            return resultMap;
        }
    }

    /**
     * 跳转到展示开发者文档界面
     * @return
     */
    @RequestMapping("/userHelp")
    public String userHelp(){
        return "userHelp";
    }
    /**
     * 跳转到个人主页
     * @return
     */
    @RequestMapping("/userHome")
    public String userHome(){
        return "userHome";
    }
}
