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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Objects;

/**
 * 后台首页控制器
 *
 * @author 言曌
 * @date 2021/3/14 10:00 上午
 */
@Controller
public class AdminIndexController extends BaseController {

    @Autowired
    private UserService userService;

    /**
     * 后台首页
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin")
    public String index(Model model) {
        return "admin/index";
    }

}
