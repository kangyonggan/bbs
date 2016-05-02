package com.kangyonggan.controller.web;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.constants.AppConstants;
import com.kangyonggan.model.Article;
import com.kangyonggan.model.Category;
import com.kangyonggan.model.Reply;
import com.kangyonggan.model.User;
import com.kangyonggan.service.ArticleService;
import com.kangyonggan.service.CategoryService;
import com.kangyonggan.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author kangyonggan
 * @since 16/5/2
 */
@Controller
@RequestMapping("article")
public class ArticleController {

    private static final String PATH_ROOT = "web/article";
    private static final String PATH_INDEX = PATH_ROOT + "/index";
    private static final String PATH_DETAIL = PATH_ROOT + "/detail";

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ReplyService replyService;

    @RequestMapping(value = "category/{code}", method = RequestMethod.GET)
    public String index(@PathVariable("code") String code,
                        @RequestParam(value = "p", required = false, defaultValue = "1") int pageNow,
                        Model model) {
        Category category = categoryService.findCategoryByCode(code);
        List<Article> articles = articleService.searchArticles(pageNow, AppConstants.PAGE_SIZE, 0L, "", "", category.getName(), "");
        PageInfo<Article> page = new PageInfo<Article>(articles);
        List<Category> categories = categoryService.findAllCategory();

        model.addAttribute("page", page);
        model.addAttribute("category", category);
        model.addAttribute("categories", categories);
        return PATH_INDEX;
    }

    @RequestMapping(value = "{id:[\\d]+}", method = RequestMethod.GET)
    public String detail(@PathVariable("id") Long id,
                         @RequestParam(value = "p", required = false, defaultValue = "1") int pageNow,
                         Model model) {
        Article article = articleService.getArticle(id);
        Category category = categoryService.getCategory(article.getCategoryId());
        List<Category> categories = categoryService.findAllCategory();
        List<Reply> replies = replyService.findAllReplyByArticleId(id);
//        PageInfo<Reply> page = new PageInfo<Reply>(replies);

        model.addAttribute("replies", replies);
        model.addAttribute("article", article);
        model.addAttribute("category", category);
        model.addAttribute("categories", categories);
        return PATH_DETAIL;
    }

    @RequestMapping(value = "{articleId:[\\d]+}/reply", method = RequestMethod.POST)
    public String reply(@ModelAttribute("reply") Reply reply, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("token");
        reply.setUserId(user.getId());
        reply.setUsername(user.getRealname());
        replyService.save(reply);
        return "redirect:";
    }

}
