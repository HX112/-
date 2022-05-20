package com.example.ssm.rental.controller.front;

import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.enums.HouseStatusEnum;
import com.example.ssm.rental.common.enums.OrderStatusEnum;
import com.example.ssm.rental.common.util.DateUtil;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.entity.Order;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.HouseService;
import com.example.ssm.rental.service.OrderService;
import com.example.ssm.rental.service.UserService;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.service.impl.OrderServiceImpl;
import com.example.ssm.rental.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

/**
 * 订单控制器
 *
 * @author 言曌
 * @date 2021/3/13 3:49 下午
 */

@Controller("orderController")
public class OrderController extends BaseController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;

    /**
     * 创建订单
     *
     * @param houseId    房子id
     * @param endDateStr 结束日期，MM/dd/yyyy格式
     * @return
     */
    @RequestMapping("/order/create")
    @ResponseBody
    public JsonResult createOrder(@RequestParam("houseId") Long houseId,
                                  @RequestParam("endDate") String endDateStr) {
        // 数据检查
        House house = houseService.get(houseId);
        if (house == null) {
            return JsonResult.error("房子不存在");
        }
        if (Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
            return JsonResult.error("房子已租出或未释放");
        }


        Order checkOrder = orderService.getCurrentEffectiveOrder(houseId);
        if (checkOrder != null) {
            return JsonResult.error("房子已租出或未释放");
        }
        User ownerUser = userService.get(house.getUserId());
        if (ownerUser == null) {
            return JsonResult.error("房东用户不存在");
        }


        // 处理退租日期
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date startDate = new Date();
        Date endDate;
        try {
            endDate = sdf.parse(endDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
            return JsonResult.error("退租日期格式不合法");
        }
        // 计算总共多少天
        Integer dayNum = DateUtil.daysBetween(startDate, endDate);
        if (dayNum < Constant.MIN_RENT_DAYS) {
            return JsonResult.error("最少租住" + Constant.MIN_RENT_DAYS + "天");
        }


        // 创建订单
        Order order = new Order();

        // 房子ID、租客ID、房东ID
        order.setHouseId(houseId);
        order.setCustomerUserId(getLoginUserId());
        order.setOwnerUserId(ownerUser.getId());

        // 租金、月数、总金额
        order.setMonthRent(house.getMonthRent());
        order.setDayNum(dayNum);
        order.setTotalAmount(house.getMonthRent() / 30 * dayNum);

        // 订单状态：待签合同
        order.setStatus(OrderStatusEnum.NOT_AGREEMENT.getValue());
        order.setStartDate(startDate);
        order.setEndDate(endDate);
        order.setCreateTime(new Date());
        orderService.insert(order);
        return JsonResult.success("订单创建成功，请签订合同", order.getId());
    }

    /**
     * 查看合同信息
     *
     * @param orderId
     * @return
     */
    @RequestMapping("/order/agreement/view")
    public String viewAgreement(@RequestParam(value = "orderId") Long orderId,
                                Model model) {

        Order order = orderService.get(orderId);
        if (order == null) {
            return this.renderNotFound();
        }
        // 登录用户不是该订单的租客，不是房东，不是管理员，就不能查看合同
        Long loginUserId = getLoginUserId();
        if (!Objects.equals(loginUserId, order.getCustomerUserId()) &&
                !Objects.equals(loginUserId, order.getOwnerUserId()) &&
                !loginUserIsAdmin()) {
            return this.renderNotAllowAccess();
        }

        // 查询房子信息
        order.setHouse(houseService.get(order.getHouseId()));

        // 查询租客信息
        order.setCustomerUser(userService.get(order.getCustomerUserId()));

        // 查询房东信息
        order.setOwnerUser(userService.get(order.getOwnerUserId()));

        model.addAttribute("order", order);
        return "front/agreement";
    }

    /**
     * 支付页面
     *
     * @param orderId
     * @return
     */
    @RequestMapping("/order/pay")
    public String pay(@RequestParam(value = "orderId") Long orderId,
                      Model model) {

        Order order = orderService.get(orderId);
        if (order == null) {
            return this.renderNotFound();
        }
        // 登录用户不是该订单的租客，不是房东，不是管理员，就不能查看合同
        Long loginUserId = getLoginUserId();
        if (!Objects.equals(loginUserId, order.getCustomerUserId()) &&
                !Objects.equals(loginUserId, order.getOwnerUserId()) &&
                !loginUserIsAdmin()) {
            return this.renderNotAllowAccess();
        }

        House house = houseService.get(order.getHouseId());
        if (house == null) {
            return this.renderNotFound();
        }
        order.setHouse(house);
        model.addAttribute("order", order);
        return "front/pay";
    }


    /**
     * 签订合同提交
     *
     * @param orderId
     * @return
     */
    @RequestMapping("/order/agreement/submit")
    @ResponseBody
    public JsonResult submitAgreement(@RequestParam("orderId") Long orderId) {
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

        House house = houseService.get(order.getHouseId());
        if (house == null) {
            return JsonResult.error("房子不存在");
        }
        if (Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
            return JsonResult.error("房子已租出或未释放");
        }
        Order checkOrder = orderService.getCurrentEffectiveOrder(house.getId());
        if (checkOrder != null) {
            return JsonResult.error("房子已租出或未释放");
        }

        order.setStatus(OrderStatusEnum.NOT_PAY.getValue());
        orderService.update(order);
        return JsonResult.success("合同签订成功，请支付订单", order.getId());
    }



    /**
     * 支付订单
     *
     * @param orderId
     * @return
     */
    @RequestMapping("/order/pay/submit")
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public JsonResult createOrder(@RequestParam("orderId") Long orderId) {
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

        House house = houseService.get(order.getHouseId());
        if (house == null) {
            return JsonResult.error("房子不存在");
        }
        if (Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
            return JsonResult.error("房子已租出或未释放");
        }
        Order checkOrder = orderService.getCurrentEffectiveOrder(house.getId());
        if (checkOrder != null) {
            return JsonResult.error("房子已租出或未释放");
        }



        // 更新状态和开始时间 结束时间
        order.setStatus(OrderStatusEnum.NORMAL.getValue());
        orderService.update(order);

        // 更新房子状态信息和开始时间结束时间
        house.setStatus(HouseStatusEnum.HAS_RENT.getValue());
        house.setLastOrderStartTime(order.getStartDate());
        house.setLastOrderEndTime(order.getEndDate());
        houseService.update(house);
        return JsonResult.success("支付成功，开始联系房东入住吧");
    }

}
