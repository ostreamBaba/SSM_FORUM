package com.viscu.UI.controller;

import com.viscu.UI.domain.Article;
import com.viscu.UI.domain.Block;
import com.viscu.UI.domain.Reply;
import com.viscu.UI.domain.User;
import com.viscu.UI.service.ArticleService;
import com.viscu.UI.service.BlockService;
import com.viscu.UI.service.ReplyService;
import com.viscu.UI.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;

/**
 * @ Create by ostreamBaba on 18-6-5
 * @ 描述
 */

@Controller
public class MainController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private BlockService blockService;

    @Autowired
    private UserService userService;

    @Autowired
    private ReplyService replyService;

    @RequestMapping(value = "/")
    public String browse_all_article(HttpServletRequest request) {
        List<Article> articleList = articleService.findAllArticle();
        List<Block> blocks = blockService.getAllBlock();
        List<User> users = userService.getAllUser();
        /*热门帖子*/
        List<Article> tenArticles = articleService.findTop10ArticleDesc();
        Collections.reverse( articleList ); //翻转输出 jsp可以实现翻转
        request.getSession().setAttribute( "ArticleList", articleList );
        request.getSession().setAttribute( "blocks", blocks );
        request.getSession().setAttribute( "tenArticles", tenArticles );
        request.getSession().setAttribute( "userNum", users.size() );
        return "index";
    }

    @RequestMapping(value = "/index")
    public String browse_all_article_other(HttpServletRequest request) {
        List<Article> articleList = articleService.findAllArticle();
        List<Block> blocks = blockService.getAllBlock();
        Collections.reverse( articleList ); //翻转输出 jsp可以实现翻转
        request.setAttribute( "ArticleList", articleList );
        request.setAttribute( "blocks", blocks );
        return "index";
    }

    @RequestMapping("/setting")
    public String goto_setting() {
        return "user/userSetting";
    }

    @RequestMapping("/userInfo")
    public String goto_userInfo() {
        return "user/userInfo";
    }

    @RequestMapping("/blockMain")
    public String goto_blockMain() {
        return "block/blockMain";
    }

    @RequestMapping("/blockInfo")
    public String goto_blockInfo() {
        return "block/blockInfo";
    }

    @RequestMapping("/articleInfo")
    public String goto_articleInfo() {
        return "article/articleInfo";
    }

    @RequestMapping("/writing")
    public String goto_writing() {
        return "article/writing";
    }

    @RequestMapping("/voted")
    public String goto_voted() {
        return "article/voted";
    }

    @RequestMapping("/news")
    public String goto_news(){
        return "article/news";
    }

    @RequestMapping("/admin")
    public String goto_news1(){
        return "admin/admin";
    }

    @RequestMapping("/addBlock")
    public String goto_news2(){
        return "admin/addBlock";
    }

    @RequestMapping("/adminMain")
    public ModelAndView goto_adminMain(ModelAndView mv){
        List<User> allUser=userService.getAllUser();
        List<Article> allArticle=articleService.findAllArticle();
        int allReply=0;
        for(Article article:allArticle){
            allReply+=article.getArticleReplyCount();
        } //findALl 懒得写了
        List<Block> allBlock=blockService.getAllBlock();

        mv.addObject("allUser",allUser.size());
        mv.addObject("allArticle",allArticle.size());
        mv.addObject("allReply",allReply);
        mv.addObject("allBlock",allBlock.size());

        mv.setViewName("admin/adminMain");
        return mv;
    }

    @RequestMapping("/userManager")
    public String goto_userManager(){
        return "admin/userManager";
    }

    @RequestMapping("/articleManager")
    public String goto_articleManager(){
        return "admin/articleManager";
    }

    @RequestMapping("/replyManager")
    public String goto_replyManager(){
        return "admin/replyManager";
    }

    @RequestMapping("/blockManager")
    public String goto_blockManager(){
        return "admin/blockManager";
    }
}
