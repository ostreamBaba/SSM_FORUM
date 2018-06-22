package com.viscu.UI.service.impl;

import com.viscu.UI.dao.ArticleInfoDao;
import com.viscu.UI.domain.ArticleInfo;
import com.viscu.UI.service.ArticleInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ Create by ostreamBaba on 18-6-17
 * @ ����
 */

@Service
public class ArticleInfoServiceImpl implements ArticleInfoService{

    @Autowired(required = false)
    private ArticleInfoDao articleInfoDao;

    @Override
    public void addArticleInfo(ArticleInfo articleInfo) {
        if(articleInfo==null){
            throw new IllegalArgumentException("������Ϣ������");
        }
        articleInfoDao.addArticleInfo(articleInfo);
    }

    @Override
    public void deleteByArticleIdAndUsername(Integer articleId, String username) {
        if(articleId==null){
            throw new IllegalArgumentException("�����Ӳ�����");
        }
        if(username==null){
            throw new IllegalArgumentException("���û���������");
        }
        articleInfoDao.deleteByArticleIdAndUsername(articleId,username);
    }

    @Override
    public ArticleInfo findArticleInfoByArticleIdAndUsername(Integer articleId, String username) {
        if(articleId==null){
            throw new IllegalArgumentException("�����Ӳ�����");
        }
        if(username==null){
            throw new IllegalArgumentException("���û���������");
        }
        return articleInfoDao.findArticleInfoByArticleIdAndUsername(articleId,username);
    }

    @Override
    public List<ArticleInfo> findAllArticleByUsername(String articleAuthor) {
        if(articleAuthor==null){
            throw new IllegalArgumentException("���û���������");
        }
        return articleInfoDao.findAllArticleByUsername(articleAuthor);
    }

    @Override
    public List<ArticleInfo> findAllArticleByArticleIsRead(String articleAuthor, Integer isRead) {
        if(articleAuthor==null){
            throw new IllegalArgumentException("���û���������");
        }
        if(isRead==null){
            throw new IllegalArgumentException("��ֵ������");
        }
        return articleInfoDao.findAllArticleByArticleIsRead(articleAuthor,isRead);
    }

    @Override
    public List<ArticleInfo> findByArticleUserNameAndType(String articleUserName, Integer type) {
        if(articleUserName==null){
            throw new IllegalArgumentException("���û���������");
        }
        if(type==null){
            throw new IllegalArgumentException("��ֵ������");
        }
        return articleInfoDao.findByArticleUserNameAndType(articleUserName,type);
    }

    @Override
    public void updateByArticleInfo(ArticleInfo articleInfo) {
        if(articleInfo==null){
            throw new IllegalArgumentException("����Ϣ������");
        }
        articleInfoDao.updateByArticleInfo(articleInfo);
    }

    @Override
    public ArticleInfo findByArticleInfoId(Integer articleInfoId) {
        if(articleInfoId==null){
            throw new IllegalArgumentException("����Ϣid������");
        }
        return articleInfoDao.findByArticleInfoId(articleInfoId);
    }
}
