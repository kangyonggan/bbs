package com.kangyonggan.service;

import com.kangyonggan.model.User;

import java.util.List;

/**
 * @author kangyonggan
 * @since 16/4/29
 */
public interface UserService {

    /**
     * 保存用户
     *
     * @param user
     */
    int save(User user);

    /**
     * 根据ID查找用户
     *
     * @param id
     * @return
     */
    User getUser(long id);

    /**
     * 搜索符合条件的用户
     *
     * @param pageNow
     * @param status
     * @param username
     * @param realname
     * @param mobile
     * @param email
     * @return
     */
    List<User> searchUsers(int pageNow, String status, String username, String realname, String mobile, String email);

    /**
     * 删除用户
     *
     * @param id
     */
    void delete(Long id);

    /**
     * 更新用户
     *
     * @param user
     * @return
     */
    int update(User user);
}
