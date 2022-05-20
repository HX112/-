<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/14
  Time: 9:57 上午
  房子发布
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>
<link rel="stylesheet" href="/assets/plugins/bootstrap-fileinput/css/fileinput.min.css">


<!-- ============================ User Dashboard ================================== -->
<section class="p-0">
    <div class="container-fluid p-0">

        <div class="row">

            <%@ include file="../common/admin-left.jsp" %>


            <div class="col-lg-9 col-md-8 col-sm-12">


                <!-- ============================ Submit Property Start ================================== -->
                <section style="padding-top: 10px;">

                    <div class="container">
                        <div class="row">
                            <form action="" id="houseForm">
                                <input type="hidden" name="id" value="${house.id}">
                                <input type="hidden" id="key" name="key">
                                <!-- Submit Form -->
                                <div class="col-lg-12 col-md-12">

                                    <div class="submit-page form-simple">

                                        <!-- Basic Information -->
                                        <div class="frm_submit_block">
                                            <h3>基本信息</h3>
                                            <div class="frm_submit_wrap">
                                                <div class="form-row">

                                                    <div class="form-group col-md-6">
                                                        <label>出租类型</label>
                                                        <select name="rentType" class="form-control">
                                                            <option value="whole"
                                                                    <c:if test="${house.rentType == 'whole'}">selected</c:if>>
                                                                整租
                                                            </option>
                                                            <option value="share"
                                                                    <c:if test="${house.rentType == 'share'}">selected</c:if>>
                                                                合租
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>月租金<a href="#" class="tip-topdata"
                                                                     data-tip="日租金 = 月租金/30"><i class="ti-help"></i></a></label>
                                                        <input type="number" name="monthRent" value="${house.monthRent}"
                                                               class="form-control">
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label>所属城市</label>
                                                        <select name="city" class="form-control">
                                                            <option value="北京"
                                                                    <c:if test="${house.city == '北京'}">selected</c:if>>
                                                                北京
                                                            </option>
                                                            <option value="上海"
                                                                    <c:if test="${house.city == '上海'}">selected</c:if>>
                                                                上海
                                                            </option>
                                                            <option value="广州"
                                                                    <c:if test="${house.city == '广州'}">selected</c:if>>
                                                                广州
                                                            </option>
                                                            <option value="深圳"
                                                                    <c:if test="${house.city == '深圳'}">selected</c:if>>
                                                                深圳
                                                            </option>
                                                            <option value="天津"
                                                                    <c:if test="${house.city == '天津'}">selected</c:if>>
                                                                天津
                                                            </option>
                                                            <option value="武汉"
                                                                    <c:if test="${house.city == '武汉'}">selected</c:if>>
                                                                武汉
                                                            </option>
                                                            <option value="长沙"
                                                                    <c:if test="${house.city == '长沙'}">selected</c:if>>
                                                                长沙
                                                            </option>
                                                            <option value="杭州"
                                                                    <c:if test="${house.city == '杭州'}">selected</c:if>>
                                                                杭州
                                                            </option>
                                                            <option value="宁波"
                                                                    <c:if test="${house.city == '宁波'}">selected</c:if>>
                                                                宁波
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>房子标题信息<a href="#" class="tip-topdata"
                                                                        data-tip="如合租-世界花园-4居室-A卧"><i
                                                                class="ti-help"></i></a></label>
                                                        <input type="text" name="title" value="${house.title}"
                                                               class="form-control">
                                                    </div>

                                                    <div class="form-group col-md-8">
                                                        <label>房子详细地址信息<a href="#" class="tip-topdata"
                                                                          data-tip="广东省深圳市南山区世界之窗世纪花园小区12栋305室A卧"><i
                                                                class="ti-help"></i></a></label>
                                                        <input type="text" name="address" value="${house.title}"
                                                               class="form-control">
                                                    </div>

                                                    <div class="form-group col-md-4">
                                                        <label>经纬度坐标，<a
                                                                href="http://api.map.baidu.com/lbsapi/getpoint/index.html"
                                                                target="_blank">点此</a>获取<a href="#" class="tip-topdata"
                                                                                           data-tip="经纬度，如113.933216,22.524803"><i
                                                                class="ti-help"></i></a></label>
                                                        <input type="text" name="longitudeLatitude"
                                                               value="${house.longitudeLatitude}"
                                                               class="form-control">
                                                    </div>


                                                </div>
                                            </div>
                                        </div>


                                        <!-- 房屋结构 -->
                                        <div class="frm_submit_block">
                                            <h3>结构信息</h3>
                                            <div class="frm_submit_wrap">
                                                <div class="form-row">


                                                    <div class="form-group col-md-6">
                                                        <label>房产证号</label>
                                                        <input type="text" name="certificateNo"
                                                               value="${house.certificateNo}" class="form-control">
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label>面积<a href="#" class="tip-topdata"
                                                                    data-tip="整租类型时为整个房子的面积，合租类型时为单间的面积"><i
                                                                class="ti-help"></i></a></label>
                                                        <input type="text" name="area" value="${house.area}"
                                                               class="form-control">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>朝向</label>
                                                        <input type="text" name="direction" value="${house.direction}"
                                                               class="form-control">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>是否有空调</label>
                                                        <select name="hasAirConditioner" class="form-control">
                                                            <option value="1"
                                                                    <c:if test="${house.hasAirConditioner == 1}">selected</c:if>>
                                                                有空调
                                                            </option>
                                                            <option value="0"
                                                                    <c:if test="${house.hasAirConditioner == 0}">selected</c:if>>
                                                                无空调
                                                            </option>
                                                        </select>
                                                    </div>


                                                    <div class="form-group col-md-6">
                                                        <label>卧室数量</label>
                                                        <select name="bedroomNum" class="form-control">
                                                            <option value="1"
                                                                    <c:if test="${house.bedroomNum == 1}">selected</c:if>>
                                                                1个
                                                            </option>
                                                            <option value="2"
                                                                    <c:if test="${house.bedroomNum == 2}">selected</c:if>>
                                                                2个
                                                            </option>
                                                            <option value="3"
                                                                    <c:if test="${house.bedroomNum == 3}">selected</c:if>>
                                                                3个
                                                            </option>
                                                            <option value="4"
                                                                    <c:if test="${house.bedroomNum == 4}">selected</c:if>>
                                                                4个
                                                            </option>
                                                            <option value="5"
                                                                    <c:if test="${house.bedroomNum == 5}">selected</c:if>>
                                                                5个
                                                            </option>
                                                            <option value="6"
                                                                    <c:if test="${house.bedroomNum == 6}">selected</c:if>>
                                                                6个
                                                            </option>
                                                            <option value="7"
                                                                    <c:if test="${house.bedroomNum == 7}">selected</c:if>>
                                                                7个
                                                            </option>
                                                            <option value="8"
                                                                    <c:if test="${house.bedroomNum == 8}">selected</c:if>>
                                                                8个
                                                            </option>
                                                        </select>
                                                    </div>


                                                    <div class="form-group col-md-6">
                                                        <label>客厅数量</label>
                                                        <select name="livingRoomNum" class="form-control">
                                                            <option value="1"
                                                                    <c:if test="${house.livingRoomNum == 1}">selected</c:if>>
                                                                1个
                                                            </option>
                                                            <option value="2"
                                                                    <c:if test="${house.livingRoomNum == 2}">selected</c:if>>
                                                                2个
                                                            </option>
                                                            <option value="3"
                                                                    <c:if test="${house.livingRoomNum == 3}">selected</c:if>>
                                                                3个
                                                            </option>
                                                            <option value="4"
                                                                    <c:if test="${house.livingRoomNum == 4}">selected</c:if>>
                                                                4个
                                                            </option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label>厨房数量</label>
                                                        <select name="kitchenNum" class="form-control">
                                                            <option value="1"
                                                                    <c:if test="${house.kitchenNum == 1}">selected</c:if>>
                                                                1个
                                                            </option>
                                                            <option value="2"
                                                                    <c:if test="${house.kitchenNum == 2}">selected</c:if>>
                                                                2个
                                                            </option>
                                                            <option value="3"
                                                                    <c:if test="${house.kitchenNum == 3}">selected</c:if>>
                                                                3个
                                                            </option>
                                                            <option value="4"
                                                                    <c:if test="${house.kitchenNum == 4}">selected</c:if>>
                                                                4个
                                                            </option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label>卫生间数量</label>
                                                        <select name="toiletNum" class="form-control">
                                                            <option value="1"
                                                                    <c:if test="${house.toiletNum == 1}">selected</c:if>>
                                                                1个
                                                            </option>
                                                            <option value="2"
                                                                    <c:if test="${house.toiletNum == 2}">selected</c:if>>
                                                                2个
                                                            </option>
                                                            <option value="3"
                                                                    <c:if test="${house.toiletNum == 3}">selected</c:if>>
                                                                3个
                                                            </option>
                                                            <option value="4"
                                                                    <c:if test="${house.toiletNum == 4}">selected</c:if>>
                                                                4个
                                                            </option>
                                                        </select>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>

                                        <!-- 建筑信息 -->
                                        <div class="frm_submit_block">
                                            <h3>建筑信息</h3>
                                            <div class="frm_submit_wrap">
                                                <div class="form-row">

                                                    <div class="form-group col-md-6">
                                                        <label>建成年份</label>
                                                        <input type="number" name="buildYear" value="${house.buildYear}"
                                                               class="form-control">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>所在楼层</label>
                                                        <input type="number" name="floor" value="${house.floor}"
                                                               class="form-control">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>总楼层</label>
                                                        <input type="number" name="maxFloor" value="${house.maxFloor}"
                                                               class="form-control">
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label>是否有电梯</label>
                                                        <select name="hasElevator" class="form-control">
                                                            <option value="1"
                                                                    <c:if test="${house.hasElevator == 1}">selected</c:if>>
                                                                有电梯
                                                            </option>
                                                            <option value="0"
                                                                    <c:if test="${house.hasElevator == 0}">selected</c:if>>
                                                                无电梯
                                                            </option>
                                                        </select>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>


                                        <!-- 联系人信息 -->
                                        <div class="frm_submit_block">
                                            <h3>联系人信息</h3>
                                            <div class="frm_submit_wrap">
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label>联系人姓名</label>
                                                        <input type="text" name="contactName"
                                                               value="${house.contactName}" class="form-control">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>联系人电话</label>
                                                        <input type="text" name="contactPhone"
                                                               value="${house.contactPhone}" class="form-control">
                                                    </div>


                                                </div>
                                            </div>
                                        </div>

                                        <!-- Detailed Information -->
                                        <div class="frm_submit_block">
                                            <h3>详细描述</h3>
                                            <div class="frm_submit_wrap">
                                                <div class="form-row">

                                                    <div class="form-group col-md-12">
                                                        <label>房屋详细描述</label>
                                                        <textarea class="form-control h-120"
                                                                  name="content">${house.content}</textarea>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>

                                        <!-- Gallery -->
                                        <div class="frm_submit_block">
                                            <h3>轮播图上传</h3>
                                            <div class="frm_submit_wrap">
                                                <div class="form-row">
                                                    <div class="form-group col-md-12">
                                                        <input type="file" name="file" id="file" multiple
                                                               class="file-loading"/>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="col-lg-12 col-md-12">
                                                <button class="btn btn-theme bg-2" type="button"
                                                        onclick="submitHouse()">发布
                                                </button>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>

                </section>
                <!-- ============================ Submit Property End ================================== -->

            </div>
        </div>
    </div>
</section>
<!-- ============================ User Dashboard End ================================== -->


<%@ include file="../common/footer.jsp" %>
<script src="/assets/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/assets/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
<script>
    $(function () {
        var timestamp = Date.parse(new Date());
        $('#key').val(timestamp);
        var control = $("#file");
        var uploadUrl = "/file/upload?key=" + timestamp;
        control.fileinput({
            language: 'zh', //设置语言
            uploadUrl: uploadUrl, //上传的地址
            allowedFileExtensions: ['png', 'jpeg', 'jpg', 'gif'],//接收的文件后缀
            showUpload: true, //显示批量上传按钮
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            dropZoneEnabled: true,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            minFileCount: 0,
            maxFileCount: 100,
            enctype: 'multipart/form-data',
            validateInitialCount: true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        });
        //导入文件上传完成之后的事件
        $("#file").on("fileuploaded", function (event, data, previewId, index) {
            // alert('上传成功');
        });
    });
</script>
</body>
</html>
