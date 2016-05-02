package com.kangyonggan.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.constants.UserStatusEnum;
import com.kangyonggan.model.User;
import com.kangyonggan.service.UserService;
import com.kangyonggan.util.StringUtil;
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
public class UserServiceImpl extends BaseService<User> implements UserService {

    public void delete(Long id) {
        super.deleteByPrimaryKey(id);
    }

    public int update(User user) {
        user.setUpdatedTime(new Date());
        return super.updateByPrimaryKeySelective(user);
    }

    @Override
    public int save(User user) {
        user.setCreatedTime(new Date());
        user.setUpdatedTime(new Date());
        user.setStatus(UserStatusEnum.UNLOCK.getStatus());
        return super.save(user);
    }

    public User findUserByUsername(String username) {
        User user = new User();
        user.setUsername(username);
        return super.selectOne(user);
    }

    public User getUser(long id) {
        return super.selectByPrimaryKey(id);
    }

    public List<User> searchUsers(int pageNow, int pageSize, String status, String username, String realname, String mobile, String email) {
        Example example = new Example(User.class);
        Example.Criteria criteria = example.createCriteria();

        if (StringUtil.isNotEmpty(status)) {
            criteria.andEqualTo("status", status);
        }
        if (StringUtil.isNotEmpty(username)) {
            criteria.andLike("username", "%" + username + "%");
        }
        if (StringUtil.isNotEmpty(realname)) {
            criteria.andLike("realname", "%" + realname + "%");
        }
        if (StringUtil.isNotEmpty(mobile)) {
            criteria.andLike("mobile", "%" + mobile + "%");
        }
        if (StringUtil.isNotEmpty(email)) {
            criteria.andLike("email", "%" + email + "%");
        }
        example.setOrderByClause("createdtime desc");

        PageHelper.startPage(pageNow, pageSize);
        return super.selectByExample(example);
    }
}
