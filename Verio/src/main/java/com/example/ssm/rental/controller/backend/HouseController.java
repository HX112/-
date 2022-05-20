package com.example.ssm.rental.controller.backend;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.enums.HouseStatusEnum;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 反馈控制器
 *
 * @author 言曌
 * @date 2021/3/14 10:00 上午
 */
@Controller("backHouseController")
public class HouseController extends BaseController {

    @Autowired
    private HouseService houseService;

    /**
     * 房子管理
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/house")
    public String allHouse(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                           @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                           Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        House condition = new House();
        // 如果登录用户不是管理员，查询该用户的房子，否则管理员查询所有的房子
        if (!loginUserIsAdmin()) {
            condition.setUserId(getLoginUserId());
        }
        Page<House> housePage = houseService.findAll(page, condition);
        model.addAttribute("pageInfo", housePage);

        model.addAttribute("tab", "house-list");
        model.addAttribute("pagePrefix", "/admin/house?");

        model.addAttribute("isAdmin", loginUserIsAdmin());
        return "admin/house-list";
    }


    /**
     * 发布/编辑房子信息
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/house/publish")
    public String publish(@RequestParam(value = "id", required = false) Long id, Model model) {
        House house;
        if (id != null) {
            // 如果要编辑的房子不存在，则跳转404
            house = houseService.get(id);
            if (house == null) {
                return this.renderNotFound();
            }
            // 如果编辑别人的房子，则跳转403
            if (!loginUserIsAdmin() && !Objects.equals(house.getUserId(), getLoginUserId())) {
                return this.renderNotAllowAccess();
            }
        } else {
            house = new House();
        }
        model.addAttribute("house", house);
        model.addAttribute("tab", "house-publish");
        return "admin/house-publish";
    }


    /**
     * 发布房子提交
     *
     * @return
     */
    @RequestMapping(value = "/admin/house/publish/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult publishSubmit(House house, @RequestParam("key") String imgKey, HttpSession session) {
        try {
            // 发布房子，设置用户ID
            if (house.getId() == null) {
                house.setCreateTime(new Date());
                house.setUserId(getLoginUserId());
            }

            // 设置轮播图第一张图片为缩略图
            List<String> imgUrlList = (List<String>) session.getAttribute(Constant.SESSION_IMG_PREFIX + imgKey);
            if (imgUrlList != null && imgUrlList.size() > 0) {
                house.setThumbnailUrl(imgUrlList.get(0));
                house.setSlideUrl(JSON.toJSONString(imgUrlList));
            }
            // 校验经纬度坐标
            if (house.getLongitudeLatitude() != null && !house.getLongitudeLatitude().contains(",")) {
                return JsonResult.error("请输入合法的经纬度坐标");
            }

            // 状态，待审核
            house.setStatus(HouseStatusEnum.NOT_CHECK.getValue());
            house.setUserId(getLoginUserId());
            houseService.insertOrUpdate(house);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("发布失败，请填写完整信息");
        }
        return JsonResult.success("发布成功", house.getId());
    }


    /**
     * 删除房子
     *
     * @return
     */
    @RequestMapping(value = "/admin/house/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteHouse(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("房子不存在");
            }
            if (!loginUserIsAdmin() && !Objects.equals(house.getUserId(), getLoginUserId())) {
                return JsonResult.error("没有权限删除，这不是你的房子");
            }
            if (Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
                return JsonResult.error("房子正在租住中，不能删除");
            }
            houseService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("删除房子失败");
        }
        return JsonResult.success("删除成功");
    }

    /**
     * 上架房子
     * 正在租住的房子，不能手动上架，需要等时间到了，自动上架
     *
     * @return
     */
    @RequestMapping(value = "/admin/house/up", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult upHouse(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("房子不存在");
            }
            if (!loginUserIsAdmin() && !Objects.equals(house.getUserId(), getLoginUserId())) {
                return JsonResult.error("没有权限删除，这不是你的房子");
            }
            if (Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
                return JsonResult.error("房子正在租住中，不能下架");
            }
            house.setStatus(HouseStatusEnum.NOT_RENT.getValue());
            houseService.update(house);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("上架房子失败");
        }
        return JsonResult.success("上架成功");
    }

    /**
     * 下架房子
     *
     * @return
     */
    @RequestMapping(value = "/admin/house/down", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult downHouse(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("房子不存在");
            }
            if (!loginUserIsAdmin() && !Objects.equals(house.getUserId(), getLoginUserId())) {
                return JsonResult.error("没有权限删除，这不是你的房子");
            }
            if (Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
                return JsonResult.error("房子正在租住中，不能下架");
            }
            house.setStatus(HouseStatusEnum.HAS_DOWN.getValue());
            houseService.update(house);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("下架房子失败");
        }
        return JsonResult.success("下架成功");
    }


    /**
     * 审核通过
     *
     * @return
     */
    @RequestMapping(value = "/admin/house/checkPass", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult checkPass(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("房子不存在");
            }
            if (!loginUserIsAdmin()) {
                return JsonResult.error("没有权限审核");
            }
            if (!Objects.equals(house.getStatus(), HouseStatusEnum.NOT_CHECK.getValue())) {
                return JsonResult.error("只能审核待审核的房子");
            }
            house.setStatus(HouseStatusEnum.NOT_RENT.getValue());
            houseService.update(house);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("审核通过失败");
        }
        return JsonResult.success("审核通过成功");
    }


    /**
     * 审核不通过
     *
     * @return
     */
    @RequestMapping(value = "/admin/house/checkReject", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult checkReject(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("房子不存在");
            }
            if (!loginUserIsAdmin()) {
                return JsonResult.error("没有权限审核");
            }
            if (!Objects.equals(house.getStatus(), HouseStatusEnum.NOT_CHECK.getValue())) {
                return JsonResult.error("只能审核待审核的房子");
            }
            house.setStatus(HouseStatusEnum.CHECK_REJECT.getValue());
            houseService.update(house);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("审核拒绝失败");
        }
        return JsonResult.success("审核拒绝成功");
    }


}
