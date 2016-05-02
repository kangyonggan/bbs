package com.kangyonggan.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.constants.PublishedStatusEnum;
import com.kangyonggan.model.Reply;
import com.kangyonggan.service.ReplyService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

/**
 * @author kangyonggan
 * @since 16/4/29
 */
@Service
@Transactional
public class ReplyServiceImpl extends BaseService<Reply> implements ReplyService {

    public void delete(Long id) {
        super.deleteByPrimaryKey(id);
    }

    @Override
    public int save(Reply reply) {
        reply.setStatus(PublishedStatusEnum.PUBLISHED.getStatus());
        reply.setHits(0L);
        reply.setCreatedTime(new Date());
        return super.save(reply);
    }

    public List<Reply> findReplyByArticleId(int pageNow, int pageSize, Long articleId) {
        Example example = new Example(Reply.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("articleId", articleId);
        criteria.andEqualTo("status", PublishedStatusEnum.PUBLISHED.getStatus());

        example.setOrderByClause("createdTime desc");

        PageHelper.startPage(pageNow, pageSize);
        return super.selectByExample(example);
    }

    public List<Reply> findAllReplyByArticleId(Long articleId) {
        Example example = new Example(Reply.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("articleId", articleId);
        criteria.andEqualTo("status", PublishedStatusEnum.PUBLISHED.getStatus());

        example.setOrderByClause("createdTime desc");

        return super.selectByExample(example);
    }
}
