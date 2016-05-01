package com.kangyonggan.controller.web;

import com.kangyonggan.model.User;
import com.kangyonggan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * @author kangyonggan
 * @since 16/5/1
 */
@Controller
@RequestMapping
public class LoginController {

    private static final String PATH_ROOT = "web/login";
    private static final String PATH_INDEX = PATH_ROOT + "/index";
    private static final String PATH_FORGET = PATH_ROOT + "/forget";

    @Autowired
    private UserService userService;

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login() {
        return PATH_INDEX;
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(User user, Model model, HttpServletRequest request) {
        User u = userService.findUserByUsername(user.getUsername());
        if (u == null) {
            model.addAttribute("message", "用户名不存在");
            return PATH_INDEX;
        } else if (!u.getPassword().equals(user.getPassword())) {
            model.addAttribute("message", "密码不正确");
            return PATH_INDEX;
        }

        request.getSession().setAttribute("user", u);
        return "redirect:dashboard";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout() {
        return PATH_INDEX;
    }

    @RequestMapping(value = "forget", method = RequestMethod.GET)
    public String forget() {
        return PATH_FORGET;
    }

}
