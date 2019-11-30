package com.alliswell.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alliswell.pojo.User;
import com.alliswell.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;


@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UserService userServiceImpl;

    @RequestMapping("login")
    public String login(User u, Model model, HttpServletRequest request){
        User login = userServiceImpl.login(u);
        if(login!=null){
            HttpSession session = request.getSession();
            session.setAttribute("login",login);
            return "redirect:toMain";
        }else{
            model.addAttribute("message","用户名或密码错误");
           return "index";
        }
    }
    @RequestMapping("toMain")
    public String toMain(){
        return "view/main";
    }

    @RequestMapping("welcome")
    public String welcome(){
        return "view/welcome";
    }

    @RequestMapping(value = "logout")
    public ModelAndView logout(HttpSession session){
        session.invalidate();
        return new ModelAndView("index");
    }
    @RequestMapping(value = "showRegister")
    public String showRegister(){
        return "view/register";
    }

    @RequestMapping(value = "findByName")
    @ResponseBody
    public String findByName(String uName){
        User user = userServiceImpl.findUserByName(uName);
        return JSONObject.toJSONString(user);
    }

    @RequestMapping(value = "register")
    @ResponseBody
    public String register(@RequestBody User user){
        System.out.println(user.toString());
        int i = userServiceImpl.addUser(user);
        System.out.println(i);
        HashMap<String,Object> map = new HashMap<>(1);
        if(i==1){
            map.put("status","success");
            System.out.println(JSONObject.toJSONString(map));
            return JSONObject.toJSONString(map);
        }else{
            map.put("status","failure");
            return JSONObject.toJSONString(map);
        }
    }
}
