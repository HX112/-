<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/14
  Time: 9:57 上午
  个人信息
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
                            <h4>个人信息</h4>
                            <div class="frm_submit_wrap">
                                <form action="" id="profileForm">
                                    <div class="form-row">

                                        <div class="form-group col-md-6">
                                            <label>账号</label>
                                            <input type="text" class="form-control" name="userName" value="${user.userName}" disabled>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>姓名</label>
                                            <input type="text" class="form-control" name="userDisplayName" value="${user.userDisplayName}">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>电子邮箱</label>
                                            <input type="email" class="form-control" name="email" value="${user.email}">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>手机号</label>
                                            <input type="text" class="form-control" name="phone" value="${user.phone}">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>身份证号码</label>
                                            <input type="text" class="form-control" name="idCard" value="${user.idCard}">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>性别</label>
                                            <select name="sex" class="form-control">
                                                <option value="保密" <c:if test="${user.sex == '保密'}">selected</c:if>>
                                                    保密
                                                </option>
                                                <option value="男" <c:if test="${user.sex == '男'}">selected</c:if>>
                                                    男
                                                </option>
                                                <option value="女" <c:if test="${user.sex == '女'}">selected</c:if>>
                                                    女
                                                </option>
                                            </select>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>职业</label>
                                            <select name="job" class="form-control">
                                                <option value="其他" <c:if test="${user.job == '其他'}">selected</c:if>>其他</option>
                                                <option value="互联网/计算机" <c:if test="${user.job == '互联网/计算机'}">selected</c:if>>互联网/计算机</option>
                                                <option value="生产/制造" <c:if test="${user.job == '生产/制造'}">selected</c:if>>生产/制造</option>
                                                <option value="教育/培训" <c:if test="${user.job == '教育/培训'}">selected</c:if>>教育/培训</option>
                                                <option value="教育/培训" <c:if test="${user.job == '教育/培训'}">selected</c:if>>教育/培训</option>
                                                <option value="金融/银行" <c:if test="${user.job == '金融/银行'}">selected</c:if>>金融/银行</option>
                                                <option value="保险/投资" <c:if test="${user.job == '保险/投资'}">selected</c:if>>保险/投资</option>
                                                <option value="文化/传媒" <c:if test="${user.job == '文化/传媒'}">selected</c:if>>文化/传媒</option>
                                                <option value="公务员" <c:if test="${user.job == '公务员'}">selected</c:if>>公务员</option>
                                                <option value="服务行业" <c:if test="${user.job == '服务行业'}">selected</c:if>>服务行业</option>
                                                <option value="学生" <c:if test="${user.job == '学生'}">selected</c:if>>学生</option>
                                            </select>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>爱好</label>
                                            <input type="text" class="form-control" name="hobby" value="${user.hobby}">
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label>个人说明</label>
                                            <textarea class="form-control" name="userDesc">${user.userDesc}</textarea>
                                        </div>

                                        <div class="form-group col-lg-12 col-md-12">
                                            <button class="btn btn-theme bg-2" type="button" onclick="submitProfile()">
                                                保存
                                            </button>
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
