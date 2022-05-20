<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/14
  Time: 9:57 上午
  新闻列表
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


                <!-- ============================ Submit Property Start ================================== -->
                <section>

                    <div class="container">
                        <div class="row">

                            <!-- Submit Form -->
                            <div class="col-lg-12 col-md-12">

                                <div class="submit-page form-simple">

                                    <!-- Basic Information -->
                                    <div class="frm_submit_block">
                                        <h3>发布新闻</h3>
                                        <div class="frm_submit_wrap">
                                            <form action="" id="newsForm">
                                                <div class="form-row">

                                                    <input type="hidden" name="id" value="${news.id}">
                                                    <div class="form-group col-md-12">
                                                        <label>新闻标题</label>
                                                        <input type="text" name="title" value="${news.title}"
                                                               class="form-control">
                                                    </div>


                                                    <div class="form-group col-md-12">
                                                        <label>新闻内容</label>
                                                        <textarea class="form-control h-240" name="content"
                                                                  style="min-height: 300px;">${news.content}</textarea>
                                                    </div>


                                                    <div class="form-group">
                                                        <div class="col-lg-12 col-md-12">
                                                            <button class="btn btn-theme bg-2" type="button"
                                                                    onclick="submitNews()">发布
                                                            </button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </form>
                                        </div>
                                    </div>


                                </div>
                            </div>

                        </div>
                    </div>

                </section>
                <!-- ============================ Submit Property End ================================== -->

            </div>
        </div>
    </div>
</section>
<!-- ============================ User Dashboard End ================================== -->


<%@ include file="../common/footer.jsp" %>
</body>
</html>
