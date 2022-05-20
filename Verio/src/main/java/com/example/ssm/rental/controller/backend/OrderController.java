package com.example.ssm.rental.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.enums.HouseRentTypeEnum;
import com.example.ssm.rental.common.enums.HouseStatusEnum;
import com.example.ssm.rental.common.enums.OrderStatusEnum;
import com.example.ssm.rental.common.util.DateUtil;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.entity.Order;
import com.example.ssm.rental.service.HouseService;
import com.example.ssm.rental.service.OrderService;
import com.example.ssm.rental.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 反馈控制器
 *
 * @author 言曌
 * @date 2021/3/14 10:00 上午
 */
@Controller("backOrderController")
public class OrderController extends BaseController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;


    /**
     * 订单列表
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/order")
    public String allOrder(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                           @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                           Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Order condition = new Order();
        // 如果登录用户是租客，查询该租客的订单
        if (loginUserIsCustomer()) {
            condition.setCustomerUserId(getLoginUserId());
        }
        // 如果登录用户是房东，查询该房东的订单
        else if (loginUserIsOwner()) {
            condition.setOwnerUserId(getLoginUserId());
        }
        //否则，管理员，查询所有的订单
        Page<Order> orderPage = orderService.findAll(page, condition);
        for (Order order : orderPage.getRecords()) {
            // 封装订单的，房屋信息、租客用户信息和房东信息
            // TODO 这个地方性能可以优化
            order.setHouse(houseService.get(order.getHouseId()));
            order.setOwnerUser(userService.get(order.getOwnerUserId()));
            order.setCustomerUser(userService.get(order.getCustomerUserId()));
        }
        model.addAttribute("pageInfo", orderPage);

        model.addAttribute("tab", "order-list");
        model.addAttribute("pagePrefix", "/admin/order?");
        return "admin/order-list";
    }


    /**
     * 取消订单
     *
     * @param orderId
     * @return
     */
    @RequestMapping(value = "/admin/order/cancel", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult cancelOrder(@RequestParam("orderId") Long orderId) {
        // 校验
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("订单不存在");
        }
        // 登录用户不是该订单的租客，不是房东，不是管理员，就不能查看合同
        Long loginUserId = getLoginUserId();
        if (!Objects.equals(loginUserId, order.getCustomerUserId()) &&
                !Objects.equals(loginUserId, order.getOwnerUserId()) &&
                !loginUserIsAdmin()) {
            return JsonResult.error("没有权限");
        }

        order.setStatus(OrderStatusEnum.CUSTOMER_CANCEL.getValue());
        orderService.update(order);
        return JsonResult.success("取消成功");
    }


    /**
     * 提前退租
     *
     * @param orderId
     * @return
     */
    @RequestMapping(value = "/admin/order/end", method = RequestMethod.POST)
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public JsonResult endOrder(@RequestParam("orderId") Long orderId) {
        // 校验
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("订单不存在");
        }
        // 登录用户不是该订单的租客，不是房东，不是管理员，就不能查看合同
        Long loginUserId = getLoginUserId();
        if (!Objects.equals(loginUserId, order.getCustomerUserId()) &&
                !Objects.equals(loginUserId, order.getOwnerUserId()) &&
                !loginUserIsAdmin()) {
            return JsonResult.error("没有权限");
        }

        // 更新订单金额、天数、状态
        order.setStatus(OrderStatusEnum.FINISH.getValue());
        Date toDay = new Date();
        int dayNum = DateUtil.daysBetween(toDay, order.getStartDate());
        order.setDayNum(dayNum);
        order.setTotalAmount(order.getMonthRent() / 30 * dayNum);
        order.setEndDate(new Date());
        orderService.update(order);

        // 重置房子状态为未租出
        House house = houseService.get(order.getHouseId());
        if (house != null && Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
            house.setStatus(HouseStatusEnum.NOT_RENT.getValue());
            house.setLastOrderEndTime(new Date());
            houseService.update(house);
        }
        return JsonResult.success("退租成功");
    }





}
