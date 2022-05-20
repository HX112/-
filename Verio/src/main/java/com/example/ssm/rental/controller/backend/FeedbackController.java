package com.example.ssm.rental.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.enums.HouseStatusEnum;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.Feedback;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.entity.News;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.FeedbackService;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Objects;

/**
 * 反馈控制器
 *
 * @author 言曌
 * @date 2021/3/14 10:00 上午
 */
@Controller("backFeedbackController")
public class FeedbackController extends BaseController {

    @Autowired
    private FeedbackService feedbackService;


    /**
     * 反馈列表
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/feedback")
    public String allFeedback(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                              @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                              Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Feedback condition = new Feedback();
        // 如果不是管理员，查询自己的反馈，否则管理员查询所有的反馈、
        if (!loginUserIsAdmin()) {
            condition.setUserId(getLoginUserId());
        }
        Page<Feedback> feedbackPage = feedbackService.findAll(page, condition);
        model.addAttribute("pageInfo", feedbackPage);

        model.addAttribute("tab", "feedback-list");
        model.addAttribute("pagePrefix", "/admin/feedback?");
        model.addAttribute("isAdmin", loginUserIsAdmin());
        return "admin/feedback-list";
    }


    /**
     * 回复反馈
     *
     * @return
     */
    @RequestMapping(value = "/admin/feedback/reply/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult replySubmit(Feedback feedback) {
        try {
            feedbackService.update(feedback);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("保存反馈失败");
        }
        return JsonResult.success("保存成功");
    }

    /**
     * 删除反馈
     *
     * @return
     */
    @RequestMapping(value = "/admin/feedback/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteFeedback(@RequestParam("id") Long id) {
        try {
            Feedback feedback = feedbackService.get(id);
            if (feedback == null) {
                return JsonResult.error("反馈不存在");
            }
            if (!loginUserIsAdmin() && !Objects.equals(feedback.getUserId(), getLoginUserId())) {
                return JsonResult.error("没有权限删除，这不是你的反馈");
            }
            feedbackService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("删除反馈失败");
        }
        return JsonResult.success("删除反馈成功");
    }

}
