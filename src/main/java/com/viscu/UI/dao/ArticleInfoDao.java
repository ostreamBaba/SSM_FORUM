package com.viscu.UI.dao;

import com.viscu.UI.domain.ArticleInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleInfoDao {

    //���һ���µĻظ���Ϣ
    void addArticleInfo(ArticleInfo articleInfo);

    //ɾ��һ����Ϣ�ظ���¼(�������Ӻ��������޵��û�)
    void deleteByArticleIdAndUsername(@Param("articleId")Integer articleId,@Param("username")String username);

    ArticleInfo findArticleInfoByArticleIdAndUsername(@Param("articleId")Integer articleId,@Param("username")String username);

    List<ArticleInfo> findAllArticleByUsername(String articleAuthor);

    List<ArticleInfo> findAllArticleByArticleIsRead(@Param("username")String articleAuthor,@Param("isRead")Integer isRead);

    //���ұ��� ���޻��߷��Թ�������
    List<ArticleInfo> findByArticleUserNameAndType(@Param("username")String articleUserName,@Param("type")Integer type);

    void updateByArticleInfo(ArticleInfo articleInfo);

    ArticleInfo findByArticleInfoId(Integer articleInfoId);

}