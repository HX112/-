package com.example.ssm.rental.controller.front;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.News;
import com.example.ssm.rental.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 新闻控制器
 *
 * @author 言曌
 * @date 2021/3/13 4:55 下午
 */
@Controller
public class NewsController extends BaseController {

    @Autowired
    private NewsService newsService;

    /**
     * 新闻资讯列表
     *
     * @param pageNumber
     * @param pageSize
     * @param model
     * @return
     */
    @RequestMapping(value = "/news")
    public String index(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                        @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                        Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Page<News> newsPage = newsService.findAll(page);
        model.addAttribute("pageInfo", newsPage);
        model.addAttribute("pagePrefix", "/news?");
        return "front/news-list";
    }




    /**
     * 新闻详情
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/news/detail/{id}")
    public String newsDetail(@PathVariable("id") Long id, Model model) {
        News news = newsService.get(id);
        if (news == null) {
            return this.renderNotFound();
        }
        model.addAttribute("news", news);
        return "front/news-detail";
    }
}
