package com.viscu.UI.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.viscu.UI.domain.Article;
import com.viscu.UI.domain.Block;
import com.viscu.UI.domain.Reply;
import com.viscu.UI.domain.User;
import com.viscu.UI.entiry.PageBean;
import com.viscu.UI.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @ Create by ostreamBaba on 18-6-21
 * @ 描述
 */

@Controller
@RequestMapping("/admin")
@SessionAttributes("totalPage")
public class adminController {

    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private BlockService blockService;

    @RequestMapping("/userManagerAll")
    public ModelAndView userManagerAll(Model model){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("/admin/userManager");
        mv.addObject("msg","2");

        PageBean<User> pageBean=userService.findByPage(1,5);

        List<User> users=pageBean.getLists();

        model.addAttribute("totalPage",pageBean.getTotalPage());
        mv.addObject("users",users);
        mv.addObject("currentPage",1);
        return mv;
    }

    @RequestMapping("/userManagerByCondition")
    public ModelAndView userManager(ModelAndView mv){
        mv.setViewName("/admin/userManager");
        mv.addObject("msg","1");
        return mv;
    }

    @RequestMapping("/articleManagerAll")
    public ModelAndView articleManagerAll(Model model){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("/admin/articleManager");
        mv.addObject("msg","2");

        PageBean<Article> pageBean=articleService.findByPage(1,5);

        List<Article> articles=pageBean.getLists();

        model.addAttribute("totalPage",pageBean.getTotalPage());
        mv.addObject("articles",articles);
        mv.addObject("currentPage",1);
        return mv;
    }

    @RequestMapping("/articleManagerByCondition")
    public ModelAndView articleManager(ModelAndView mv){
        mv.setViewName("/admin/articleManager");
        mv.addObject("msg","1");
        return mv;
    }

    @RequestMapping("/replyManagerAll")
    public ModelAndView replyManagerAll(Model model){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("/admin/replyManager");
        mv.addObject("msg","2");

        PageBean<Reply> pageBean=replyService.findByPage(1,5);

        List<Reply> replies=pageBean.getLists();

        model.addAttribute("totalPage",pageBean.getTotalPage());
        model.addAttribute("totalCount",pageBean.getTotalCount());//删除重新计算页数
        mv.addObject("replies",replies);
        mv.addObject("currentPage",1);
        return mv;
    }

    @RequestMapping("/replyManagerByCondition")
    public ModelAndView replyManager(ModelAndView mv){
        mv.setViewName("/admin/replyManager");
        mv.addObject("msg","1");
        return mv;
    }

    /*@RequestMapping("/blockManagerAll")
    public ModelAndView blockManagerAll(Model model){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("/admin/blockManager");
        mv.addObject("msg","2");

        PageBean<Reply> pageBean=replyService.findByPage(1,5);

        List<Reply> replies=pageBean.getLists();

        model.addAttribute("totalPage",pageBean.getTotalPage());
        model.addAttribute("totalCount",pageBean.getTotalCount());//删除重新计算页数
        mv.addObject("replies",replies);
        mv.addObject("currentPage",1);
        return mv;
    }*/

    @RequestMapping("/blockManagerByFind")
    public ModelAndView blockManagerByFind(ModelAndView mv){
        mv.setViewName("/admin/blockManager");
        mv.addObject("msg","1");
        return mv;
    }


    @RequestMapping("/blockManagerByAllToDelete")
    public ModelAndView blockManagerByAllToDelete(ModelAndView mv){
        List<Block> blocks=blockService.getAllBlock();
        mv.addObject("blocks",blocks);
        mv.setViewName("/admin/blockManager");
        mv.addObject("msg","2");
        return mv;
    }

    @RequestMapping("/blockManagerAdd")
    public ModelAndView blockManagerAdd(ModelAndView mv){
        mv.setViewName("/admin/blockManager");
        mv.addObject("msg","3");
        return mv;
    }

}
