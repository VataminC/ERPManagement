package com.alliswell.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {

    @RequestMapping("main")
    public String toMain() {
        return "view/main";
    }

    @RequestMapping("welcome")
    public String welcome() {
        return "view/welcome";
    }

}
