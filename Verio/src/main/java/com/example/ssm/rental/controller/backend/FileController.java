package com.example.ssm.rental.controller.backend;

import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author 言曌
 * @date 2021/3/14 11:22 下午
 */
@Controller
public class FileController extends BaseController {


    /**
     * 照片上传
     *
     * @param file 文件
     * @param key
     * @return JsonResult
     */
    @RequestMapping(value = "/file/upload", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult uploadFile(@RequestParam("file") MultipartFile file,
                                 @RequestParam("key") String key,
                                 HttpSession session) {
        Map<String, String> resultMap = null;
        try {
            resultMap = FileUtil.upload(file);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("上传失败");
        }
        String filePath = resultMap.get("filePath");


        // 把图片URL存在session中
        String sessionKey = Constant.SESSION_IMG_PREFIX + key;
        List<String> imgList = (List<String>) session.getAttribute(sessionKey);
        if (imgList == null) {
            imgList = new ArrayList<>();
        }
        imgList.add(filePath);
        session.setAttribute(sessionKey, imgList);
        return JsonResult.success("上传成功");
    }
}
