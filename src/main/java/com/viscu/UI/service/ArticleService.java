package com.viscu.UI.service;



import com.viscu.UI.domain.Article;
import com.viscu.UI.entiry.PageBean;

import java.util.List;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 描述
 */

public interface ArticleService {

    void addArticle(Article article); //添加文章

    Article findArticleByArticleId(Integer articleId); //通过id查找文章

    List<Article> findAllByUserName(String userName);

    List<Article> findArticleAllByArticleId(Integer blockId);//通过id查找所有回复

    List<Article> findAllArticle();

    void deleteByArticleId(Integer articleId);//通过id删除回复

    void updateArticle(Article article);//更新文章

    List<Article> findTop10ArticleDesc();

    PageBean<Article> findByPage(int currentPage,int size);
}
