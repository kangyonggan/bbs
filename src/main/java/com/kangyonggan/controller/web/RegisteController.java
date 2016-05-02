package com.kangyonggan.controller.web;

import com.kangyonggan.model.User;
import com.kangyonggan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * 注册
 *
 * @author kangyonggan
 * @since 16/5/1
 */
@Controller
@RequestMapping("register")
public class RegisteController {

    private static final String PATH_ROOT = "web/register";
    private static final String PATH_INDEX = PATH_ROOT + "/index";
    private static final String PATH_PROTOCOL = PATH_ROOT + "/protocol";

    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String register() {
        return PATH_INDEX;
    }

    @RequestMapping(method = RequestMethod.POST)
    public String register(User user, HttpServletRequest request) {
        userService.save(user);
        request.getSession().setAttribute("token", user);
        return "redirect:dashboard";
    }

    @RequestMapping(value = "protocol", method = RequestMethod.GET)
    public String protocol() {
        return PATH_PROTOCOL;
    }

}
