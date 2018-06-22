package com.viscu.UI.service.impl;

import com.viscu.UI.dao.ReplyInfoDao;
import com.viscu.UI.domain.ReplyInfo;
import com.viscu.UI.service.ReplyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ Create by ostreamBaba on 18-6-16
 * @ 描述
 */

@Service
public class ReplyInfoServiceImpl implements ReplyInfoService{

    @Autowired(required = false)
    private ReplyInfoDao replyInfoDao;

    @Override
    public void addReplyInfo(ReplyInfo replyInfo) {
        if(replyInfo==null){
            throw new IllegalArgumentException("回复消息不存在");
        }
        replyInfoDao.addReplyInfo(replyInfo);
    }

    @Override
    public List<ReplyInfo> findAllReplyInfoByUserName(String username) {
        if(username==null){
            throw new IllegalArgumentException("帖子的用户名不存在");
        }
        return replyInfoDao.findAllReplyInfoByUserName(username);
    }

    @Override
    public void updateReplyInfoByReplyInfo(ReplyInfo replyInfo){
        if(replyInfo==null){
            throw new IllegalArgumentException("回复消息不存在");
        }
        replyInfoDao.updateReplyInfoByReplyInfo(replyInfo);
    }

    @Override
    public void deleteReplyInfoByReplyInfo(Integer replyId) {
        if(replyId==null){
            throw new IllegalArgumentException("回复不存在");
        }
        replyInfoDao.deleteByReplyId(replyId);
    }

    @Override
    public List<ReplyInfo> findAllReplyIsNotReadInfoByUserName(String username,Integer isRead) {
        if(username==null){
            throw new IllegalArgumentException("帖子的用户名不存在");
        }
        return replyInfoDao.findAllReplyIsNotReadInfoByUserName(username,isRead);
    }

    @Override
    public ReplyInfo findByReplyIdAndReplyUser(Integer replyId, String username) {
        if(replyId==null){
            throw new IllegalArgumentException("回复id不存在");
        }
        if(username==null){
            throw new IllegalArgumentException("发表意见的用户不存在");
        }
        return replyInfoDao.findByReplyIdAndReplyUser(replyId,username);
    }

    @Override
    public ReplyInfo findByReplyInfoId(Integer replyInfoId) {
        if(replyInfoId==null){
            throw new IllegalArgumentException("回复id不存在");
        }
        return replyInfoDao.findByReplyInfoId(replyInfoId);
    }
}
