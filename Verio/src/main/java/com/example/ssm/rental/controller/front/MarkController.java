package com.example.ssm.rental.controller.front;

import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.enums.FeedbackStatusEnum;
import com.example.ssm.rental.entity.Feedback;
import com.example.ssm.rental.entity.Mark;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.FeedbackService;
import com.example.ssm.rental.service.MarkService;
import com.example.ssm.rental.common.dto.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * 收藏控制器
 *
 * @author 言曌
 * @date 2021/3/13 4:55 下午
 */
@RestController("markController")
public class MarkController extends BaseController {

    @Autowired
    private MarkService markService;

    /**
     * 收藏提交
     *
     * @param houseId
     * @return
     */
    @RequestMapping(value = "/mark/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult submit(@RequestParam("houseId") Long houseId) {
        User loginUser = getLoginUser();
        if (loginUser == null) {
            return JsonResult.error("请先登录");
        }
        // 判断是否已经收藏过了
        List<Mark> markList = markService.findByUserIdAndHouseId(loginUser.getId(), houseId);
        if (markList != null && markList.size() > 0) {
            return JsonResult.error("已经收藏过了");
        }

        Mark mark = new Mark();
        mark.setCreateTime(new Date());
        mark.setUserId(loginUser.getId());
        mark.setHouseId(houseId);
        markService.insert(mark);
        return JsonResult.success("收藏成功");
    }
}
