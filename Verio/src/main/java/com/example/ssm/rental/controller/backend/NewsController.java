package com.example.ssm.rental.controller.backend;

import cn.hutool.http.HtmlUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.News;
import com.example.ssm.rental.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;


/**
 * 后台新闻控制器
 *
 * @author 言曌
 * @date 2021/3/14 10:00 上午
 */
@Controller("backNewsController")
public class NewsController extends BaseController {

    @Autowired
    private NewsService newsService;


    /**
     * 新闻列表
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/news")
    public String allNews(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                          @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                          Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        News condition = new News();
        Page<News> newsPage = newsService.findAll(page, condition);
        model.addAttribute("pageInfo", newsPage);

        model.addAttribute("tab", "news-list");
        model.addAttribute("pagePrefix", "/admin/news?");
        return "admin/news-list";
    }

    /**
     * 发布/编辑新闻
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/news/publish")
    public String publish(@RequestParam(value = "id", required = false) Long id, Model model) {
        News news;
        if (id != null) {
            // 如果要编辑的新闻不存在，则跳转404
            news = newsService.get(id);
            if (news == null) {
                return this.renderNotFound();
            }
        } else {
            news = new News();
        }
        model.addAttribute("news", news);
        return "admin/news-publish";
    }

    /**
     * 发布新闻提交
     *
     * @return
     */
    @RequestMapping(value = "/admin/news/publish/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult publishSubmit(News news) {
        try {
            // 提取摘要
            int postSummary = 300;
            String summaryText = HtmlUtil.cleanHtmlTag(news.getContent());
            if (summaryText.length() > postSummary) {
                String summary = summaryText.substring(0, postSummary);
                news.setSummary(summary);
            } else {
                news.setSummary(summaryText);
            }
            news.setCreateTime(new Date());
            newsService.insertOrUpdate(news);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("发布失败");
        }
        return JsonResult.success("发布成功", news.getId());
    }


    /**
     * 删除新闻
     *
     * @return
     */
    @RequestMapping(value = "/admin/news/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteNews(@RequestParam("id") Long id) {
        try {
            newsService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("删除新闻失败");
        }
        return JsonResult.success("删除新闻成功");
    }

}
