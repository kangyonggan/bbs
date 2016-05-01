package com.kangyonggan.controller.web;

import com.kangyonggan.model.User;
import com.kangyonggan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author kangyonggan
 * @since 16/5/1
 */
@Controller
@RequestMapping("register")
public class RegisteController {

    private static final String PATH_ROOT = "web/register";
    private static final String PATH_INDEX = PATH_ROOT + "/index";

    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String register() {
        return PATH_INDEX;
    }

    @RequestMapping(method = RequestMethod.POST)
    public String register(User user) {
        userService.save(user);
        return "redirect:dashboard";
    }

}
