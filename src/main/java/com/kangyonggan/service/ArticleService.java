package com.kangyonggan.service;

import com.kangyonggan.model.Article;

import java.util.List;

/**
 * @author kangyonggan
 * @since 16/4/29
 */
public interface ArticleService {

    /**
     * 删除帖子
     *
     * @param id
     */
    int delete(Long id);

    /**
     * 保存帖子
     *
     * @param article
     * @return
     */
    int save(Article article);

    /**
     * 根据ID查询帖子
     *
     * @param id
     * @return
     */
    Article getArticle(Long id);

    /**
     * 按条件搜索帖子
     *
     * @param pageNow
     * @param pageSize
     * @param userId
     * @param status
     * @param title
     * @param categoryName
     * @param username
     * @return
     */
    List<Article> searchArticles(int pageNow, int pageSize, Long userId, String status, String title, String categoryName, String username);

}
