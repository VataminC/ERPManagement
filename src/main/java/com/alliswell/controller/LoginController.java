package com.alliswell.controller;

import com.alibaba.fastjson.JSONObject;
import com.alliswell.pojo.User;
import com.alliswell.service.UserService;
import com.alliswell.util.ResultBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * @Author: All is well
 */

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private UserService userServiceImpl;

    /**
     * 登录
     * @param u
     * @param request
     * @return
     */
    @RequestMapping("login")
    @ResponseBody
    public String login(@RequestBody User u, HttpServletRequest request) {
        User user = userServiceImpl.login(u);
        ResultBean res;
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute(user.getName(), user);
            session.setAttribute("username", user.getName());
            res = new ResultBean(0,"success",0,null);
            return JSONObject.toJSONString(res);
        } else {
            res = new ResultBean(0,"failure",0,null);
            return JSONObject.toJSONString(res);
        }
    }

    /**
     * 注销
     * @param session
     * @return
     */
    @RequestMapping(value = "logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        return new ModelAndView("index");
    }

    /**
     * 返回注册页面
     * @return
     */
    @RequestMapping(value = "showRegister")
    public String showRegister() {
        return "view/userManage/register";
    }

    /**
     * 查询用户名是否存在
     * @param data
     * @return
     */
    @RequestMapping(value = "findByName")
    @ResponseBody
    public String findByName(@RequestBody String data) {
        JSONObject jsonObject = JSONObject.parseObject(data);
        String name = jsonObject.getString("name");
        User user = userServiceImpl.findUserByName(name);
        return JSONObject.toJSONString(user);
    }

    /**
     * 注册
     * @param user
     * @return
     */
    @RequestMapping(value = "register")
    @ResponseBody
    public String register(@RequestBody User user) {
        int i = userServiceImpl.addUser(user);
        HashMap<String, Object> map = new HashMap<>(1);
        if (i == 1) {
            map.put("status", "success");
            return JSONObject.toJSONString(map);
        } else {
            map.put("status", "failure");
            return JSONObject.toJSONString(map);
        }
    }

    /**
     * 返回主页面
     * @return
     */
    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @RequestMapping("/noLogin")
    public String noLogin(HttpServletResponse response){
        response.setHeader("refresh","3;url=/ERPManagement/login/index");
        return "view/userManage/noLogin";
    }
}
