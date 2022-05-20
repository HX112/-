<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<%--中间内容区域代码在这里--%>
<section class="gray-simple">
    <div class="container" style="min-height: 500px;">
        <!-- row Start -->
        <div class="row">

            <%--            ${name}--%>
            <%--            ${age} --%>

            <%--显示集合--%>
            <table style="width: 500px; margin-top: 20px;">
                <tr>
                    <th>ID</th>
                    <th>账号</th>
                    <th>显示名称</th>
                    <th>状态</th>
                    <th>头像</th>
                </tr>
                <c:forEach items="${userList}" var="c">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.userName}</td>
                        <td>${c.userDisplayName}</td>
                        <td>
                                <%--                            <c:if test="${c.status == 0}">正常</c:if>--%>
                                <%--                            <c:if test="${c.status == 1}"> <span class="text-danger">禁用</span> </c:if>--%>

                                <%--                            --%>
                            <c:choose>
                                <c:when test="${c.status == 0}">正常</c:when>
                                <c:otherwise>
                                    <span class="text-danger">禁用</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <img src="${c.userAvatar}" alt="" style="width: 50px; height: 50px;">
                        </td>
                    </tr>
                </c:forEach>
            </table>


            <br><br>
            <hr>

            <%--                显示单个对象--%>
            ${user1.userName}--- ${user1.userDisplayName}

        </div>
    </div>
</section>

<%@ include file="../common/footer.jsp" %>


</body>
</html>