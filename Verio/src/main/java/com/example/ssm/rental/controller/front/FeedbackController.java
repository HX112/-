package com.example.ssm.rental.controller.front;

import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.enums.FeedbackStatusEnum;
import com.example.ssm.rental.entity.Feedback;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.FeedbackService;
import com.example.ssm.rental.common.dto.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * 反馈控制器
 *
 * @author 言曌
 * @date 2021/3/13 4:55 下午
 */
@Controller("frontFeedbackController")
public class FeedbackController extends BaseController {

    @Autowired
    private FeedbackService feedbackService;

    @RequestMapping("/feedback")
    public String index() {
        return "front/feedback";
    }

    /**
     * 反馈提交
     *
     * @param title
     * @param content
     * @param contactName
     * @param contactEmail
     * @return
     */
    @RequestMapping("/feedback/submit")
    @ResponseBody
    public JsonResult submit(@RequestParam("title") String title,
                             @RequestParam("content") String content,
                             @RequestParam("contactName") String contactName,
                             @RequestParam("contactEmail") String contactEmail) {
        User loginUser = getLoginUser();
        if (loginUser == null) {
            return JsonResult.error("请先登录");
        }

        Feedback feedback = new Feedback();
        feedback.setCreateTime(new Date());
        feedback.setStatus(FeedbackStatusEnum.NOT_HANDLE.getValue());
        feedback.setUserId(loginUser.getId());
        feedback.setTitle(title);
        feedback.setContent(content);
        feedback.setContactName(contactName);
        feedback.setContactEmail(contactEmail);
        feedbackService.insert(feedback);
        return JsonResult.success("反馈成功，请耐心等待管理员处理");
    }
}
