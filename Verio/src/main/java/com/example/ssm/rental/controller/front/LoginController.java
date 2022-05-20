package com.example.ssm.rental.controller.front;

import cn.hutool.core.util.RandomUtil;
import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.enums.HouseRentTypeEnum;
import com.example.ssm.rental.common.enums.UserStatusEnum;
import com.example.ssm.rental.common.util.MailUtil;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.HouseService;
import com.example.ssm.rental.service.UserService;
import com.example.ssm.rental.common.dto.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * @author 言曌
 * @date 2021/3/13 3:37 下午
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private HouseService houseService;

    /**
     * 登录页面
     *
     * @return
     */
    @RequestMapping("/login")
    public String login(Model model) {
        // 最新整租
        List<House> recentWholeHouseList = houseService.findTopList(HouseRentTypeEnum.WHOLE.getValue(), Constant.INDEX_HOUSE_NUM);
        model.addAttribute("recentWholeHouseList", recentWholeHouseList);

        // 最新合租
        List<House> recentShareHouseList = houseService.findTopList(HouseRentTypeEnum.SHARE.getValue(), Constant.INDEX_HOUSE_NUM);
        model.addAttribute("recentShareHouseList", recentShareHouseList);

        model.addAttribute("openLogin", "Y");
        return "front/index";
    }


    /**
     * 登录提交
     *
     * @param userName
     * @return
     */
    @RequestMapping(value = "/login/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult loginSubmit(@RequestParam("userName") String userName,
                                  @RequestParam("userPass") String userPass,
                                  HttpSession session) {
        // 查询用户名是否存在
        User user = userService.findByUserName(userName);
        if (user == null) {
            return JsonResult.error("用户不存在");
        }

        // 判断密码是否正确
        if (!Objects.equals(user.getUserPass(), userPass)) {
            return JsonResult.error("密码错误");
        }

        // 判断用户是否禁用
        if (Objects.equals(user.getStatus(), UserStatusEnum.DISABLE.getValue())) {
            return JsonResult.error("账号已被冻结，请联系管理员");
        }

        // 登录成功
        session.setAttribute(Constant.SESSION_USER_KEY, user);
        return JsonResult.success("登录成功");
    }

    /**
     * 注册提交
     *
     * @param userName
     * @param userName
     * @param userPass
     * @param userDisplayName
     * @param email
     * @param phone
     * @param role
     * @return
     */
    @RequestMapping(value = "/register/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult registerSubmit(@RequestParam("userName") String userName,
                                     @RequestParam("userPass") String userPass,
                                     @RequestParam("userDisplayName") String userDisplayName,
                                     @RequestParam("email") String email,
                                     @RequestParam("phone") String phone,
                                     @RequestParam("role") String role,
                                     HttpSession session) {
        // 查询用户名是否存在
        User user = userService.findByUserName(userName);
        if (user != null) {
            return JsonResult.error("用户已占用");
        }

        // 用户名不存在，则注册用户
        user = new User();
        user.setUserName(userName);
        user.setUserDisplayName(userDisplayName);
        user.setPhone(phone);
        user.setEmail(email);
        user.setUserAvatar("/assets/img/default-avatar.jpg");
        user.setUserPass(userPass);
        user.setRole(role);
        user.setCreateTime(new Date());
        user.setSex("保密");
        user.setHobby("还没有填写！");
        user.setUserDesc("还没有填写！");
        user.setJob("其他");
        try {
            userService.insert(user);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("注册失败");
        }
        // 注册成功，直接登录成功
        session.setAttribute(Constant.SESSION_USER_KEY, user);
        return JsonResult.success("注册成功");
    }


    /**
     * 找回密码提交
     *
     * @param userName
     * @return
     */
    @RequestMapping(value = "/forget/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult forgetSubmit(@RequestParam("userName") String userName,
                                   @RequestParam("email") String email,
                                   HttpSession session) {
        // 查询用户名是否存在
        User user = userService.findByUserName(userName);
        if (user == null) {
            return JsonResult.error("用户不存在");
        }

        // 如果邮箱不一致
        if (!Objects.equals(email, user.getEmail())) {
            return JsonResult.error("用户名和邮箱不匹配");
        }

        // 如果一致，则重置密码
        String randomPass = RandomUtil.randomNumbers(8);
        try {
            MailUtil.sendMail(email, "重置密码", "您的新密码为:" + randomPass);
            user.setUserPass(randomPass);
            userService.update(user);
            return JsonResult.success("密码重置成功，请查收邮件");
        } catch (MessagingException e) {
            e.printStackTrace();
            return JsonResult.error("邮件发送失败，密码未重置成功，请联系管理员");
        }
    }

    /**
     * 退出登录，返回首页
     *
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/";
    }


}
