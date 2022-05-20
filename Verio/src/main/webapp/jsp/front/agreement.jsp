<%--
  Created by IntelliJ IDEA.
  User: liuyanzhao
  Date: 2021/3/14
  Time: 5:54 下午
  合同页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<!-- ============================ Agency List Start ================================== -->
<section class="gray-simple">

    <div class="container">

        <!-- row Start -->
        <div class="row">

            <div class="col-lg-12 col-md-12">
                <div class="property_block_wrap style-2">

                    <div id="content" style="padding: 10px;">
                        <h2 style="text-align: center;">　房屋租赁合同</h2>
                        <p>　　出租方：<strong>${order.ownerUser.userDisplayName}</strong> (以下简称甲方)</p>
                        <p>　　身份证：<strong>${order.ownerUser.idCard}</strong></p>
                        <p>　　承租方：<strong>${order.customerUser.userDisplayName}</strong> (以下简称乙方)</p>
                        <p>　　身份证：<strong>${order.customerUser.idCard}</strong></p>
                        <p>　　根据甲、乙双方在自愿、平等、互利的基础上，经协商一致，为明确双方之间的权利义务关系，就甲方将其合法拥有的房屋出租给乙方使用，乙方承租甲方房屋事宜，订立本合同。</p>
                        <p>　　一、房屋地址：<strong>${order.house.address}</strong>，房屋名称
                            <strong>${order.house.title}</strong>。
                        </p>
                        <p>　　二、租赁期限及约定</p>
                        <p>　　1、该房屋租赁期共 <strong>${order.dayNum}</strong> 天。自 <strong>
                            <fmt:formatDate pattern="yyyy-MM-dd" value="${order.startDate}"/>
                        </strong> 到
                            <strong> <fmt:formatDate pattern="yyyy-MM-dd" value="${order.endDate}"/>
                                </span>
                            </strong>
                        </p>
                        <p>　　2、房屋租金：每日 <strong>
                            <fmt:formatNumber value="${order.monthRent/30 }" pattern="#" type="number"/> 元，时长
                            <strong>${order.dayNum}</strong> 天，押金 <strong>0</strong> 元，共计
                            <strong>${order.totalAmount}</strong>
                            元。</p>
                        <p>　　房屋终止，甲方验收无误后，将押金退还乙方，不计利息。</p>
                        <p>　　3、乙方向甲方承诺，租赁该房屋仅作为普通住房使用。</p>
                        <p>　　4、租赁期满，甲方有权收回出租房屋，乙方应如期交还。乙方如要求续租，则必须在租赁期满前一个月内通知甲方，经甲方同意后，重新签订租赁合同。</p>
                        <p>　　三、房屋修缮与使用</p>
                        <p>　　1、在租赁期内，甲方应保证出租房屋的使用安全。乙方应合理使用其所承租的房屋及其附属设施。如乙方因使用不当造成房屋及设施损坏的，乙方应负责修复或给予经济赔偿。</p>
                        <p>　　2、该房屋及所属设施的维修责任除双方在本合同及补充条款中约定外，均由甲方负责(但乙方使用不当除外)。甲方进行维修须提前七天通知乙方，乙方应积极协助配合。</p>
                        <p>
                            　　3、乙方因使用需要，在不影响房屋结构的前提下，可以对房屋进行装修装饰，但其设计规模、范围、工艺、用料等方案应事先征得甲方的同意后方可施工。租赁期满后，依附于房屋的装修归甲方所有。对乙方的装修装饰部分甲方不负有修缮的义务。</p>
                        <p>　　四、房屋的转让与转租</p>
                        <p>　　1、租赁期间，未经甲方书面同意，乙方不得擅自转租、转借承租房屋。</p>
                        <p>　　2、甲方同意乙方转租房屋的，应当单独订立补充协议，乙方应当依据与甲方的书面协议转租房屋。</p>
                        <p>　　五、乙方违约的处理规定</p>
                        <p>
                            　　在租赁期内，乙方有下列行为之一的，甲方有权终止合同，收回该房屋，乙方应向甲方支付合同总租金20%的违约金，若支付的违约金不足弥补甲方损失的，乙方还应负责赔偿直至达到弥补全部损失为止。</p>
                        <p>　　(1) 未经甲方书面同意，擅自将房屋转租、转借给他人使用的;</p>
                        <p>　　(2) 未经甲方同意，擅自拆改变动房屋结构或损坏房屋，且经甲方通知，在规定期限内仍未纠正并修复的;</p>
                        <p>　　(3) 擅自改变本合同规定的租赁用途或利用该房屋进行违法活动的;</p>
                        <p>　　(4) 拖欠房租累计一个月以上的。</p>
                        <p>　　六、本协议一式两份，甲.乙各执一份，乙方支付后即行生效。</p>
                        <!--            <p>　　七、其他说明：水电数字由甲乙双方与其他承租方平均分配</p>-->
                        <!--            <p>　　甲方签字：　　　　　　乙方签字：</p>-->
                        <!--            <p>　　联系方式：　　　　　　联系方式：</p>-->

                    </div>
                    <div style="text-align: center;margin-top: 50px;">
                        <%--   订单状态：-2待签合同，-1待付款，0生效中，1已到期，-3已取消--%>
                        <c:choose>
                            <c:when test="${order.status == -2}">
                                <a href="javascript:void(0)" onclick="confirmAgreement(${order.id})"
                                   class="btn btn-primary">我已阅读并同意上述合同</a>
                            </c:when>
                            <c:when test="${order.status == -1}">待付款</c:when>
                            <c:when test="${order.status == 0}">合同已生效</c:when>
                            <c:when test="${order.status == 1}">合同已到期</c:when>
                            <c:when test="${order.status == 1}">订单已取消</c:when>
                        </c:choose>

                    </div>
                    <div style="text-align: center;margin: 20px;">
                        <a href="javascript:void(0)" onclick="printHtml('content')">打印</a>
                    </div>

                </div>

            </div>


        </div>
        <!-- /row -->

    </div>

</section>
<!-- ============================ Agency List End ================================== -->


<%@ include file="../common/footer.jsp" %>
<script>
    function printHtml(div) {

        var before = "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'></head><body >";
        var print = document.getElementById(div).innerHTML;
        var result = before + print + "</body></html>"

        console.log(result);
        var wind = window.open("", 'newwindow', 'height=300, width=700, top=100, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');

        wind.document.body.innerHTML = result;

        wind.print();
        return false;
    }
</script>
</body>
</html>
