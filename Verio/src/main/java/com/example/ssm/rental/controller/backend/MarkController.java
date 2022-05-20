package com.example.ssm.rental.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.Feedback;
import com.example.ssm.rental.entity.Mark;
import com.example.ssm.rental.service.FeedbackService;
import com.example.ssm.rental.service.HouseService;
import com.example.ssm.rental.service.MarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Objects;

/**
 * 收藏控制器
 *
 * @author 言曌
 * @date 2021/3/14 10:00 上午
 */
@Controller("backMarkController")
public class MarkController extends BaseController {

    @Autowired
    private MarkService markService;

    @Autowired
    private HouseService houseService;


    /**
     * 我的收藏
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/mark")
    public String allFeedback(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                              @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                              Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Mark condition = new Mark();
        condition.setUserId(getLoginUserId());

        Page<Mark> markPage = markService.findAll(page, condition);
        for (Mark temp : markPage.getRecords()) {
            temp.setHouse(houseService.get(temp.getHouseId()));
        }
        model.addAttribute("pageInfo", markPage);

        model.addAttribute("tab", "mark-list");
        model.addAttribute("pagePrefix", "/admin/mark?");
        return "admin/mark-list";
    }


    /**
     * 取消收藏
     *
     * @return
     */
    @RequestMapping(value = "/admin/mark/cancel", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult cancelMark(@RequestParam("id") Long id) {
        try {
            Mark mark = markService.get(id);
            if (mark != null && Objects.equals(mark.getUserId(), getLoginUserId())) {
                markService.delete(id);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("删除收藏失败");
        }
        return JsonResult.success("删除成功");
    }


}
