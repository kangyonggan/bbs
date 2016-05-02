package com.kangyonggan.controller.admin;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.constants.AppConstants;
import com.kangyonggan.model.Article;
import com.kangyonggan.model.Category;
import com.kangyonggan.model.User;
import com.kangyonggan.service.ArticleService;
import com.kangyonggan.service.CategoryService;
import com.kangyonggan.service.UserService;
import freemarker.ext.beans.BeansWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

/**
 * @author kangyonggan
 * @since 16/5/2
 */
@Controller
@RequestMapping("admin/article")
public class AdminArticleController {

    private static final String PATH_ROOT = "admin/article";
    private static final String PATH_INDEX = PATH_ROOT + "/index";
    private static final String PATH_DETAIL = PATH_ROOT + "/detail";

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private UserService userService;

    /**
     * 列表界面
     *
     * @param pageNow
     * @param status
     * @param title
     * @param categoryName
     * @param username
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNow,
                        @RequestParam(value = "status", required = false, defaultValue = "") String status,
                        @RequestParam(value = "title", required = false, defaultValue = "") String title,
                        @RequestParam(value = "categoryName", required = false, defaultValue = "") String categoryName,
                        @RequestParam(value = "username", required = false, defaultValue = "") String username,
                        HttpServletRequest request,
                        Model model) {
        List<Article> articles = articleService.searchArticles(pageNow, AppConstants.PAGE_SIZE, 0L, status, title, categoryName, username);
        PageInfo<Article> page = new PageInfo<Article>(articles);

        model.addAttribute("page", page);
        model.addAttribute("menu", "admin");
        model.addAttribute("enums", BeansWrapper.getDefaultInstance().getEnumModels());
        return PATH_INDEX;
    }

    @RequestMapping(value = "{id:[\\d]+}", method = RequestMethod.GET)
    public String detail(@PathVariable("id") Long id, Model model) {
        Article article = articleService.getArticle(id);
        User user = userService.getUser(article.getUserId());

        model.addAttribute("user", user);
        model.addAttribute("menu", "admin");
        model.addAttribute("article", article);
        return PATH_DETAIL;
    }

    /**
     * 删除帖子
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/delete", method = RequestMethod.GET)
    @ResponseBody
    public String delete(@PathVariable("id") Long id) {
        articleService.delete(id);
        return "true";
    }

}
