<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/13
  Time: 5:33 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- ============================ Footer Start ================================== -->
<footer class="dark-footer skin-dark-footer style-2" style="padding-top: 0;">

<%--    <div class="footer-middle">--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>

<%--                <div class="col-lg-4 col-md-4">--%>
<%--                    <div class="footer_widget">--%>
<%--                        <div class="footlogo"><img src="/assets/img/logo-light.png" class="img-fluid mb-3" alt=""/>--%>
<%--                        </div>--%>
<%--                        <p>2512, New Market Eliza Road, Sincher 80<br>Montreal Central Canada,<br>USA QHVK1254</p>--%>
<%--                        <ul class="footer-bottom-social">--%>
<%--                            <li><a href="#"><i class="ti-facebook"></i></a></li>--%>
<%--                            <li><a href="#"><i class="ti-twitter"></i></a></li>--%>
<%--                            <li><a href="#"><i class="ti-instagram"></i></a></li>--%>
<%--                            <li><a href="#"><i class="ti-linkedin"></i></a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="col-lg-2 col-md-2">--%>
<%--                    <div class="footer_widget">--%>
<%--                        <h4 class="widget_title">My Homes</h4>--%>
<%--                        <ul class="footer-menu">--%>
<%--                            <li><a href="#">New York</a></li>--%>
<%--                            <li><a href="#">California</a></li>--%>
<%--                            <li><a href="#">Louisiana</a></li>--%>
<%--                            <li><a href="#">Las Vegas</a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="col-lg-2 col-md-2">--%>
<%--                    <div class="footer_widget">--%>
<%--                        <h4 class="widget_title">About Us</h4>--%>
<%--                        <ul class="footer-menu">--%>
<%--                            <li><a href="#">Apartment</a></li>--%>
<%--                            <li><a href="#">My Houses</a></li>--%>
<%--                            <li><a href="#">Restaurant</a></li>--%>
<%--                            <li><a href="#">Nightlife</a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="col-lg-2 col-md-2">--%>
<%--                    <div class="footer_widget">--%>
<%--                        <h4 class="widget_title">News</h4>--%>
<%--                        <ul class="footer-menu">--%>
<%--                            <li><a href="#">My Profile</a></li>--%>
<%--                            <li><a href="#">My account</a></li>--%>
<%--                            <li><a href="#">My Property</a></li>--%>
<%--                            <li><a href="#">Favorites</a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="col-lg-2 col-md-2">--%>
<%--                    <div class="footer_widget">--%>
<%--                        <h4 class="widget_title">Help</h4>--%>
<%--                        <ul class="footer-menu">--%>
<%--                            <li><a href="#">Conditions</a></li>--%>
<%--                            <li><a href="#">Privacy</a></li>--%>
<%--                            <li><a href="#">Blog</a></li>--%>
<%--                            <li><a href="#">FAQs</a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="footer-bottom">
        <div class="container">
            <div class="row align-items-center">

                <div class="col-lg-12 col-md-12">
                    <p class="mb-0">© 2021 Saysky</p>
                </div>

            </div>
        </div>
    </div>
</footer>
<!-- ============================ Footer End ================================== -->

<!-- 登录弹出框 Modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="registermodal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
        <header class="modal_content_header">
            <div class="hm_nav">
                <h3 class="hm_nav_title">登录</h3>
                <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content" id="registermodal">
            <div class="modal-body">
                <div class="login-form">
                    <form id="loginForm">

                        <div class="form-group">
                            <label>账号</label>
                            <div class="input-with-icon">
                                <input type="text" class="form-control" name="userName" placeholder="账号">
                                <i class="ti-user"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>密码</label>
                            <div class="input-with-icon">
                                <input type="password" class="form-control" name="userPass" placeholder="*******">
                                <i class="ti-unlock"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="button" onclick="submitLogin()" class="btn btn-md full-width pop-login bg-2">登录</button>
                        </div>

                    </form>
                </div>

                <div class="text-center">
                    <p class="mt-3"><i class="ti-user mr-1"></i>忘记密码? <a href="#" data-toggle="modal"  data-target="#forget"class="link">点此重置</a></p>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- End Modal -->

<!-- 注册 Modal -->
<div class="modal fade" id="signup" tabindex="-1" role="dialog" aria-labelledby="sign-up" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
        <header class="modal_content_header">
            <div class="hm_nav">
                <h3 class="hm_nav_title">注册</h3>
                <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content" id="sign-up">
            <div class="modal-body">
                <div class="login-form">
                    <form id="registerForm">

                        <div class="row">

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>姓名</label>
                                    <div class="input-with-icon">
                                        <input type="text" name="userDisplayName" class="form-control" placeholder="姓名">
                                        <i class="ti-user"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>电子邮箱</label>
                                    <div class="input-with-icon">
                                        <input type="email" name="email" class="form-control" placeholder="电子邮箱，用于重置密码">
                                        <i class="ti-email"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>手机号</label>
                                    <div class="input-with-icon">
                                        <input type="text" name="phone" class="form-control" placeholder="手机号">
                                        <i class="ti-mobile"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>账号</label>
                                    <div class="input-with-icon">
                                        <input type="text" name="userName" class="form-control" placeholder="登录账号">
                                        <i class="ti-user"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>密码</label>
                                    <div class="input-with-icon">
                                        <input type="password" name="userPass" class="form-control" placeholder="登录密码">
                                        <i class="ti-unlock"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>角色</label>
                                    <div class="simple-input">
                                        <select name="role" class="form-control">
                                            <option value="customer">租客</option>
                                            <option value="owner">房东</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">
                            <button type="button" onclick="submitRegister()" class="btn btn-md full-width pop-login bg-2">创建账号</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->

<!-- 找回密码弹出框 Modal -->
<div class="modal fade" id="forget" tabindex="-1" role="dialog" aria-labelledby="forgetmodal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
        <header class="modal_content_header">
            <div class="hm_nav">
                <h3 class="hm_nav_title">找回密码</h3>
                <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content">
            <div class="modal-body">
                <div class="login-form">
                    <form id="forgetForm">

                        <div class="form-group">
                            <label>账号</label>
                            <div class="input-with-icon">
                                <input type="text" class="form-control" name="userName" placeholder="账号">
                                <i class="ti-user"></i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>邮箱地址</label>
                            <div class="input-with-icon">
                                <input type="email" class="form-control" name="email" placeholder="注册时填写的电子邮箱地址">
                                <i class="ti-unlock"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="button" onclick="submitForget()" class="btn btn-md full-width pop-login bg-2">重置密码</button>
                        </div>

                    </form>
                </div>

                <div class="text-center">
                    <p class="mt-3"><i class="ti-user mr-1"></i>我们会向您的邮箱发送一封邮件，请注意查收</p>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- End Modal -->

<!-- End Video Modal -->
<a id="back2Top" class="top-scroll" title="Back to top" href="#"><i class="ti-arrow-up"></i></a>


</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->

<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/popper.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/ion.rangeSlider.min.js"></script>
<script src="/assets/js/select2.min.js"></script>
<script src="/assets/js/jquery.magnific-popup.min.js"></script>
<script src="/assets/js/slick.js"></script>
<script src="/assets/js/slider-bg.js"></script>
<script src="/assets/js/lightbox.js"></script>
<script src="/assets/js/imagesloaded.js"></script>
<script src="/assets/js/daterangepicker.js"></script>
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/script.js"></script>
<!-- ============================================================== -->
<!-- This page plugins -->
<!-- ============================================================== -->
