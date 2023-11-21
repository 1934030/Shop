
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="center-block text-center left-style">
    <img alt="头像" class="img-circle"
         src="${pageContext.request.contextPath}/statics/uploadfiles/${myinfo.headimg}"
         width="90px" height="90px">
    <h3>
        <c:if test="${!empty myinfo.uname }" var="e_myname">
            ${myinfo.uname }
        </c:if>
        <c:if test="${not e_myname }">
            <a href="login.html">请登录</a>
        </c:if>
    </h3>
    <small>我的积分:【${myinfo.vip }】</small>
    <h4>
        上次登录
    </h4>
    <small>
        <c:if test="${!empty myinfo.lasttime }"
              var="lasttime">
            ${myinfo.lasttime }
        </c:if>
        <c:if test="${not lasttime }">
            暂无记录...
        </c:if>
    </small>
</div>
<div class="center-block text-left"
     style="width: 80%; padding-top: 20px;">
    <h4>
        <a href="${pageContext.request.contextPath}/user/userinfo">我的信息</a>
    </h4>
    <h4>
        <a href="${pageContext.request.contextPath}/usercart/mycart">我的购物车</a>
    </h4>
    <h4>
        <a href="${pageContext.request.contextPath}/order/getMyOrders">我的订单</a>
    </h4>
    <h5 class="text-center">
        <a href="${pageContext.request.contextPath}/order/getMyOrders?status=0">待付款(<span class="wait_pay">0</span>)</a>
    </h5>
    <h5 class="text-center">
        <a href="${pageContext.request.contextPath}/order/getMyOrders?status=1">待发货(<span class="wait_send">0</span>)</a>
    </h5>
    <h5 class="text-center">
        <a href="${pageContext.request.contextPath}/order/getMyOrders?status=2">退款中(<span class="back_shop">0</span>)</a>
    </h5>
    <h5 class="text-center">
        <a href="${pageContext.request.contextPath}/order/getMyOrders?status=3">已退款(<span class="back_shop_ok">0</span>)</a>
    </h5>
    <h5 class="text-center">
        <a href="${pageContext.request.contextPath}/order/getMyOrders?status=4">已发货(<span class="already_send">0</span>)</a>
    </h5>
    <h5 class="text-center">
        <a href="${pageContext.request.contextPath}/order/getMyOrders?status=5">已完成(<span class="success_shop">0</span>)</a>
    </h5>
    <h5 class="text-center">
        <a href="${pageContext.request.contextPath}/order/getMyOrders?status=6">申请退货(<span class="back_submit">0</span>)</a>
    </h5>
    <h5 class="text-center">
        <a href="${pageContext.request.contextPath}/order/getMyOrders?status=7">退货中(<span class="back_ing">0</span>)</a>
    </h5>
    <h5 class="text-center">
        <a href="${pageContext.request.contextPath}/order/getMyOrders?status=8">已退货(<span class="back_ing_ok">0</span>)</a>
    </h5>
    <h5 class="text-center">
        <a href="${pageContext.request.contextPath}/order/getMyOrders?status=9">已取消(<span class="cancel_shop">0</span>)</a>
    </h5>
    <h4>
        <a href="${pageContext.request.contextPath}/log/getlog">我的日志</a>
    </h4>
</div>
<script>
    $(function () {
        for (var i = 0; i < 10; i++) {
            switch (i){
                case 0:
                    ajaxPost(0,".wait_pay");
                    break;
                case 1:
                    ajaxPost(1,".wait_send");
                    break;
                case 2:
                    ajaxPost(2,".back_shop");
                    break;
                case 3:
                    ajaxPost(3,".back_shop_ok");
                    break;
                case 4:
                    ajaxPost(4,".already_send");
                    break;
                case 5:
                    ajaxPost(5,".success_shop");
                    break;
                case 6:
                    ajaxPost(6,".back_submit");
                    break;
                case 7:
                    ajaxPost(7,".back_ing");
                    break;
                case 8:
                    ajaxPost(8,".back_ing_ok");
                    break;
                case 9:
                    ajaxPost(9,".cancel_shop");
                    break;
                default:
                    break;
            }
        }
    });

    function ajaxPost(status,classname) {
        $.ajax({
            url: "${pageContext.request.contextPath}/order/countStatus",
            data: {"status": status},
            success: function (date) {
                $(classname).text(date.resCount);
            }
        });
    }
</script>