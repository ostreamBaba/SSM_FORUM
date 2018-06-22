package com.viscu.UI.dao;

import com.viscu.UI.domain.ArticleInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleInfoDao {

    //添加一条新的回复消息
    void addArticleInfo(ArticleInfo articleInfo);

    //删除一条消息回复记录(根据帖子和做出点赞的用户)
    void deleteByArticleIdAndUsername(@Param("articleId")Integer articleId,@Param("username")String username);

    ArticleInfo findArticleInfoByArticleIdAndUsername(@Param("articleId")Integer articleId,@Param("username")String username);

    List<ArticleInfo> findAllArticleByUsername(String articleAuthor);

    List<ArticleInfo> findAllArticleByArticleIsRead(@Param("username")String articleAuthor,@Param("isRead")Integer isRead);

    //查找本人 点赞或者反对过的帖子
    List<ArticleInfo> findByArticleUserNameAndType(@Param("username")String articleUserName,@Param("type")Integer type);

    void updateByArticleInfo(ArticleInfo articleInfo);

    ArticleInfo findByArticleInfoId(Integer articleInfoId);

}