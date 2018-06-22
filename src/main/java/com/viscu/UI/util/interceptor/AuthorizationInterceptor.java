package com.viscu.UI.util.interceptor;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ Create by ostreamBaba on 18-6-14
 * @ 验证用户是否登录 为登录不可以做任何操作
 */
public class AuthorizationInterceptor implements HandlerInterceptor {

    private static final String[] IGNORE_URL={"/user/login","/user/register","/"}; //对登录和注册设置不拦截


    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.out.println("Intercepting start: ");
        boolean flag=false;
        //获取请求路径进行判断
        String servletPath=httpServletRequest.getServletPath();
        for(String path:IGNORE_URL){
            if(servletPath.equals(path)){
                flag=true;
                break;
            }
        }

        //拦截请求
        if(!flag){
            String username=(String)httpServletRequest.getSession(false).getAttribute("username");
            //如果用户没有登录
            if(username==null){
                System.out.println("Interception request: ");
                httpServletRequest.setAttribute("Msg","noLogin");
                httpServletRequest.getRequestDispatcher("/login").forward(httpServletRequest,httpServletResponse);
            }else{
                System.out.println("Release request");
                flag=true;
            }
        }

        return flag;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        System.out.println("Request through--can be accessed");
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        //todo
    }
}
