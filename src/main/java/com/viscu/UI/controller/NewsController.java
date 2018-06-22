package com.viscu.UI.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.viscu.UI.domain.Article;
import com.viscu.UI.domain.ArticleInfo;
import com.viscu.UI.domain.Reply;
import com.viscu.UI.domain.ReplyInfo;
import com.viscu.UI.service.ArticleInfoService;
import com.viscu.UI.service.ArticleService;
import com.viscu.UI.service.ReplyInfoService;
import com.viscu.UI.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedList;
import java.util.List;

/**
 * @ Create by ostreamBaba on 18-6-19
 * @ 描述
 */


@Controller
@RequestMapping("/news")
@SessionAttributes(types = {List.class,List.class},value = {"replyInfos1","articleInfos"})
public class NewsController {

    @Autowired
    private ReplyService replyService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ReplyInfoService replyInfoService;

    @Autowired
    private ArticleInfoService articleInfoService;

    @SuppressWarnings("unchecked")
    @RequestMapping("/browse")
    public ModelAndView browse(HttpServletRequest request, Model model){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("/article/news");
        List<ArticleInfo> articleInfoList=(List<ArticleInfo>)request.getSession().getAttribute("articleInfos1");

        /*List<Reply> replies=new LinkedList<Reply>();
        for(ArticleInfo articleInfo:articleInfoList){
            if(articleInfo.getArticleinfoArticletype()==3){

            }
        }*/
        //对文章点赞 ---
        List<Article> goodArticle=new LinkedList<Article>();
        List<Article> badArticle=new LinkedList<Article>();
        List<Integer> goodArticleInfoIdList=new LinkedList<Integer>();
        List<Integer> badArticleInfoIdList=new LinkedList<Integer>();

        for(ArticleInfo articleInfo:articleInfoList){
            Article article=articleService.findArticleByArticleId(articleInfo.getArticleinfoArticleid());
            article.setArticleUserName(articleInfo.getArticleinfoArticleusername());
            if(articleInfo.getArticleinfoArticletype()==1){
                goodArticle.add(article);
                goodArticleInfoIdList.add(articleInfo.getArticleinfoId());
            }else if(articleInfo.getArticleinfoArticletype()==2){
                badArticle.add(article);
                badArticleInfoIdList.add(articleInfo.getArticleinfoId());
            }
        }

        mv.addObject("goodArticle",goodArticle);
        mv.addObject("badArticle",badArticle);
        mv.addObject("goodArticleInfoIdList",goodArticleInfoIdList);
        mv.addObject("badArticleInfoIdList",badArticleInfoIdList);

        List<Reply> goodReply=new LinkedList<Reply>();
        List<Reply> badReply=new LinkedList<Reply>();
        List<Integer> goodReplyInfoIdList=new LinkedList<Integer>();
        List<Integer> badReplyInfoIdList=new LinkedList<Integer>();

        //回复
        List<Reply> replyList=new LinkedList<Reply>();
        List<Integer> replyInfoIdList=new LinkedList<Integer>();

        List<ReplyInfo> replyInfoList=(List<ReplyInfo>)request.getSession().getAttribute("replyInfos1");

        for(ReplyInfo replyInfo:replyInfoList){
            Reply reply=replyService.findReplyByReplyId(replyInfo.getReplyinfoReplyid());
            reply.setReplyUserName(replyInfo.getReplyinfoUsername());//把帖子username 改成点赞的用户
            if(replyInfo.getReplyinfoType()==1){ //点赞
                goodReply.add(reply);
                goodReplyInfoIdList.add(replyInfo.getReplyinfoId());
            }else if(replyInfo.getReplyinfoType()==2){  //反对
                badReply.add(reply);
                badReplyInfoIdList.add(replyInfo.getReplyinfoId());
            }else{  //踩
                replyList.add(reply);
                replyInfoIdList.add(replyInfo.getReplyinfoId());
            }
        }

        mv.addObject("goodReply",goodReply);
        mv.addObject("badReply",badReply);
        mv.addObject("replyList",replyList);
        mv.addObject("goodReplyInfoIdList",goodReplyInfoIdList);
        mv.addObject("badReplyInfoIdList",badReplyInfoIdList);
        mv.addObject("replyInfoIdList",replyInfoIdList);

        return mv;
    }

    @ModelAttribute
    public void news_model(Integer articleInfoId,Integer replyInfoId,Model model){
        if(replyInfoId!=null){
            model.addAttribute("replyInfoId",replyInfoId);
        }
        if(articleInfoId!=null){
            model.addAttribute("articleInfoId",articleInfoId);
        }
    }

    //设置为已读
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/toArticle-{articleId}",method = RequestMethod.GET)
    public ModelAndView goto_article(@PathVariable Integer articleId,
                                     Model model,HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        if(model.asMap().get("replyInfoId")!=null){
            //更新为已读取

            Integer replyInfoId=(Integer)model.asMap().get("replyInfoId");
            ReplyInfo replyInfo=replyInfoService.findByReplyInfoId(replyInfoId);
            replyInfo.setReplyinfoIsread(2);
            replyInfoService.updateReplyInfoByReplyInfo(replyInfo);

            List<ReplyInfo> replyInfos=(List<ReplyInfo>)request.getSession().getAttribute("replyInfos1");
            for(ReplyInfo replyInfo1:replyInfos){
                if(replyInfo1.getReplyinfoId().equals(replyInfoId)){  //去掉已读的那个
                    replyInfos.remove(replyInfo1);
                    break;
                }
            }
            request.getSession().removeAttribute("replyInfos1");
            request.getSession().setAttribute("replyInfos1",replyInfos);
            //model.addAttribute("replyInfos1",replyInfos);
        }else{

            Integer articleInfoId=(Integer)model.asMap().get("articleInfoId");
            ArticleInfo articleInfo=articleInfoService.findByArticleInfoId(articleInfoId);
            articleInfo.setArticleinfoIsread(2);
            articleInfoService.updateByArticleInfo(articleInfo);

            List<ArticleInfo> articleInfos=(List<ArticleInfo>)request.getSession().getAttribute("articleInfos1");
            for(ArticleInfo articleInfo1:articleInfos){
                if(articleInfo1.getArticleinfoId().equals(articleInfoId)){  //去掉已读的那个
                    articleInfos.remove(articleInfo1);
                    break;
                }
            }

            request.getSession().removeAttribute("articleInfos1");
            request.getSession().setAttribute("articleInfos1",articleInfos);
            //model.addAttribute("articleInfos1",articleInfos);
        }

        mv.setViewName("redirect:/article/article-"+articleId);
        return mv;
    }


}
