package com.viscu.UI.dao;

import com.viscu.UI.domain.ReplyInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyInfoDao {

    //���һ���µĻظ���Ϣ
    void addReplyInfo(ReplyInfo replyInfo);

    //ͨ���û����������е���Ϣ
    List<ReplyInfo> findAllReplyInfoByUserName(String username);

    //������Ϣ �Ѿ��� ���� û�ж�ȡ
    void updateReplyInfoByReplyInfo(ReplyInfo replyInfo);

    //����ĳ���ظ���idɾ���ظ�
    void deleteByReplyId(Integer replyId);

    List<ReplyInfo> findAllReplyIsNotReadInfoByUserName(@Param("username") String username,@Param("isRead") Integer isRead);

    ReplyInfo findByReplyIdAndReplyUser(@Param("replyId")Integer replyId,@Param("username")String username);

    ReplyInfo findByReplyInfoId(Integer replyInfoId);

}