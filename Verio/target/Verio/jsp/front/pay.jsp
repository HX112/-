<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/14
  Time: 5:54 下午
  合同页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>
<link rel="stylesheet" href="/assets/css/pay.css">

<!-- ============================ Agency List Start ================================== -->
<section class="gray-simple">

    <div class="container">

        <!-- row Start -->
        <div class="row">

            <div class="col-lg-12 col-md-12">
                <div>

                    <div class="mod-ct">
                        <div class="order">
                            ${order.house.title}
                        </div>
                        <div class="amount" id="money">
                            ￥ ${order.totalAmount}
                        </div>
                        <div class="qrcode-img-wrapper" data-role="qrPayImgWrapper">
                            <div data-role="qrPayImg" class="qrcode-img-area">
                                <div class="ui-loading qrcode-loading" data-role="qrPayImgLoading"></div>
                                <div style="position: relative;display: inline-block;">
                                    <img width="200" height="200"
                                         src="/assets/img/alipay_qrcode.png"
                                         title="请尽快支付~"
                                         style="display: block;margin-top: 20px;">
                                </div>
                            </div>
                        </div>

                        <div class="time-item" style="padding-top: 10px">
                            <div class="time-item" id="msg">
                                <h1>支付完成后，将跳转订单列表页面</h1>
                            </div>
                        </div>

                        <div class="tip">
                            <div class="ico-scan-ali"></div>
                            <div class="tip-text">
                                <p id="showtext">打开支付宝 [扫一扫]</p>
                            </div>
                            <div class="tip-text">
                                <button onclick="submitPay(${order.id})" class="btn btn-small btn-success" style="color:#ffffff;" title="支付成功">模拟支付成功</button>
                            </div>
                        </div>

                        <div class="tip-text">
                        </div>

                    </div>


                </div>

            </div>


        </div>
        <!-- /row -->

    </div>

</section>
<!-- ============================ Agency List End ================================== -->


<%@ include file="../common/footer.jsp" %>
</body>
</html>
