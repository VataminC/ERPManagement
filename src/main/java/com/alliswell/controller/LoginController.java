package com.alliswell.controller;

import com.alliswell.pojo.User;
import com.alliswell.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


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
            model.addAttribute("message","error");
           return "view/error";
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
        return new ModelAndView("redirect:/index.jsp");
    }
}
