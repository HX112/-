package com.example.ssm.rental.controller.front;

import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author 言曌
 * @date 2021/3/21 7:07 下午
 */

@Controller
public class TestController {


    // 这个是返回页面
    @RequestMapping("/test1")
    public String test1() {
        return "front/test1";
    }

    // 这个是返回纯字符串
//    @RequestMapping("/test2")
//    @ResponseBody
//    public String test2() {
//        return "front/test2";
//    }

    // 这个是返回对象的JSON字符串
    @RequestMapping("/test3")
    @ResponseBody
    public JsonResult test3() {
        JsonResult jsonResult = new JsonResult(200, "提示信息：成功，哈哈哈", "我是结果");
        return jsonResult;
    }

    @Autowired
    private UserService userService;


    @RequestMapping("/test")
    public String test(Model model) {
        String name = "张三";
        int age  = 18;
        model.addAttribute("name", name);
        model.addAttribute("age", age);


        // 测试集合
        List<User> userList = userService.findAll();
        model.addAttribute("userList", userList);

        // 测试对象
        User user1 = userService.get(1L);
        model.addAttribute("user1", user1);
        return "front/test";
    }
}
