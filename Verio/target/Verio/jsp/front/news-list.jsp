<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/13
  Time: 5:37 下午
  新闻列表
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
                        <li class="breadcrumb-item active" aria-current="page">新闻资讯</li>
                    </ol>
                    <h2 class="breadcrumb-title">新闻信息</h2>
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

            <c:forEach items="${pageInfo.records}" var="c">
                <div class="col-lg-12 col-md-12">

                    <!-- Single Block Wrap -->
                    <div class="property_block_wrap style-2">

                        <div class="property_block_wrap_header">
                            <a  href="/news/detail/${c.id}" >
                                <h4 class="property_block_title">${c.title}</h4>
                            </a>
                        </div>
                        <div id="clOne" class="panel-collapse collapse show" aria-expanded="true">
                            <div class="block-body">
                                    ${c.summary}
                                    <p style="margin-top: 5px;">发布时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${c.createTime}" /></p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- /row -->

        <!-- Pagination 分页 -->
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <%@ include file="../common/page.jsp" %>
            </div>
        </div>

    </div>

</section>
<!-- ============================ Agency List End ================================== -->


<%@ include file="../common/footer.jsp" %>


</body>
</html>
