package com.viscu.UI.controller;

import com.viscu.UI.domain.Article;
import com.viscu.UI.domain.ArticleInfo;
import com.viscu.UI.service.ArticleInfoService;
import com.viscu.UI.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedList;
import java.util.List;


/**
 * @ Create by ostreamBaba on 18-6-18
 * @ 描述
 */

@Controller
@RequestMapping("/voted")
public class ArticleInfoController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ArticleInfoService articleInfoService;

    @RequestMapping(value = "/browse/{voted}",method = RequestMethod.GET)
    public ModelAndView voted(@PathVariable String voted, HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("/article/voted");

        String username=(String)request.getSession().getAttribute("username");

        //这里使用了模糊查询有点不准确 后期再改
        if(voted.equals("up")){
            List<ArticleInfo> upArticleInfo=articleInfoService.findByArticleUserNameAndType(username,1);
            List<Article> up=new LinkedList<Article>();
            for(ArticleInfo articleInfo:upArticleInfo) {
                Article article = articleService.findArticleByArticleId( articleInfo.getArticleinfoArticleid());
                up.add(article);
            }
            mv.addObject("upArticle",up);
            mv.addObject("msg","up");
        }else{
            List<ArticleInfo> downArticleInfo=articleInfoService.findByArticleUserNameAndType(username,2);
            List<Article> down=new LinkedList<Article>();
            for(ArticleInfo articleInfo:downArticleInfo){
                Article article = articleService.findArticleByArticleId( articleInfo.getArticleinfoArticleid() );
                down.add(article);
            }

            mv.addObject("downArticle",down);
            mv.addObject("msg","down");
        }
        return mv;
    }

}
