package com.kangyonggan.service.impl;

import com.kangyonggan.constants.PublishedStatusEnum;
import com.kangyonggan.model.Category;
import com.kangyonggan.service.CategoryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author kangyonggan
 * @since 16/4/29
 */
@Service
@Transactional
public class CategoryServiceImpl extends BaseService<Category> implements CategoryService {

    public Category getCategory(Long id) {
        return super.selectByPrimaryKey(id);
    }

    public List<Category> findAllCategory() {
        Category category = new Category();
        category.setStatus(PublishedStatusEnum.PUBLISHED.getStatus());

        return super.select(category);
    }
}
