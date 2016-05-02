package com.kangyonggan.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.constants.AppConstants;
import com.kangyonggan.model.Article;
import com.kangyonggan.model.Category;
import com.kangyonggan.model.Reply;
import com.kangyonggan.model.User;
import com.kangyonggan.service.ArticleService;
import com.kangyonggan.service.CategoryService;
import com.kangyonggan.service.ReplyService;
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
 * 发表帖子
 *
 * @author kangyonggan
 * @since 16/5/2
 */
@Controller
@RequestMapping("dashboard/article")
public class DashboardArticleController {

    private static final String PATH_ROOT = "dashboard/article";
    private static final String PATH_INDEX = PATH_ROOT + "/index";
    private static final String PATH_FORM = PATH_ROOT + "/form";
    private static final String PATH_DETAIL = PATH_ROOT + "/detail";

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private UserService userService;

    @Autowired
    private ReplyService replyService;

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
        User user = (User) request.getSession().getAttribute("token");
        List<Article> articles = articleService.searchArticles(pageNow, AppConstants.PAGE_SIZE, user.getId(), status, title, categoryName, username);
        PageInfo<Article> page = new PageInfo<Article>(articles);

        model.addAttribute("page", page);
        model.addAttribute("enums", BeansWrapper.getDefaultInstance().getEnumModels());
        return PATH_INDEX;
    }

    /**
     * 发表帖子
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String create(Model model) {
        List<Category> categories = categoryService.findAllCategory();

        model.addAttribute("article", new Article());
        model.addAttribute("categories", categories);
        return PATH_FORM;
    }

    /**
     * 发表帖子
     *
     * @param article
     * @param result
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@ModelAttribute("article") @Valid Article article, BindingResult result, HttpServletRequest request) {

        if (!result.hasErrors()) {
            User user = (User) request.getSession().getAttribute("token");
            article.setUserId(user.getId());
            article.setUsername(user.getRealname());
            int count = articleService.save(article);
            if (count == 1) {
                return "redirect:";
            }
        }

        return "redirect:create";
    }

    @RequestMapping(value = "{id:[\\d]+}", method = RequestMethod.GET)
    public String detail(@PathVariable("id") Long id, Model model) {
        Article article = articleService.getArticle(id);
        User user = userService.getUser(article.getUserId());
        List<Reply> replies = replyService.findAllReplyByArticleId(id);

        model.addAttribute("user", user);
        model.addAttribute("article", article);
        model.addAttribute("replies", replies);
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
