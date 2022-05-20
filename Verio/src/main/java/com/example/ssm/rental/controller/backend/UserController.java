package com.example.ssm.rental.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.enums.UserStatusEnum;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户列表控制器
 *
 * @author 言曌
 * @date 2021/3/14 10:00 上午
 */
@Controller("backUserController")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;


    /**
     * 用户列表列表
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/user")
    public String allUser(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                          @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                          Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        User condition = new User();
        Page<User> userPage = userService.findAll(page, condition);
        model.addAttribute("pageInfo", userPage);

        model.addAttribute("tab", "user-list");
        model.addAttribute("pagePrefix", "/admin/user?");
        return "admin/user-list";
    }


    /**
     * 禁用用户
     *
     * @return
     */
    @RequestMapping(value = "/admin/user/disable", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult disableUser(@RequestParam("id") Long id) {
        try {
            User user = userService.get(id);
            if (user != null) {
                user.setStatus(UserStatusEnum.DISABLE.getValue());
                userService.update(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("禁用用户失败");
        }
        return JsonResult.success("禁用用户成功");
    }


    /**
     * 启用用户
     *
     * @return
     */
    @RequestMapping(value = "/admin/user/enable", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult enableUser(@RequestParam("id") Long id) {
        try {
            User user = userService.get(id);
            if (user != null) {
                user.setStatus(UserStatusEnum.ENABLE.getValue());
                userService.update(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("启用用户失败");
        }
        return JsonResult.success("启用用户成功");
    }

    /**
     * 删除用户
     *
     * @return
     */
    @RequestMapping(value = "/admin/user/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteUser(@RequestParam("id") Long id) {
        try {
            userService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("删除用户失败");
        }
        return JsonResult.success("删除成功");
    }


}
