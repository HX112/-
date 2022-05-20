<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/13
  Time: 5:37 下午
  反馈，联系我们
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>



<!-- ============================ Page Title Start================================== -->
<div class="page-title" style="background:#f4f4f4 url(/assets/img/inner-banner.jpg);" data-overlay="5">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">

                <div class="breadcrumbs-wrap">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">用户反馈</li>
                    </ol>
                    <h2 class="breadcrumb-title">快速反馈，联系我们</h2>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- ============================ Page Title End ================================== -->

<!-- ============================ Agency List Start ================================== -->
<section class="gray-simple">

    <div class="container">

        <!-- row Start -->
        <div class="row">

            <div class="col-lg-8 col-md-7">
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header no-collapse">
                        <h4 class="property_block_title">填写你的反馈信息</h4>
                    </div>

                    <div class="block-body">
                        <form class="form-simple" id="feedbackForm">
                            <div class="row">
                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group">
                                        <label>姓名</label>
                                        <input type="text" name="contactName" class="form-control simple">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group">
                                        <label>电子邮箱</label>
                                        <input type="email" name="contactEmail" class="form-control simple">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>标题</label>
                                <input type="text" name="title" class="form-control simple">
                            </div>

                            <div class="form-group">
                                <label>内容</label>
                                <textarea class="form-control simple" name="content"></textarea>
                            </div>

                            <div class="form-group">
                                <button class="btn btn-theme bg-2" type="button" onclick="submitFeedback()">提交</button>
                            </div>
                        </form>
                    </div>

                </div>

            </div>

            <div class="col-lg-4 col-md-5">

                <div class="contact-box">
                    <i class="ti-location-pin"></i>
                    <h4>公司地址位置</h4>
                    <p>北京XXXXXX</p>
                </div>

                <div class="contact-box">
                    <i class="ti-email"></i>
                    <h4>联系我们</h4>
                    <p>contact@abcd.com</p>
                    <span>400 100 1234</span>
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
