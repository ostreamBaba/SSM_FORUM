package com.viscu.UI.service.impl;


import com.viscu.UI.dao.ArticleDao;
import com.viscu.UI.domain.Article;
import com.viscu.UI.entiry.PageBean;
import com.viscu.UI.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 文章服务实现类
 */

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired(required = false)
    private ArticleDao articleDao;

    @Override
    public void addArticle(Article article) {
        if (article==null){
            throw new IllegalArgumentException("文章不存在");
        }
        this.articleDao.addArticle(article);
    }

    @Override
    public Article findArticleByArticleId(Integer articleId) {
        if(articleId==null){
            throw new IllegalArgumentException("文章id不存在");
        }
        return this.articleDao.findById(articleId);
    }

    @Override
    public List<Article> findAllByUserName(String userName) {
        if(userName==null){
            throw new IllegalArgumentException("用户名找不到");
        }
        return this.articleDao.findAllByUserName(userName);
    }

    @Override
    public void deleteByArticleId(Integer articleId) {
        if(articleId==null){
            throw new IllegalArgumentException("文章id不存在");
        }
        this.articleDao.deleteById(articleId);
    }

    @Override
    public List<Article> findArticleAllByArticleId(Integer blockId) {
        if(blockId==null){
            throw new IllegalArgumentException("文章id不存在");
        }
        return this.articleDao.findArticleAllByBlockId(blockId);
    }

    @Override
    public List<Article> findAllArticle() {
        List<Article> articles=this.articleDao.findAllArticle();
        return articles;
    }

    @Override
    public void updateArticle(Article article) {
        if(article==null){
            throw new IllegalArgumentException("文章不存在");
        }
        this.articleDao.updateArticle(article);
    }

    @Override
    public List<Article> findTop10ArticleDesc() {
        return this.articleDao.findTop10ArticleDesc();
    }

    @Override
    public PageBean<Article> findByPage(int currentPage, int size) {
        if(currentPage==0 || size==0){
            throw new IllegalArgumentException("数值不正确");
        }

        List<Article> list=articleDao.findAllArticle();

        PageBean<Article> articlePageBean=new PageBean<Article>();

        articlePageBean.setCurrentPage(currentPage);
        articlePageBean.setPageSize(size);

        int totalCount=list.size();
        articlePageBean.setTotalCount(totalCount);

        double tc=(double)totalCount;
        Double totalPage=Math.ceil(tc/size);
        articlePageBean.setTotalPage(totalPage.intValue());

        Map<String,Object> map=new HashMap<String,Object>();
        map.put("start",(currentPage-1)*size);
        map.put("size",size);

        list=articleDao.findByPage(map);
        articlePageBean.setLists(list);
        return articlePageBean;
    }
}
