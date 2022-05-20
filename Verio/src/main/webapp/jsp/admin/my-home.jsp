<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/14
  Time: 9:57 上午
  我的家
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
                            <h4>我的家</h4>
                        </div>

                        <table class="property-table-wrap responsive-table bkmark">

                            <tbody>
                            <tr>
                                <th><i class="fa fa-file-text"></i>我的家信息</th>
                                <th>类型</th>
                                <th>房东</th>
                            </tr>

                            <c:forEach items="${pageInfo.records}" var="c">
                                <tr>
                                    <td class="dashboard_propert_wrapper">
                                        <img src="${c.house.thumbnailUrl}" alt="">
                                        <div class="title">
                                            <h4><a href="/house/detail/${c.houseId}"
                                                   target="_blank">${c.house.title}</a></h4>
                                            <span>${c.house.address}</span>
                                            <span>到期时间：<fmt:formatDate pattern="yyyy-MM-dd" value="${c.endDate}"/></span>
                                        </div>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${c.house.rentType == 'share'}">
                                                <span class="text-success">合租</span> <br>
                                                <a href="/house/detail/${c.houseId}#shareHouse" target="_blank">合租情况</a>

                                            </c:when>
                                            <c:otherwise> <span class="text-blue">整租</span> </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="action">
                                        ${c.ownerUser.userDisplayName} <br/>
                                        ${c.ownerUser.phone} <br/>
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
