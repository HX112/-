<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/13
  Time: 5:37 下午
  房子详情
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<!-- ============================ 房子名称 Property Detail Head Start ================================== -->
<div class="pt-5 pb-5 gray-simple">
    <div class="container">

        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10 col-sm-12">
                <div class="prt_detail_three_clicks">
                    <div class="pdt_clicks_price"><h4>¥ ${house.monthRent}/月</h4></div>
                    <div class="pdt_clicks_title"><h3>${house.title}</h3></div>
                    <div class="pdt_clicks_location"><span><i class="ti-location-pin"></i></span>${house.address}</div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- ============================ Property Detail Head End ================================== -->

<!-- ============================ 地图 Map & Gallery Part Start ================================== -->
<div class="pt-5 pb-5">
    <div class="container-fluid p-0">

        <div class="row">
            <div class="col-lg-12 col-md-12 mb-4">
                <div class="mapg_part_nav">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="gallery-tab" onclick="toggleGallery()" role="tab"
                               aria-controls="gallery" aria-selected="true"><i class="ti-gallery mr-1"></i>照片</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="map-tab" onclick="toggleMap()" role="tab" aria-controls="map"
                               aria-selected="false"><i class="ti-map-alt mr-1"></i>地图</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row justify-content-center no-flex">
            <div class="mapg_part_caption">
                <div class="tab-content" id="myTabContent">
                    <!-- Gallery -->
                    <div class="tab-pane active" id="gallery" role="tabpanel" aria-labelledby="gallery-tab">
                        <div class="featured_slick_gallery gray">
                            <div class="featured_slick_gallery-slide">
                                <c:forEach items="${house.slideImgList}" var="url">
                                    <div class="featured_slick_padd">
                                        <a href="${url}" class="mfp-gallery">
                                            <img style="height: 400px;width: 100%;" src="${url}"
                                                 class="img-fluid mx-auto" alt=""/></a></div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>


                    <!-- Map -->
                    <div class="tab-pane " id="map" role="tabpanel" aria-labelledby="map-tab">
                        <div class="map-container">
                            <iframe src="/house/map?id=1" width="100%" height="500px;"></iframe>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>
<!-- ============================ Map & Gallery Part End ================================== -->


<!-- ============================ Property Detail Start ================================== -->
<section class="gray-dark">
    <div class="container">
        <div class="row">

            <!-- property main detail -->
            <div class="col-lg-8 col-md-12 col-sm-12">

                <!-- Single Block Wrap -->
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header">
                        <a data-toggle="collapse" data-parent="#features" href="#clOne" aria-expanded="true"><h4
                                class="property_block_title">房子详细信息</h4></a>
                    </div>
                    <div id="clOne" class="panel-collapse collapse show" aria-expanded="true">
                        <div class="block-body">
                            <ul class="deatil_features">
                                <li><strong>状态:</strong>
                                    <c:choose>
                                        <c:when test="${house.status == 1}">正在出租</c:when>
                                        <c:when test="${house.status == 0}">已租出</c:when>
                                        <c:when test="${house.status == -1}">已下架</c:when>
                                        <c:when test="${house.status == -2}">待审核</c:when>
                                        <c:when test="${house.status == -3}">审核驳回</c:when>
                                        <c:otherwise>未知状态</c:otherwise>
                                    </c:choose>
                                </li>
                                <li><strong>租金:</strong>¥ ${house.monthRent}/月</li>
                                <li><strong>房产证编号:</strong>${house.certificateNo}</li>
                                <li><strong>卧室数量:</strong>${house.bedroomNum}</li>
                                <li><strong>卫生间数量:</strong>${house.toiletNum}</li>
                                <li><strong>厨房数量:</strong>${house.kitchenNum}</li>
                                <li><strong>客厅数量:</strong>${house.livingRoomNum}</li>
                                <li><strong>房屋/房间面积:</strong>${house.area}m²</li>
                                <li><strong>是否有空调:</strong>
                                    <c:choose>
                                        <c:when test="${house.hasAirConditioner == 1}">有空调</c:when>
                                        <c:otherwise>无空调</c:otherwise>
                                    </c:choose>
                                </li>
                                <li><strong>建成年份:</strong>${house.buildYear}</li>
                                <li><strong>朝向:</strong>${house.direction}</li>
                                <li><strong>楼层:</strong>${house.floor}/${house.maxFloor}</li>
                                <li><strong>是否有电梯:</strong>
                                    <c:choose>
                                        <c:when test="${house.hasElevator == 1}">有电梯</c:when>
                                        <c:otherwise>无电梯</c:otherwise>
                                    </c:choose>
                                </li>
                                <li><strong>最近一次入住开始时间:</strong><fmt:formatDate pattern="yyyy-MM-dd"
                                                                                value="${house.lastOrderStartTime}"/>
                                </li>
                                <li><strong>最近一次入住结束时间:</strong><fmt:formatDate pattern="yyyy-MM-dd"
                                                                                value="${house.lastOrderStartTime}"/>
                                </li>
                                <li><strong>联系人姓名:</strong>${house.contactName}</li>
                                <li><strong>联系人手机号:</strong>${house.contactPhone}</li>
                            </ul>
                        </div>
                    </div>

                </div>

                <!-- Single Block Wrap -->
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header">
                        <a data-toggle="collapse" data-parent="#dsrp" href="#clTwo" aria-expanded="true"><h4
                                class="property_block_title">详细描述</h4></a>
                    </div>
                    <div id="clTwo" class="panel-collapse collapse show" aria-expanded="true">
                        <div class="block-body">
                            ${house.content}
                        </div>
                    </div>
                </div>

                <!-- Single Block Wrap -->
                <c:if test="${house.rentType == 'share'}">
                    <div class="property_block_wrap style-2" id="shareHouse">

                        <div class="property_block_wrap_header">
                            <a data-toggle="collapse" data-parent="#rev" href="#clEight" aria-expanded="true"><h4
                                    class="property_block_title">合租情况</h4></a>
                        </div>

                        <div id="clEight" class="panel-collapse collapse show" aria-expanded="true">
                            <div class="block-body">
                                <div class="author-review">
                                    <div class="comment-list">
                                        <ul>
                                            <c:forEach items="${house.shareHouseList}" var="c">
                                                <li class="article_comments_wrap">
                                                    <article>
                                                        <div class="article_comments_thumb">
                                                            <a href="/house/detail/${c.id}" target="_blank">
                                                                <img src="${c.thumbnailUrl}" alt=""
                                                                     style="border-radius: 0;">
                                                            </a>
                                                        </div>
                                                        <div class="comment-details">
                                                            <div class="comment-meta">
                                                                <div class="comment-left-meta">
                                                                    <a href="/house/detail/${c.id}" target="_blank">
                                                                        <h4 class="author-name">${c.title}</h4>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <c:choose>
                                                                <c:when test="${c.currentOrder != null}">
                                                                    <div class="comment-text">
                                                                        <p>
                                                                            性别：${c.currentOrder.customerUser.sex}，职业：${c.currentOrder.customerUser.job}</p>
                                                                        <p>爱好：${c.currentOrder.customerUser.hobby}</p>
                                                                        <p>
                                                                            个人说明：${c.currentOrder.customerUser.userDesc}</p>
                                                                        <p>入住日期： <fmt:formatDate pattern="yyyy-MM-dd"
                                                                                                 value="${c.currentOrder.startDate}"/></p>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="comment-text">
                                                                        暂未租出
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </article>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </c:if>
                <!-- Single Block Wrap -->
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header">
                        <a data-toggle="collapse" data-parent="#loca" href="#clSix" aria-expanded="true"
                           class="collapsed"><h4 class="property_block_title">地图位置</h4></a>
                    </div>

                    <div id="clSix" class="panel-collapse collapse show" aria-expanded="true">
                        <div class="block-body">
                            <div class="map-container">
                                <iframe src="/house/map?id=${house.id}" width="100%" height="300px;"></iframe>
                            </div>

                        </div>
                    </div>

                </div>

                <!-- Single Block Wrap -->
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header">
                        <a data-toggle="collapse" data-parent="#gal" href="#clSev" aria-expanded="true"
                           class="collapsed"><h4 class="property_block_title">Gallery</h4></a>
                    </div>

                    <div id="clSev" class="panel-collapse collapse show" aria-expanded="true">
                        <div class="block-body">
                            <ul class="list-gallery-inline">
                                <c:forEach items="${house.slideImgList}" var="url">
                                    <li>
                                        <a href="${url}" class="mfp-gallery">
                                            <img src="${url}" class="img-fluid mx-auto" alt=""/>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                </div>

            </div>

            <!-- property Sidebar -->
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="property-sidebar">

                    <!-- Share & Like Button -->
                    <div class="like_share_wrap b-0">
                        <ul class="like_share_list">
                            <%--                            <li><a href="#" class="btn btn-likes" data-toggle="tooltip" data-original-title="Share"><i class="fas fa-share"></i>Share</a></li>--%>
                            <li><a href="javascript:void(0)" class="btn btn-likes" onclick="submitMark(${house.id})"><i
                                    class="fas fa-heart"></i>收藏</a></li>
                        </ul>
                    </div>

                    <div class="agent-_blocks_wrap b-0">
                        <div class="side-booking-header">
                            <h3 class="price">
                                ¥ <fmt:formatNumber value="${house.monthRent/30 }" pattern="#"
                                                    type="number"/>&nbsp;/日</h3>
                        </div>
                        <div class="side-booking-body">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-6">
                                    <div class="form-group">
                                        <label>入住日期，即今日</label>
                                        <div class="cld-box">
                                            <i class="ti-calendar"></i>
                                            <input type="text" name="checkin" id="startDate" class="form-control"
                                                   disabled/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-6">
                                    <input type="hidden" id="houseId" value="${house.id}">
                                    <div class="form-group">
                                        <label>退租日期，请选择</label>
                                        <div class="cld-box">
                                            <i class="ti-calendar"></i>
                                            <input type="text" name="checkout" id="endDate" class="form-control"/>
                                        </div>
                                    </div>
                                </div>

                                <%--                                <div class="side-booking-foot">--%>
                                <%--                                    <span class="sb-header-left">Total</span>--%>
                                <%--                                    <h3 class="price theme-cl" id="totalAmount"></h3>--%>
                                <%--                                </div>--%>

                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="stbooking-footer mt-1">
                                        <div class="form-group mb-0 pb-0">
                                            <c:choose>
                                                <c:when test="${house.status == 1}">
                                                    <a href="javascript:void(0)" onclick="createOrder()"
                                                       class="btn btn-md full-width btn-theme bg-2">立即预定</a>
                                                </c:when>
                                                <c:when test="${house.status == 0}">
                                                    <a href="javascript:void(0)" disabled
                                                       class="btn btn-md full-width btn-theme bg-red">已租出</a>
                                                </c:when>
                                                <c:when test="${house.status == -1}">
                                                    <a href="javascript:void(0)" disabled
                                                       class="btn btn-md full-width btn-theme bg-red">已下架</a>
                                                </c:when>
                                            </c:choose>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Agent Detail -->
                    <div class="agent-_blocks_wrap b-0">
                        <div class="side-block-header">
                            <h3 class="title">联系房东</h3>
                        </div>
                        <div class="side-block-body">
                            <form action="" id="contactForm">
                                <div class="row">
                                    <input type="hidden" name="houseId" value="${house.id}">
                                    <div class="col-lg-12 col-md-12 col-sm-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="name" placeholder="我的姓名"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="email" placeholder="我的电子邮箱"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="phone" placeholder="我的手机号"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <textarea class="form-control" name="content"
                                                      placeholder="想要发的信息内容"></textarea>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <div class="stbooking-footer mt-1">
                                            <div class="form-group mb-0 pb-0">
                                                <a href="javascript:void(0)" onclick="submitContact()"
                                                   class="btn btn-md full-width btn-theme bg-2">发送邮件信息</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</section>
<!-- ============================ Property Detail End ================================== -->


<%@ include file="../common/footer.jsp" %>
<!-- Date Booking Script -->
<script src="/assets/js/moment.min.js"></script>
<script src="/assets/js/daterangepicker.js"></script>
<script>

    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var date = now.getDate();
    // 月/日/年
    var today = month + '/' + date + '/' + year;

    $(function () {
        $('input[name="checkin"]').daterangepicker({
            singleDatePicker: true
        });
        $('input[name="checkin"]').val(today);
        $('input[name="checkin"]').attr("placeholder", "入住日期");
    });

    // Check In & Check Out Daterange Script
    $(function () {
        $('input[name="checkout"]').daterangepicker({
            singleDatePicker: true,
            format: "yy-mm-dd"
        });
        $('input[name="checkout"]').val(today);
        $('input[name="checkout"]').attr("placeholder", "退租日期");
    });


</script>

</body>
</html>
