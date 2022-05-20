<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/14
  Time: 9:57 上午
  我的收藏
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
                            <h4>反馈列表</h4>
                        </div>

                        <table class="property-table-wrap responsive-table bkmark">

                            <tbody>
                            <tr>
                                <th><i class="fa fa-file-text"></i> 反馈列表</th>
                                <th></th>
                            </tr>

                            <c:forEach items="${pageInfo.records}" var="c">
                                <tr>
                                    <td class="dashboard_propert_wrapper">
                                        <div class="title">
                                            <h4><a href="#">${c.title}</a></h4>
                                            <p><c:choose>
                                                <c:when test="${c.status == 0}"><span
                                                        class="text-warning">待处理</span></c:when>
                                                <c:when test="${c.status == 1}"><span
                                                        class="text-success">已处理</span></c:when>
                                            </c:choose>
                                                    ${c.contactName}&nbsp;
                                                    ${c.contactEmail}</p>
                                            <p>反馈内容：${c.content}</p>

                                            <p>回复内容：${c.reply}</p>

                                        </div>
                                    </td>
                                    <td class="action">
                                        <c:if test="${isAdmin}">
                                            <a href="javascript:void(0)" class="delete" data-toggle="modal"
                                               data-target="#reply" onclick="showReplyModal(${c.id})">回复反馈</a>
                                        </c:if>
                                        <a href="javascript:void(0)" class="delete" onclick="deleteFeedback(${c.id})">删除反馈</a>
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


<!-- Sign Up Modal -->
<div class="modal fade" id="reply" tabindex="-1" role="dialog" aria-labelledby="sign-up" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
        <header class="modal_content_header">
            <div class="hm_nav">
                <h3 class="hm_nav_title">回复反馈</h3>
                <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content" id="sign-up">
            <div class="modal-body">
                <div class="login-form">
                    <form id="feedbackForm">
                        <div class="row">

                            <input type="hidden" name="id" id="feedbackId">
                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>回复内容</label>
                                    <div class="input-with-icon">
                                        <textarea class="form-control" name="reply"
                                                  style="padding-left: 15px!important;"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>状态</label>
                                    <div class="simple-input">
                                        <select name="status" class="form-control">
                                            <option value="1">已处理</option>
                                            <option value="0">待处理</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="button" onclick="feedbackReplySubmit()"
                                    class="btn btn-md full-width pop-login bg-2">回复提交
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->


<%@ include file="../common/footer.jsp" %>
</body>
</html>
