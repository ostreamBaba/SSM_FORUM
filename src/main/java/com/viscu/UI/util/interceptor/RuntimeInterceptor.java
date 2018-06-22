package com.viscu.UI.util.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ Create by ostreamBaba on 18-6-14
 * @ 请求时间拦截器
 */


public class RuntimeInterceptor extends HandlerInterceptorAdapter{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        long startTime=System.currentTimeMillis();
        request.setAttribute("startTime",startTime);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        long startTime=(Long) request.getAttribute("startTime");
        request.removeAttribute("startTime");
        long endTime=System.currentTimeMillis();
        double handlingTime=(double)(endTime-startTime)/1000;
        System.out.println(request.getServletPath()+"  : This request time is: "+handlingTime+"s");
    }
}
