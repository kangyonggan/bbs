package com.kangyonggan.service;

import com.kangyonggan.model.Reply;

import java.util.List;

/**
 * @author kangyonggan
 * @since 16/4/29
 */
public interface ReplyService {

    /**
     * 保存评论
     *
     * @param reply
     */
    int save(Reply reply);

    /**
     * 查找帖子的所有评论
     *
     * @param pageNow
     * @param pageSize
     * @param articleId
     * @return
     */
    List<Reply> findReplyByArticleId(int pageNow, int pageSize, Long articleId);
}
