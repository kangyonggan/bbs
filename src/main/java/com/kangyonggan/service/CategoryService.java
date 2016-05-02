package com.kangyonggan.service;

import com.kangyonggan.model.Category;

import java.util.List;

/**
 * @author kangyonggan
 * @since 16/4/29
 */
public interface CategoryService {

    /**
     * 根据ID查找栏目
     *
     * @param id
     * @return
     */
    Category getCategory(Long id);

    /**
     * 查找所有栏目
     *
     * @return
     */
    List<Category> findAllCategory();
}
