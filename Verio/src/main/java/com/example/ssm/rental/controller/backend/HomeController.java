package com.example.ssm.rental.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.enums.HouseRentTypeEnum;
import com.example.ssm.rental.common.enums.OrderStatusEnum;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.entity.Order;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.HouseService;
import com.example.ssm.rental.service.OrderService;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Objects;

/**
 * 我的家 控制器
 *
 * @author 言曌
 * @date 2021/3/14 10:00 上午
 */
@Controller("backHomeController")
public class HomeController extends BaseController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;


    /**
     * 租客房子信息，我的家
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/home")
    public String houseHome(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                            @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                            Model model) {
        // 查询当前用户有效订单
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Order condition = new Order();
        condition.setCustomerUserId(getLoginUserId());
        condition.setStatus(OrderStatusEnum.NORMAL.getValue());
        Page<Order> orderPage = orderService.findAll(page, condition);
        for (Order order : orderPage.getRecords()) {
            // 查询该订单的房子信息
            House house = houseService.get(order.getHouseId());
            order.setHouse(house);
            // 查询房东信息
            User owner = userService.get(order.getOwnerUserId());
            order.setOwnerUser(owner);
        }

        model.addAttribute("pageInfo", orderPage);
        model.addAttribute("tab", "home");
        model.addAttribute("pagePrefix", "/admin/home?");
        return "admin/my-home";
    }


}
