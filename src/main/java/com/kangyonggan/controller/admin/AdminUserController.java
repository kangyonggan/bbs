package com.kangyonggan.controller.admin;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.constants.AppConstants;
import com.kangyonggan.model.User;
import com.kangyonggan.model.ValidationResponse;
import com.kangyonggan.service.UserService;
import com.kangyonggan.util.StringUtil;
import freemarker.ext.beans.BeansWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * 后台用户管理
 *
 * @author kangyonggan
 * @since 16/4/30
 */
@Controller
@RequestMapping("admin/user")
public class AdminUserController {

    private static final String PATH_ROOT = "admin/user";
    private static final String PATH_INDEX = PATH_ROOT + "/index";
    private static final String PATH_CREATE_MODAL = PATH_ROOT + "/create-modal";
    private static final String PATH_DETAIL_MODAL = PATH_ROOT + "/detail-modal";
    private static final String PATH_USER_TR = PATH_ROOT + "/user-tr";

    @Autowired
    private UserService userService;

    /**
     * 用户管理list界面
     *
     * @param pageNow
     * @param status
     * @param username
     * @param realname
     * @param mobile
     * @param email
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNow,
                        @RequestParam(value = "status", required = false, defaultValue = "") String status,
                        @RequestParam(value = "username", required = false, defaultValue = "") String username,
                        @RequestParam(value = "realname", required = false, defaultValue = "") String realname,
                        @RequestParam(value = "mobile", required = false, defaultValue = "") String mobile,
                        @RequestParam(value = "email", required = false, defaultValue = "") String email,
                        Model model) {
        List<User> users = userService.searchUsers(pageNow, AppConstants.PAGE_SIZE, status, username, realname, mobile, email);
        PageInfo<User> page = new PageInfo<User>(users);

        model.addAttribute("enums", BeansWrapper.getDefaultInstance().getEnumModels());
        model.addAttribute("page", page);
        model.addAttribute("menu", "admin");
        return PATH_INDEX;
    }

    /**
     * 添加用户
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String create(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("menu", "admin");
        return PATH_CREATE_MODAL;
    }

    /**
     * 编辑用户
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/edit", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Long id, Model model) {
        model.addAttribute("user", userService.getUser(id));
        model.addAttribute("menu", "admin");
        return PATH_CREATE_MODAL;
    }

    /**
     * 添加用户
     *
     * @param user
     * @param result
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    public ValidationResponse save(@ModelAttribute("user") @Valid User user, BindingResult result) {
        ValidationResponse res = new ValidationResponse();

        if (!result.hasErrors()) {
            int count = userService.save(user);
            res.setStatus(count == 1 ? AppConstants.SUCCESS : AppConstants.FAIL);
        } else {
            res.setStatus(AppConstants.FAIL);
        }

        return res;
    }

    /**
     * 更新用户
     *
     * @param user
     * @param result
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/update", method = RequestMethod.POST)
    @ResponseBody
    public ValidationResponse update(@ModelAttribute("user") @Valid User user, BindingResult result) {
        ValidationResponse res = new ValidationResponse();

        if (!result.hasErrors()) {
            int count = userService.update(user);
            res.setStatus(count == 1 ? AppConstants.SUCCESS : AppConstants.FAIL);
        } else {
            res.setStatus(AppConstants.FAIL);
        }

        return res;
    }

    /**
     * 查看用户详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}", method = RequestMethod.GET)
    public String detail(@PathVariable("id") Long id, Model model) {
        model.addAttribute("user", userService.getUser(id));
        model.addAttribute("menu", "admin");
        return PATH_DETAIL_MODAL;
    }

    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/delete", method = RequestMethod.GET)
    @ResponseBody
    public String delete(@PathVariable("id") Long id) {
        userService.delete(id);
        return "true";
    }

    /**
     * 锁定/解锁
     *
     * @param id
     * @param status
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/{status:\\block\\b|\\bunlock\\b}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    public String lock(@PathVariable("id") Long id, @PathVariable("status") String status, Model model) {
        User user = userService.getUser(id);
        user.setStatus(status);
        userService.update(user);

        model.addAttribute("user", user);
        return PATH_USER_TR;
    }

}
