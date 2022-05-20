<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/14
  Time: 9:57 上午
  密码修改
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<!-- ============================ User Dashboard ================================== -->
<section class="gray p-0">
    <div class="container-fluid p-0">

        <div class="row">

            <%@ include file="../common/admin-left.jsp" %>


            <div class="col-lg-9 col-md-8 col-sm-12">
                <div class="dashboard-body">

                    <div class="dashboard-wraper">

                        <!-- Basic Information -->
                        <div class="frm_submit_block">
                            <h4>修改密码</h4>
                            <div class="frm_submit_wrap">
                                <form action="" id="passwordForm">
                                    <div class="form-row">

                                        <div class="col-md-6">
                                            <div class="form-group col-md-12">
                                                <label>原密码</label>
                                                <input type="password" class="form-control" name="oldPassword">
                                            </div>

                                            <div class="form-group col-md-12">
                                                <label>新密码</label>
                                                <input type="password" class="form-control" name="newPassword">
                                            </div>

                                            <div class="form-group col-md-12">
                                                <label>确认密码</label>
                                                <input type="password" class="form-control" name="confirmPassword">
                                            </div>


                                            <div class="form-group col-lg-12 col-md-12">
                                                <button class="btn btn-theme bg-2" type="button"
                                                        onclick="submitPassword()">
                                                    更新密码
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                </form>
                            </div>
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
