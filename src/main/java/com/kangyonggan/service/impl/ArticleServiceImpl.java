package com.kangyonggan.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.constants.PublishedStatusEnum;
import com.kangyonggan.model.Article;
import com.kangyonggan.model.Category;
import com.kangyonggan.service.ArticleService;
import com.kangyonggan.service.CategoryService;
import com.kangyonggan.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
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
public class ArticleServiceImpl extends BaseService<Article> implements ArticleService {

    @Autowired
    private CategoryService categoryService;

    public int delete(Long id) {
        return super.deleteByPrimaryKey(id);
    }

    @Override
    public int save(Article article) {
        Category category = categoryService.getCategory(article.getCategoryId());

        article.setStatus(PublishedStatusEnum.PUBLISHED.getStatus());
//        article.setUserId(user.getId());
//        article.setUsername(user.getRealname());
        article.setCategoryName(category.getName());
        article.setHits(0L);
        article.setTop((byte) 0);
        article.setCreatedTime(new Date());
        article.setUpdatedTime(new Date());

        return super.save(article);
    }

    public Article getArticle(Long id) {
        return super.selectByPrimaryKey(id);
    }

    public List<Article> searchArticles(int pageNow, int pageSize, Long userId, String status, String title, String categoryName, String username) {
        Example example = new Example(Article.class);
        Example.Criteria criteria = example.createCriteria();

        if (userId != 0) {
            criteria.andEqualTo("userId", userId);
        }
        if (StringUtil.isNotEmpty(status)) {
            criteria.andEqualTo("status", status);
        }
        if (StringUtil.isNotEmpty(title)) {
            criteria.andLike("title", "%" + title + "%");
        }
        if (StringUtil.isNotEmpty(categoryName)) {
            criteria.andLike("categoryName", "%" + categoryName + "%");
        }
        if (StringUtil.isNotEmpty(username)) {
            criteria.andLike("username", "%" + username + "%");
        }

        PageHelper.startPage(pageNow, pageSize);
        return super.selectByExample(example);
    }
}
