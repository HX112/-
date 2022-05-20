<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/14
  Time: 9:57 上午
  房子列表
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<!-- ============================ User Dashboard ================================== -->
<section class="p-0">
    <div class="container-fluid p-0">

        <div class="row">

            <%@ include file="../common/admin-left.jsp" %>


            <div class="col-lg-9 col-md-8 col-sm-12">
                <div class="dashboard-body">


                    <div class="frm_submit_block">
                        <h4>房子管理 <a href="/admin/house/publish" class="btn btn-theme bg-2 btn-sm">发布新房子</a></h4>
                    </div>

                    <div class="row">

                        <c:forEach items="${pageInfo.records}" var="c">
                            <!-- Single Property -->
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="dashboard_property_list">
                                    <div class="dashboard_property_list_thumb">
                                        <img src="${c.thumbnailUrl}" class="img-fluid" alt=""/>
                                        <c:choose>
                                            <c:when test="${c.status == 1}">
                                                <span class="dashboard_pr_status">未租出</span>
                                            </c:when>
                                            <c:when test="${c.status == 0}">
                                                <span class="dashboard_pr_status published">已租出</span>
                                            </c:when>
                                            <c:when test="${c.status == -1}">
                                                <span class="dashboard_pr_status expire">已下架</span>
                                            </c:when>
                                            <c:when test="${c.status == -2}">
                                                <span class="dashboard_pr_status expire">待审核</span>
                                            </c:when>
                                            <c:when test="${c.status == -3}">
                                                <span class="dashboard_pr_status expire">审核驳回</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="dashboard_pr_status ">未知状态</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="dashboard_property_list_content">
                                        <h4>${c.title}</h4>
                                        <span><i class="ti-location-pin"></i>${c.address}</span>
                                    </div>
                                    <div class="dashboard_property_list_footer">
                                        <a href="/house/detail/${c.id}" data-toggle="tooltip" title="查看"><i
                                                class="ti-eye"></i></a>

                                            <%--   已租出的房子无法修改信息     --%>
                                        <c:if test="${c.status != 0}">
                                            <a href="/admin/house/publish?id=${c.id}" data-toggle="tooltip"
                                               title="编辑"><i
                                                    class="ti-pencil"></i></a>
                                        </c:if>

                                        <c:choose>
                                            <c:when test="${c.status == 1}">
                                                <a href="javascript:void(0)" onclick="downHouse(${c.id})"
                                                   data-toggle="tooltip" title="下架"><i class="ti-control-pause"></i></a>
                                            </c:when>
                                            <c:when test="${c.status == -1}">
                                                <a href="javascript:void(0)" onclick="upHouse(${c.id})"
                                                   data-toggle="tooltip" title="上架" data-original-title="Running"><i
                                                        class="ti-control-play"></i></a>
                                            </c:when>
                                        </c:choose>
                                        <a href="javascript:void(0)" onclick="deleteHouse(${c.id})"
                                           data-toggle="tooltip" title="删除"><i class="ti-close"></i></a>

                                        <c:if test="${isAdmin && c.status == -2}">
                                            <a href="javascript:void(0)" onclick="checkPassHouse(${c.id})"
                                               data-toggle="tooltip" title="审核通过"><i class="ti-arrow-up"></i></a>
                                            <a href="javascript:void(0)" onclick="checkRejectHouse(${c.id})"
                                               data-toggle="tooltip" title="审核驳回"><i class="ti-arrow-down"></i></a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                    <!-- row -->

                    <!-- Pagination 分页 -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <%@ include file="../common/page.jsp" %>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-lg-12 mt-4">
                            <footer class="text-center">
                                <p class="mb-0">© 2021 Saysky. All Rights
                                    Reserved</p>
                            </footer>
                        </div>
                    </div>
                    <!-- row -->

                </div>

            </div>

        </div>
    </div>
</section>
<!-- ============================ User Dashboard End ================================== -->


<%@ include file="../common/footer.jsp" %>
</body>
</html>
