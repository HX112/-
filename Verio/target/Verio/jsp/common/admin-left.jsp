<%-- 后台左侧侧边栏--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="col-lg-3 col-md-4 col-sm-12">
    <div class="property_dashboard_navbar">

        <c:choose>
            <%--  管理员  --%>
            <c:when test="${sessionScope.user.role == 'admin'}">
                <div class="dash_user_menues">
                    <ul>
                            <%--                        <li <c:if test="${tab == 'index'}"> class="active"</c:if>><a href="/admin/index"><i--%>
                            <%--                                class="ti-dashboard"></i>仪表盘</a></li>--%>
                        <li <c:if test="${tab == 'my-profile'}"> class="active"</c:if>><a href="/admin/profile"><i
                                class="ti-user"></i>个人信息</a></li>
                        <li <c:if test="${tab == 'house-list'}"> class="active"</c:if>><a href="/admin/house"><i
                                class="ti-layers"></i>房子管理</a></li>
                        <li <c:if test="${tab == 'order-list'}"> class="active"</c:if>><a href="/admin/order"><i
                                class="ti-gift"></i>订单管理</a></li>
                        <li <c:if test="${tab == 'user-list'}"> class="active"</c:if>><a href="/admin/user"><i
                                class="ti-user"></i>用户管理</a></li>
                        <li <c:if test="${tab == 'feedback-list'}"> class="active"</c:if>><a href="/admin/feedback"><i
                                class="ti-alert"></i>反馈管理</a></li>
                        <li <c:if test="${tab == 'news-list'}"> class="active"</c:if>><a href="/admin/news"><i
                                class="ti-new-window"></i>新闻资讯</a></li>
                        <li <c:if test="${tab == 'my-password'}"> class="active"</c:if>><a href="/admin/password"><i
                                class="ti-unlock"></i>密码修改</a></li>
                        <li><a href="/logout"><i class="ti-power-off"></i>退出登录</a></li>
                    </ul>
                </div>
            </c:when>
            <%--  房东  --%>
            <c:when test="${sessionScope.user.role == 'owner'}">
                <div class="dash_user_menues">
                    <ul>
                        <li <c:if test="${tab == 'my-profile'}"> class="active"</c:if>><a href="/admin/profile"><i
                                class="ti-user"></i>个人信息</a></li>
                        <li <c:if test="${tab == 'house-list'}"> class="active"</c:if>><a href="/admin/house"><i
                                class="ti-layers"></i>房子管理</a></li>
                        <li <c:if test="${tab == 'order-list'}"> class="active"</c:if>><a href="/admin/order"><i
                                class="ti-gift"></i>订单管理</a></li>

                        <li <c:if test="${tab == 'house-publish'}"> class="active"</c:if>><a
                                href="/admin/house/publish"><i class="ti-pencil-alt"></i>发布出租</a></li>
                        <li <c:if test="${tab == 'feedback-list'}"> class="active"</c:if>><a href="/admin/feedback"><i
                                class="ti-alert"></i>我的反馈</a></li>
                        <li <c:if test="${tab == 'my-password'}"> class="active"</c:if>><a href="/admin/password"><i
                                class="ti-unlock"></i>密码修改</a></li>
                        <li><a href="/logout"><i class="ti-power-off"></i>退出登录</a></li>
                    </ul>
                </div>
            </c:when>
            <%--  租客  --%>
            <c:when test="${sessionScope.user.role == 'customer'}">
                <div class="dash_user_menues">
                    <ul>
                        <li <c:if test="${tab == 'my-profile'}"> class="active"</c:if>><a href="/admin/profile"><i
                                class="ti-user"></i>个人信息</a></li>
                        <li <c:if test="${tab == 'home'}"> class="active"</c:if>><a
                                href="/admin/home"><i class="ti-home"></i>我的家</a></li>
                        <li <c:if test="${tab == 'order-list'}"> class="active"</c:if>><a
                                href="/admin/order"><i class="ti-gift"></i>订单管理</a></li>
                        <li <c:if test="${tab == 'mark-list'}"> class="active"</c:if>><a href="/admin/mark"><i
                                class="ti-bookmark"></i>我的收藏</a></li>
                        <li <c:if test="${tab == 'feedback-list'}"> class="active"</c:if>><a href="/admin/feedback"><i
                                class="ti-alert"></i>我的反馈</a></li>
                        <li <c:if test="${tab == 'my-password'}"> class="active"</c:if>><a href="/admin/password"><i
                                class="ti-unlock"></i>密码修改</a></li>
                        <li><a href="/logout"><i class="ti-power-off"></i>退出登录</a></li>
                    </ul>
                </div>
            </c:when>
        </c:choose>

    </div>
</div>