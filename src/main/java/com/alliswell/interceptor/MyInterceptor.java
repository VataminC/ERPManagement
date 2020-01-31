package com.alliswell.interceptor;

import com.alliswell.pojo.User;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @Author: All is well
 */

@Component
@Aspect
public class MyInterceptor {
    @Pointcut("within (com.alliswell.controller..*) && !within(com.alliswell.controller.LoginController)")
    public void pointCut() {}

    @Around("pointCut()")
    public Object trackInfo(ProceedingJoinPoint joinPoint) throws Throwable {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        User user = (User)session.getAttribute(username);
        if (user == null) {
            attributes.getResponse().sendRedirect("/ERPManagement/login/index");
        }
        return joinPoint.proceed();
    }
}
