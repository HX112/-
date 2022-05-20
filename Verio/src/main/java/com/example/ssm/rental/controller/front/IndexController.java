package com.example.ssm.rental.controller.front;

import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.enums.HouseRentTypeEnum;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 前台首页控制器
 *
 * @author 言曌
 * @date 2021/3/13 2:36 下午
 */
@Controller
public class IndexController extends BaseController {

    @Autowired
    private HouseService houseService;


    /**
     * 首页
     * 显示最近的6个房子
     *
     * @param model model，给jsp页码传值
     * @return 前端文件位置
     */
    @RequestMapping("/")
    public String index(Model model) {
        // 最新整租
        List<House> recentWholeHouseList = houseService.findTopList(HouseRentTypeEnum.WHOLE.getValue(), Constant.INDEX_HOUSE_NUM);
        model.addAttribute("recentWholeHouseList", recentWholeHouseList);

        // 最新合租
        List<House> recentShareHouseList = houseService.findTopList(HouseRentTypeEnum.SHARE.getValue(), Constant.INDEX_HOUSE_NUM);
        model.addAttribute("recentShareHouseList", recentShareHouseList);

        return "front/index";
    }


}
