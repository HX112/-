<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/14
  Time: 9:57 上午
  后台首页
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


            <div class="col-lg-9 col-md-8 p-0">
                <div class="dashboard-body">

                    <div class="row">

                        <div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="dashboard_stats_wrap widget-1">
                                <div class="dashboard_stats_wrap_content"><h4>607</h4> <span>Listings Included</span>
                                </div>
                                <div class="dashboard_stats_wrap-icon"><i class="ti-location-pin"></i></div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="dashboard_stats_wrap widget-2">
                                <div class="dashboard_stats_wrap_content"><h4>102</h4> <span>Listings Remaining</span>
                                </div>
                                <div class="dashboard_stats_wrap-icon"><i class="ti-pie-chart"></i></div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="dashboard_stats_wrap widget-4">
                                <div class="dashboard_stats_wrap_content"><h4>70</h4> <span>Featured Included</span>
                                </div>
                                <div class="dashboard_stats_wrap-icon"><i class="ti-user"></i></div>
                            </div>
                        </div>

                    </div>
                    <!--  row -->

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="mb-0">Extra Area Chart</h4>
                                </div>
                                <div class="card-body">
                                    <ul class="list-inline text-center m-t-40">
                                        <li>
                                            <h5><i class="fa fa-circle m-r-5 text-warning"></i>Website A</h5>
                                        </li>
                                        <li>
                                            <h5><i class="fa fa-circle m-r-5 text-danger"></i>Website B</h5>
                                        </li>
                                        <li>
                                            <h5><i class="fa fa-circle m-r-5 text-success"></i>Website C</h5>
                                        </li>
                                    </ul>
                                    <div class="chart" id="extra-area-chart" style="height: 300px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- row -->

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <footer class="text-center">
                                <p class="mb-0">© 2021 Saysky. All Rights
                                    Reserved</p>
                            </footer>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</section>
<!-- ============================ User Dashboard End ================================== -->


<%@ include file="../common/footer.jsp" %>
</body>
</html>
