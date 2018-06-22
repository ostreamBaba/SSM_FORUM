package com.viscu.UI.controller;

import com.viscu.UI.domain.Article;
import com.viscu.UI.domain.ArticleInfo;
import com.viscu.UI.domain.Reply;
import com.viscu.UI.domain.ReplyInfo;
import com.viscu.UI.entiry.PageBean;
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
import java.sql.Timestamp;
import java.util.List;

/**
 * @ Create by ostreamBaba on 18-6-4
 * @ 描述
 */

@Controller
@RequestMapping("/reply")
public class ReplyController {

    @Autowired
    private ReplyService replyService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ReplyInfoService replyInfoService;

    @Autowired
    private ArticleInfoService articleInfoService;

    @ModelAttribute
    public void ReplyInfoModel(Integer replyId,String replyUsername,
                               String replyAuthor,Integer replyType, Model model){
        ReplyInfo replyInfo=new ReplyInfo();
        replyInfo.setReplyinfoReplyid(replyId);
        replyInfo.setReplyinfoAuthor(replyAuthor);
        replyInfo.setReplyinfoUsername(replyUsername);
        replyInfo.setReplyinfoType(replyType);
        model.addAttribute("replyInfo",replyInfo);
    }

    @ModelAttribute("articleInfo")
    public ArticleInfo articleInfo_model(
            Integer replyArticleId,Integer articleType,String articleUserName,
            String replyUserName){
        ArticleInfo articleInfo=new ArticleInfo();
        articleInfo.setArticleinfoArticleid(replyArticleId);
        articleInfo.setArticleinfoArticletype(articleType);
        articleInfo.setArticleinfoArticleusername(replyUserName);
        articleInfo.setArticleinfoAuthor(articleUserName);
        return articleInfo;
    }

    @ModelAttribute("replyInfoNew")
    public ReplyInfo replyInfo_model(Integer replyType,String articleUserName,
                                     String replyUserName){
        ReplyInfo replyInfo=new ReplyInfo();
        replyInfo.setReplyinfoUsername(replyUserName);
        replyInfo.setReplyinfoAuthor(articleUserName);
        replyInfo.setReplyinfoType(replyType);
        return replyInfo;
    }


    @RequestMapping(value = "/new")
    public String reply_add(Reply reply,/*@ModelAttribute("articleInfo")ArticleInfo articleInfo*/
                            @ModelAttribute("replyInfoNew")ReplyInfo replyInfo){
        Timestamp createTime=new Timestamp(System.currentTimeMillis());
        reply.setReplyCreateTime(createTime);
        /*replyService.addReply(reply);*/

        replyService.insertAndGetId(reply);
        System.out.println(reply.getReplyId());

        Integer articleId=reply.getReplyArticleId();
        Article article=articleService.findArticleByArticleId(articleId);

        /*回复+1*/
        article.setArticleReplyCount(article.getArticleReplyCount()+1);
        /*最后回复的时间*/
        article.setArticleLastReplyTime(createTime);

        //创建新回复会产生消息
        /*articleInfo.setArticleinfoIsread(1);
        articleInfoService.addArticleInfo(articleInfo);*/

        replyInfo.setReplyinfoIsread(1);
        replyInfo.setReplyinfoReplyid(reply.getReplyId());
        replyInfoService.addReplyInfo(replyInfo);

        articleService.updateArticle(article);
        return "redirect:/article/article-"+articleId;
    }

    //对回复进行点赞 并且会对reply的作者 发送消息
    @RequestMapping(value = "/comment",method = RequestMethod.GET)
    @ResponseBody
    public Integer reply_comment(HttpServletRequest request,Model model){
        String str=request.getParameter("replyId");
        Integer replyId=Integer.valueOf(str);
        Reply reply=replyService.findReplyByReplyId(replyId);

        String goodStr=request.getParameter("good");
        Integer result=null;

        ReplyInfo replyInfo=(ReplyInfo)model.asMap().get("replyInfo");

        /*String getMan=replyInfo.getReplyinfoAuthor();
        String doMan=replyInfo.getReplyinfoUsername();*/

        if(goodStr!=null){

            Integer good=Integer.valueOf(goodStr);
            //如果点赞 作者就能够收到一条点赞消息 如果取消 就删掉点赞的消息 不通知作者
            //自己给点赞产生消息 但是不通知作者
            if(good==1){
                replyInfo.setReplyinfoIsread(1);
                replyInfoService.addReplyInfo(replyInfo);
            }else{
                replyInfoService.deleteReplyInfoByReplyInfo(replyId);
            }

            result=reply.getReplyGoodCount()+good;
            reply.setReplyGoodCount(result);
            replyService.updateReply(reply);
            return result;
        }else{
            String badStr=request.getParameter("bad");
            Integer bad=Integer.valueOf(badStr);

            //反对有消息生成 取消反对没有消息生成(并且会删除 历史记录)
            if(bad==1){
                replyInfo.setReplyinfoIsread(1);
                replyInfoService.addReplyInfo(replyInfo);
            }else{
                replyInfoService.deleteReplyInfoByReplyInfo(replyId);
            }

            result=reply.getReplyBadCount()+bad;
            reply.setReplyBadCount(result);
            replyService.updateReply(reply);
        }
        return result;
    }

    //删除回复
    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    public String reply_delete(HttpServletRequest request){
        String replyId=request.getParameter("replyId");
        replyService.deleteReplyById(Integer.valueOf(replyId));

        //删除回复 更新文章回复数量
        String articleId=request.getParameter("articleId");
        Article article=articleService.findArticleByArticleId(Integer.valueOf(articleId));

        int updateCount=article.getArticleReplyCount()-1;
        article.setArticleReplyCount(updateCount);
        articleService.updateArticle(article);

        return "success";
        /*ModelAndView mv=new ModelAndView();
        mv.setViewName("redirect:/article/article"+Integer.valueOf(articleId));
        return mv;*/
    }

    /*@RequestMapping(value = "/reply-{replyId}")
    public String reply_browse(@PathVariable("replyId")Integer replyId,HttpServletRequest request){
        return "/null";
    }*/

    //查看回复
    @RequestMapping(value = "browse",method = RequestMethod.GET)
    @ResponseBody
    public Integer reply_browse(HttpServletRequest request){
        String replyId=request.getParameter("replyId");
        String good=request.getParameter("good");
        Reply reply=replyService.findReplyByReplyId(Integer.valueOf(replyId));
        if(good!=null){
            return reply.getReplyGoodCount();
        }
        return reply.getReplyBadCount();
    }

    @RequestMapping(value = "/findById",method = RequestMethod.GET)
    @ResponseBody
    public Reply findReply(Integer id){
        Reply reply=replyService.findReplyByReplyId(id);
        if(reply==null){
            return new Reply();
        }
        return reply;
    }

    //删除更新当前列表
    @RequestMapping(value = "/deleteById", method = RequestMethod.GET)
    @ResponseBody
    public String deleteReply(Integer id){
        Reply reply=replyService.findReplyByReplyId(id);
        Article article=articleService.findArticleByArticleId(reply.getReplyArticleId());
        replyService.deleteReplyById(id);
        article.setArticleReplyCount(article.getArticleReplyCount()-1);
        articleService.updateArticle(article);
        return "success";
    }

    @RequestMapping(value = "findByPage",method = RequestMethod.GET)
    @ResponseBody
    public List<Reply> findByPage(int currentPage, int size){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("/admin/replyManager");
        PageBean<Reply> pageBean=replyService.findByPage(currentPage,size);
        List<Reply> replies=pageBean.getLists();
        return replies;
    }



}

