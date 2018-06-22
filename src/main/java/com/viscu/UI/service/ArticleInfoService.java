package com.viscu.UI.service;

import com.viscu.UI.domain.ArticleInfo;

import java.util.List;

/**
 * @ Create by ostreamBaba on 18-6-17
 * @ √Ë ˆ
 */
public interface ArticleInfoService {

    void addArticleInfo(ArticleInfo articleInfo);

    void deleteByArticleIdAndUsername(Integer articleId,String username);

    ArticleInfo findArticleInfoByArticleIdAndUsername(Integer articleId,String username);

    List<ArticleInfo> findAllArticleByUsername(String articleAuthor);

    List<ArticleInfo> findAllArticleByArticleIsRead(String articleAuthor,Integer isRead);

    List<ArticleInfo> findByArticleUserNameAndType(String articleUserName,Integer type);

    void updateByArticleInfo(ArticleInfo articleInfo);

    ArticleInfo findByArticleInfoId(Integer articleInfoId);

}
