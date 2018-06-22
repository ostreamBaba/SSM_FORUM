package com.viscu.UI.controller;

import com.viscu.UI.domain.*;
import com.viscu.UI.entiry.PageBean;
import com.viscu.UI.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.*;

/**
 * @ Create by ostreamBaba on 18-6-1
 * @ ����
 */

@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private BlockService blockService;

    @Autowired
    private ReplyInfoService replyInfoService;

    @Autowired
    private ArticleInfoService articleInfoService;

    //���ڲ���������Ϣ
    @ModelAttribute
    public void articleInfo_model(
            Integer articleId,Integer articleType,String articleUserName,
            String articleAuthor,Model model){
        ArticleInfo articleInfo=new ArticleInfo();
        articleInfo.setArticleinfoArticleid(articleId);
        articleInfo.setArticleinfoArticletype(articleType);
        articleInfo.setArticleinfoArticleusername(articleUserName);
        articleInfo.setArticleinfoAuthor(articleAuthor);
        model.addAttribute("articleInfo",articleInfo);

    }

    //�����µ�����
    @RequestMapping(value = "/new",method = RequestMethod.POST)
    public String new_article(Article article, HttpServletRequest request){
        String article_username=(String)request.getSession(false).getAttribute("username");
        Timestamp createTime=new Timestamp(System.currentTimeMillis());
        article.setArticleUserName(article_username);
        article.setArticleCreateTime(createTime);
        article.setBlockId(article.getBlockId());
        articleService.addArticle(article);

        //����ĳ�����
        Block block=blockService.findBlockByBlockId(article.getBlockId());
        block.setBlockArticleNum(block.getBlockArticleNum()+1);
        blockService.updateBlock(block);

        //��������ֱ�ӻ���ҳ
        Integer articleId=article.getArticleId();
        if(articleId==null){
            return "redirect:/";
        }

        return "redirect:article-"+articleId;
    }

    //�鿴���Ӻ����ӵĻظ�
    @RequestMapping(value = "/article-{articleId}")
    public String browse_article(@PathVariable("articleId")Integer articleId,HttpServletRequest request){
        Article article=articleService.findArticleByArticleId(articleId);

        String username=(String) request.getSession().getAttribute("username");
        /*�������߱�������ſ������������*/
        if(username!=null){
            if(!username.equals(article.getArticleUserName())) {
                article.setArticleBrowseCount( article.getArticleBrowseCount() + 1 );
                articleService.updateArticle( article );
            }
        }

        Block block=blockService.findBlockByBlockId(article.getBlockId());

        //��ĳ�����ӻظ��������� ����������� �Ͳ������ظ�������
        ArticleInfo articleInfo=articleInfoService.findArticleInfoByArticleIdAndUsername(articleId,username);
        if(articleInfo!=null){
            request.setAttribute("articleInfoIsComment",articleInfo);
        }

        //�������ӵ����лظ�
        List<Reply> replies=replyService.getAllReply(articleId);
        if(replies!=null) {
            Collections.reverse( replies );
            request.setAttribute( "replies", replies);

            //�鿴��ĳ�����ӵ�ĳЩ�ظ����������� �ǾͲ������ظ�
            Iterator<Reply> it=replies.iterator();
            List<ReplyInfo> replyInfos1=new LinkedList<ReplyInfo>();
            while (it.hasNext()){
                ReplyInfo replyInfo=replyInfoService.findByReplyIdAndReplyUser(it.next().getReplyId(),username);
                if(replyInfo!=null){
                    replyInfos1.add(replyInfo);
                }
            }

            if(replyInfos1.size()>0){
                request.setAttribute("replyAlreadyComment",replyInfos1);
            }
        }

        request.setAttribute("Article",article);
        request.setAttribute("block",block);
        return "article/articleInfo";
    }

    @RequestMapping(value = "/toInfo/article-{userName}")
    public String browse_article(@PathVariable("userName")String userName,HttpServletRequest request){
        request.setAttribute("userName",userName);
        List<Article> articles=articleService.findAllByUserName(userName);
        request.setAttribute("articles",articles);

        return "user/userInfo";
    }

    //�����½��е��޻��߷��� �������Ϣ
    @RequestMapping(value = "/comment",method = RequestMethod.GET)
    @ResponseBody
    public Integer comment_article(HttpServletRequest request,Model model){
            String str=request.getParameter("articleId");
        Integer articleId=Integer.valueOf(str);
        Article article=articleService.findArticleByArticleId(articleId);

        String goodStr=request.getParameter("good");
        Integer result=null;

        ArticleInfo articleInfo=(ArticleInfo)model.asMap().get("articleInfo");

        if(goodStr!=null){
            Integer good=Integer.valueOf(goodStr);

            if(good==1){
                articleInfo.setArticleinfoIsread(1);
                articleInfoService.addArticleInfo(articleInfo);
            }else{
                articleInfoService.deleteByArticleIdAndUsername(articleId,
                        articleInfo.getArticleinfoArticleusername());
            }

            result=article.getArticleGoodCount()+good;
            article.setArticleGoodCount(result);
            articleService.updateArticle(article);
            return result;
        }else{
            String badStr=request.getParameter("bad");
            Integer bad=Integer.valueOf(badStr);

            if(bad==1){
                articleInfo.setArticleinfoIsread(1);
                articleInfoService.addArticleInfo(articleInfo);
            }else{
                articleInfoService.deleteByArticleIdAndUsername(articleId,
                        articleInfo.getArticleinfoArticleusername());
            }

            result=article.getArticleBadCount()+bad;
            article.setArticleBadCount(result);
            articleService.updateArticle(article);
        }
        return result;
    }

    @RequestMapping(value = "/findById",method = RequestMethod.GET)
    @ResponseBody
    public Article findArticle(Integer id){
        Article article=articleService.findArticleByArticleId(id);
        if(article==null){
            return new Article();
        }
        return article;
    }

    @RequestMapping(value = "/deleteById", method = RequestMethod.GET)
    @ResponseBody
    public String deleteArticle(Integer id){
        articleService.deleteByArticleId(id);
        return "success";
    }

    @RequestMapping(value = "findByPage",method = RequestMethod.GET)
    public ModelAndView findByPage(int currentPage, int size){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("/admin/articleManager");
        PageBean<Article> pageBean=articleService.findByPage(currentPage,size);
        List<Article> articles=pageBean.getLists();
        mv.addObject("msg","2");

        mv.addObject("articles",articles);
        mv.addObject("currentPage",currentPage);
        return mv;
    }

}
