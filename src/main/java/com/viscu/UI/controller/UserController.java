package com.viscu.UI.controller;


import com.viscu.UI.domain.*;
import com.viscu.UI.entiry.PageBean;
import com.viscu.UI.service.ArticleInfoService;
import com.viscu.UI.service.ReplyInfoService;
import com.viscu.UI.service.UserService;
import com.viscu.UI.util.MD5Util;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 描述
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ReplyInfoService replyInfoService;

    @Autowired
    private ArticleInfoService articleInfoService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String user_login(String username,String password,String role,HttpServletRequest request){
        if("admin".equals(role)){
            if("admin".equals(password)){
                request.getSession().setAttribute("username",username);
                //对所有的帖子的意见的回复 不管已读还是未读
                List<ReplyInfo> replyInfos=replyInfoService.findAllReplyInfoByUserName(username);
                //对所有的帖子的意见的回复 未读
                List<ReplyInfo> replyInfos1=replyInfoService.findAllReplyIsNotReadInfoByUserName(username,1);
                request.getSession().setAttribute("replyInfos",replyInfos);
                request.getSession().setAttribute("replyInfos1",replyInfos1);
                //别人对帖子点赞 和 对帖子进行回复
                List<ArticleInfo> articleInfos=articleInfoService.findAllArticleByUsername(username);
                //查找未读的所有消息
                List<ArticleInfo> articleInfos1=articleInfoService.findAllArticleByArticleIsRead(username,1);
                request.getSession().setAttribute("articleInfos",articleInfos);
                request.getSession().setAttribute("articleInfos1",articleInfos1);
                return "/admin/adminMain";
            }
        }
        User user=userService.getUserByUserName(username);
        String checkPd="";
        if(user!=null){
            checkPd=userService.getPassword(username);
            System.out.println(checkPd);
        }
        System.out.println( MD5Util.encode(password));
        if(checkPd.equals( MD5Util.encode(password))){
            request.getSession().setAttribute("username",username);

            //对所有的帖子的意见的回复 不管已读还是未读
            List<ReplyInfo> replyInfos=replyInfoService.findAllReplyInfoByUserName(username);
            //对所有的帖子的意见的回复 未读
            List<ReplyInfo> replyInfos1=replyInfoService.findAllReplyIsNotReadInfoByUserName(username,1);

            //对自己的赞不产生消息(未读消息)
            List<ReplyInfo> selfList=new LinkedList<ReplyInfo>();
            List<ReplyInfo> selfList1=new LinkedList<ReplyInfo>();
            for(ReplyInfo replyInfo:replyInfos){
                if(replyInfo.getReplyinfoUsername().equals(replyInfo.getReplyinfoAuthor())){
                    selfList.add(replyInfo);
                }
            }
            for(ReplyInfo replyInfo:selfList){
                replyInfos.remove(replyInfo);
            }
            for(ReplyInfo replyInfo:replyInfos1){
                if(replyInfo.getReplyinfoUsername().equals(replyInfo.getReplyinfoAuthor())){
                    selfList1.add(replyInfo);
                }
            }
            for(ReplyInfo replyInfo:selfList1){
                replyInfos1.remove(replyInfo);
            }

            request.getSession().setAttribute("replyInfos",replyInfos);
            request.getSession().setAttribute("replyInfos1",replyInfos1);


            //别人对帖子点赞 和 对帖子进行回复

            List<ArticleInfo> articleInfos=articleInfoService.findAllArticleByUsername(username);
            //查找未读的所有消息
            List<ArticleInfo> articleInfos1=articleInfoService.findAllArticleByArticleIsRead(username,1);

            List<ArticleInfo> selfArticleList=new LinkedList<ArticleInfo>();
            List<ArticleInfo> selfArticleList1=new LinkedList<ArticleInfo>();

            for(ArticleInfo articleInfo:articleInfos){
                if(articleInfo.getArticleinfoArticleusername().equals(articleInfo.getArticleinfoAuthor())){
                    selfArticleList.add(articleInfo);
                }
            }
            for(ArticleInfo articleInfo:articleInfos1){
                if(articleInfo.getArticleinfoArticleusername().equals(articleInfo.getArticleinfoAuthor())){
                    selfArticleList1.add(articleInfo);
                }
            }
            for(ArticleInfo articleInfo:selfArticleList){
                articleInfos.remove(articleInfo);
            }
            for(ArticleInfo articleInfo:selfArticleList1){
                articleInfos1.remove(articleInfo);
            }

            //这里有点啰嗦 以后再改吧
            request.getSession().setAttribute("articleInfos",articleInfos);
            request.getSession().setAttribute("articleInfos1",articleInfos1);

            return "index";
        }
        request.setAttribute("Msg","error");
        return "login";
    }

    @RequestMapping(value = "/check",method = RequestMethod.POST)
    @ResponseBody
    public String check_user_exist(String username){
        User user=userService.getUserByUserName(username);
        String result="";
        if(user==null){
            result="noExist";
        }else{
            result="exist";
        }
        return result;
    }

    @RequestMapping(value = "/checkEmail",method = RequestMethod.POST)
    @ResponseBody
    public String check_email_exist(String email){
        User user=userService.emailIsExist(email);
        String result="";
        if(user==null){
            result="noExist";
        }else{
            result="exist";
        }
        return result;
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String user_register(User user,
            HttpServletRequest request, HttpServletResponse response){
        // 判断数据库中是否有这个用户
        /*request.getSession().setAttribute("Msg","exist");
        try{
            response.getWriter().print("已经有名字");
        }catch (IOException e){
            throw new RuntimeException(e);
        }
        return "register";*/

        //每次新建一个用户 就创建该用户的默认头像--图片以用户名为标志
        try{
            File oldFile=new File("/home/ios666/Documents/java/src/main/webapp/WEB-INF/resources/image/13.jpeg");
            //简化操作 把所有照片格式设为jpg 名字设置为用户的名字
            File newFile=new File("/home/ios666/Documents/java/src/main/webapp/WEB-INF/resources/image/"+user.getUsername()+".jpg");
            FileUtils.copyFile(oldFile,newFile);
        }catch (IOException e){
            e.printStackTrace();
        }

        String MD5password= MD5Util.encode(user.getPassword());
        user.setPassword(MD5password);

        Timestamp createTime=new Timestamp(System.currentTimeMillis());
        user.setCreateTime(createTime);
        user.setLastLoginTime(createTime);

        this.userService.addUser(user);

        request.getSession().setAttribute("username",user.getUsername());
        return "login";
    }
    //2f6c9b1f8ffbb0184be6a6673b882efc
    @RequestMapping(value = "/reset",method = RequestMethod.POST)
    public String user_reset_password(@RequestParam("oldPassword")String oldPassword,
                                      @RequestParam("newPassword")String newPassword, HttpServletRequest request){
        String MD5oldPassword= MD5Util.encode(oldPassword);
        String username=(String) request.getSession(false).getAttribute("username");
        User user=userService.getUserByUserName(username);
        if(user.getPassword().equals(MD5oldPassword)){
            user.setPassword( MD5Util.encode(newPassword));
            userService.updateUser(user);
            return "index";
        }
        request.setAttribute("Msg","error");
        return "reset";
    }

    //注销用户
    @RequestMapping(value = "/layout")
    public String user_layout(HttpServletRequest request){
        request.getSession().removeAttribute("username");
        request.getSession().removeAttribute("replyInfos1");
        request.getSession().removeAttribute("replyInfos");
        request.getSession().removeAttribute("articleInfos1");
        request.getSession().removeAttribute("articleInfos");
        return "index";
    }

    @RequestMapping(value = "/userInfo1/{username}")
    public String user_info(@PathVariable(value="username")String username,HttpServletRequest request){
        request.setAttribute("userInfo",username);
        return "/user/userInfo";
    }

    //查找所有用户
    @RequestMapping(value = "/findAll")
    public String findAllUser(){
        List<User> users=userService.getAllUser();
        Iterator<User> it=users.iterator();
        while(it.hasNext()){
            System.out.println(it.next());
        }
        return "index";
    }


    @RequestMapping(value = "/forget",method = RequestMethod.POST)
    public String forget(HttpServletRequest request,
                         @RequestParam("email")String email,
                         @RequestParam("newPassword")String newPassword){
        User user=userService.emailIsExist(email);
        if(user==null){
            request.setAttribute("Msg","error");
            return "forget";
        }
        String MD5oldPassword= MD5Util.encode(newPassword);
        user.setPassword(MD5oldPassword);
        userService.updateUser(user);
        request.setAttribute("Msg","success");
        return "login";
    }

    //进入设置页面
    @RequestMapping(value="/setting")
    public ModelAndView user_setting(HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("user/userSetting");
        String username=(String)request.getSession(false).getAttribute("username");
        User user=userService.getUserByUserName(username);
        mv.addObject("user",user);
        return mv;
    }


    @RequestMapping(value="/upload",method = RequestMethod.POST)
    public ModelAndView user_upload(MultipartFile file,HttpServletRequest request)/*throws InterruptedException*/{
        ModelAndView mv=new ModelAndView();
        mv.setViewName("user/userSetting");
        try{
            String username=(String)request.getSession(false).getAttribute("username");
            User user=userService.getUserByUserName(username);
            String filename=username;
            user.setUserHp(username);
            userService.updateUser(user);
            //简化操作 把所有照片格式设为jpg 名字设置为用户的名字
            File filePath=new File("/home/ios666/Documents/java/src/main/webapp/WEB-INF/resources/image/"+filename+".jpg");
            FileUtils.writeByteArrayToFile(filePath,file.getBytes());
            System.out.println(filePath.getAbsolutePath());
            mv.addObject("msg","success");
            mv.addObject("user",user);
            /*Thread.sleep(3000);*/
        }catch (IOException e){
            e.printStackTrace();
            mv.addObject("msg","error");
        }
        return mv;
    }

    //test 仅仅为所有用户添加 初始头像
    @RequestMapping("/addAll")
    @ResponseBody
    public String addAllPhoto(){
        List<User> users=userService.getAllUser();
        Iterator<User> it=users.iterator();
        while (it.hasNext()){
            User user=it.next();
            try{
                File oldFile1=new File("/home/ios666/Documents/java/src/main/webapp/WEB-INF/resources/image/13.jpeg");
                File newFile2=new File("/home/ios666/Documents/java/src/main/webapp/WEB-INF/resources/image/"+user.getUsername()+".jpg");
                FileUtils.copyFile(oldFile1,newFile2);
                System.out.println("add all");
            }catch (IOException e){
                e.printStackTrace();
            }
        }
        return "ok";
    }

    @RequestMapping("findById")
    @ResponseBody
    public User findById(Integer id){
        User user=userService.getUserByUserId(id);
        if(user==null){
            return new User();
        }
        return user;
    }

    @RequestMapping("findByName")
    @ResponseBody
    public User findByName(String name){
        User user=userService.getUserByUserName(name);
        if(user==null){
            return new User();
        }
        return user;
    }

    //分页
    @RequestMapping(value = "findByPage",method = RequestMethod.GET)
    public ModelAndView findByPage(int currentPage,int size){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("/admin/userManager");
        PageBean<User> pageBean=userService.findByPage(currentPage,size);
        List<User> users=pageBean.getLists();
        mv.addObject("msg","2");

        mv.addObject("users",users);
        mv.addObject("currentPage",currentPage);
        return mv;
    }


    @RequestMapping(value = "/deleteUser",method = RequestMethod.GET)
    @ResponseBody
    public String deleteUser(String username){
        userService.deleteUserByUserName(username);
        return "success";
    }


}
