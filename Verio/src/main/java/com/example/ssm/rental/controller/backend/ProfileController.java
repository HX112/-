package com.example.ssm.rental.controller.backend;

import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 个人信息控制器
 *
 * @author 言曌
 * @date 2021/3/14 10:00 上午
 */
@Controller
public class ProfileController extends BaseController {

    @Autowired
    private UserService userService;


    /**
     * 个人信息页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/profile")
    public String profile(Model model) {
        User user = userService.get(getLoginUserId());
        model.addAttribute("user", user);
        model.addAttribute("tab", "my-profile");
        return "admin/my-profile";
    }


    /**
     * 个人信息保存提交
     *
     * @return
     */
    @RequestMapping(value = "/admin/profile/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult submitProfile(User user, HttpSession session) {
        user.setId(getLoginUserId());
        try {
            userService.update(user);
            session.setAttribute(Constant.SESSION_USER_KEY, userService.get(getLoginUserId()));
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("保存用户信息失败");
        }
        return JsonResult.success("保存成功");
    }

}
