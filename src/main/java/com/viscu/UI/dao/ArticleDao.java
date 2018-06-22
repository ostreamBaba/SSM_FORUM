package com.viscu.UI.dao;


import com.viscu.UI.domain.Article;
import com.viscu.UI.entiry.PageBean;

import java.util.List;
import java.util.Map;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 描述
 */

public interface ArticleDao {
    void addArticle(Article article); //添加文章
    Article findById(Integer articleId); //通过id查找文章

    List<Article> findAllByUserName(String userName);//通过名字查找文章

    List<Article> findArticleAllByBlockId(Integer blockId); //通过id获取该文章所有回复

    void deleteById(Integer id); //通过id删除文章

    List<Article> findAllArticle();

    void updateArticle(Article article);//更新文章

    List<Article> findTop10ArticleDesc();

    List<Article> findByPage(Map<String,Object> map);
}
