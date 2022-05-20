<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/14
  Time: 9:57 上午
  订单列表
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

                    <div class="dashboard-wraper">

                        <!-- Bookmark Property -->
                        <div class="frm_submit_block">
                            <h4>订单管理</h4>
                        </div>

                        <table class="property-table-wrap responsive-table bkmark">

                            <tbody>
                            <tr>
                                <th><i class="fa fa-file-text"></i> 订单列表</th>
                                <th>租客</th>
                                <th>房东</th>
                                <th>操作</th>
                            </tr>

                            <c:forEach items="${pageInfo.records}" var="c">
                                <tr>
                                    <td class="dashboard_propert_wrapper">
                                        <img src="${c.house.thumbnailUrl}" alt="">
                                        <div class="title">
                                            <h4><a href="/house/detail/${c.houseId}" target="_blank">${c.house.title}</a></h4>
                                            <span>${c.house.address}</span>
                                            <span class="table-property-price">开始时间：
                                                <fmt:formatDate pattern="yyyy-MM-dd" value="${c.startDate}"/><br/>
                                                到期时间：<fmt:formatDate pattern="yyyy-MM-dd" value="${c.endDate}"/>
                                            </span>
                                            <span class="table-property-price">总金额：¥ ${c.totalAmount}</span>
                                                <%--   订单状态：-2待签合同，-1待付款，0生效中，1已到期，-3已取消--%>
                                            <c:choose>
                                                <c:when test="${c.status == -2}"> <span
                                                        class="text-warning"> 待签合同 </span></c:when>
                                                <c:when test="${c.status == -1}"> <span
                                                        class="text-warning"> 待付款 </span></c:when>
                                                <c:when test="${c.status == 0}"> <span
                                                        class="text-success"> 合同已生效 </span></c:when>
                                                <c:when test="${c.status == 1}"> <span
                                                        class="text-danger"> 已退租 </span></c:when>
                                                <c:when test="${c.status == -3}"> <span
                                                        class="text-warning"> 订单已取消 </span></c:when>
                                            </c:choose>

                                        </div>
                                    </td>
                                    <td>
                                            ${c.customerUser.userDisplayName}<br/>${c.customerUser.phone}
                                    </td>
                                    <td>
                                            ${c.ownerUser.userDisplayName}<br/>${c.ownerUser.phone}
                                    </td>
                                    <td>
                                        <a class="delete" href="/order/agreement/view?orderId=${c.id}" target="_blank">查看合同</a>
                                        <br>

                                        <c:if test="${c.status == -2 || c.status == -1}">
                                            <a class="delete" href="javascript:void(0)"
                                               onclick="cancelOrder(${c.id})">取消订单</a>
                                        </c:if>
                                        <c:if test="${c.status == 0}">
                                            <a class="delete" href="javascript:void(0)"
                                               onclick="endOrder(${c.id})">提前退租</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>

                    </div>

                    <!-- Pagination 分页 -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <%@ include file="../common/page.jsp" %>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-lg-12 mt-4">
                            <footer class="text-center">
                                <p class="mb-0">© 2021 Saysky. All Rights Reserved</p>
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
