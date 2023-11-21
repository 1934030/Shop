
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线商城官网-用户中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/upubliccss.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/form.js"></script><!--此文件要放在jquery下方-->
    <script src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        /*导航条样式*/
        .nav-bg {
            background-color: #fff;
        }

        .nav-bg ul li .nav-li-link {
            color: #3c3c3c;
        }

        .nav-bg .my-circle {
            border: 2px solid rgba(0, 0, 0, 0.3);
            color: #3c3c3c;
        }

        .nav-vrule {
            background-color: #3c3c3c;
        }

        /*主内容*/
        .bg-style {
            background-color: #fff;
            width: 100%;
            height: 100%;
            padding: 50px;
        }

        .text-right {
            margin: 20px 0 10px 0;
        }

        .cir-no1 {
            position: relative;
            width: 20px;
            line-height: 20px;
            border: 1px solid #999;
            border-radius: 50%;
            text-align: center;
            margin-right: 50px;
        }

        .now-checked {
            background-color: #007cba;
            color: #fff;
        }

        .cir-no1:nth-last-of-type(1):before {
            position: absolute;
            content: "确认信息";
            display: table;
            width: 100px;
            /*left自身宽度一半：50-父元素一半：10*/
            left: -40px;
            top: -110%;
            color: #3c3c3c;
        }

        .cir-no1:nth-last-of-type(2):before {
            position: absolute;
            content: "支付";
            display: table;
            width: 100px;
            left: -40px;
            top: -110%;
            color: #3c3c3c;
        }

        .cir-no1:nth-last-of-type(3):before {
            position: absolute;
            content: "提交订单";
            display: table;
            width: 100px;
            left: -40px;
            top: -110%;
            color: #3c3c3c;
        }

        .add-address {
            width: 30%;
            height: 170px;
            border: 1px dashed #ccc;
            position: relative;
            margin-bottom: 20px;
        }

        .add-address:hover {
            color: #007cba;
            border: 1px dashed #007cba;
        }

        .add-address:hover .v-wrapper .v-line {
            color: #007cba;
            border-color: #007cba;
        }

        .add-address:hover .v-wrapper:after {
            color: #007cba;
        }

        .v-wrapper {
            width: 50px;
            height: 50px;
            cursor: pointer;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }

        .v-wrapper:after {
            position: absolute;
            content: "新增收货地址";
            display: table;
            color: #666;
            width: 100px;
            left: 50%;
            top: 110%;
            text-align: center;
            transform: translateX(-50px);
        }

        .v-wrapper .v-line {
            border-top-width: 1px;
            border-style: solid;
            border-color: #eee;
        }

        .v-wrapper .v-line:nth-of-type(1) {
            margin-top: 50%;
        }

        .v-wrapper .v-line:nth-of-type(2) {
            transform: rotate(90deg) translateX(-5px);
        }

        .invoice-info, .pay-info {
            margin: 10px 0;
            background-color: #fff;
            padding: 50px;
            overflow: hidden;
            position: relative;
        }

        .invoice-info p, .pay-info p {
            margin: 0;
        }

        .invoice-info .invoice > li, .pay-info .pay > li {
            width: 200px;
            padding: 16px 10px;
            text-align: center;
            border: 1px solid #ccc;
            float: left;
            cursor: pointer;
        }

        .invoice-info .checked, .pay-info .checked {
            border: 1px solid #007cba !important;
            color: #007cba;
            display: inline-table;
            vertical-align: middle;
            font-weight: bold;
        }

        .invoice-info .checked, .pay-info .checked img {
            width: 30px;
            height: 30px;
        }

        .invoice-info .invoice > li:nth-of-type(2), .pay-info .pay > li:nth-of-type(2) {
            margin-left: 10px;
        }

        .pay-way {
            margin-top: 20px;
            overflow: hidden;
        }

        .pay-way > li {
            width: 300px;
            display: none;
            padding: 20px;
            cursor: pointer;
        }

        .pay-way > li > img {
            width: 100%;
        }

        .order-list {
            background-color: #fff;
            padding: 50px;
        }

        .sure-submit {
            margin-top: 10px;
            background-color: #f7fcff;
            padding: 50px;
            color: #aaa;
            border: 2px solid #cddae1;
        }

        .sure-submit p span {
            color: #007cba;
        }

        .sure-submit .line {
            width: 200px;
            float: right;
            border-top-width: 1px;
            border-style: solid;
            border-color: #eee;
            margin-bottom: 20px;
        }

        /*购物车引用*/
        .cart-contain {
            background-color: #fff;
        }

        .cart-contain .contain-header {
            padding: 30px 20px 5px 20px;
            border-bottom: 1px solid #eee;
        }

        .cart-contain .contain-header ul {
            width: 100%;
            display: table;
            color: #a4a4a4;
            font-size: 14px;
            padding: 0;
        }

        .cart-contain .contain-header ul > li {
            display: table-cell;
            text-align: center;
            vertical-align: middle;
            box-sizing: content-box;
            padding-right: 30px;
        }

        .cart-contain .contain-header ul > li:nth-child(1) {
            width: 60px;
            padding-right: 20px;
        }

        .cart-contain .contain-header ul > li:nth-child(2) {
            width: 400px;
            padding-right: 20px;
            text-align: left;
        }

        .cart-contain .contain-header ul > li:nth-child(4) {
            width: 140px;
            text-align: center;
            vertical-align: middle;
        }

        .cart-contain .contain-header ul > li:nth-child(3), .cart-contain .contain-header ul > li:nth-child(5) {
            width: 140px;
            text-align: center;
            vertical-align: middle;
        }

        .cart-contain .contain-good {
            padding: 0 20px;
        }

        .cart-contain .contain-good ul {
            padding: 30px 0;
            border-bottom: 1px solid #eee;
        }

        .cart-contain .contain-good ul:last-child {
            border-bottom: 0 solid #eee !important;
        }

        .cart-contain .contain-good ul > li {
            display: table-cell;
            text-align: center;
            vertical-align: middle;
            box-sizing: content-box;
            padding-right: 30px;
        }

        .cart-contain .contain-good ul > li:nth-of-type(1) {
            width: 60px;
            padding-right: 20px;
        }

        .cart-contain .contain-good ul > li:nth-of-type(2) {
            width: 400px;
            padding-right: 20px;
            text-align: left;
        }

        .cart-contain .contain-good ul > li:nth-of-type(4) {
            width: 140px;
            text-align: center;
            vertical-align: middle;
        }

        .cart-contain .contain-good ul > li:nth-of-type(3), .cart-contain .contain-good ul > li:nth-of-type(5) {
            width: 140px;
            text-align: center;
            vertical-align: middle;
        }

        .cart-contain .contain-good ul > li:nth-of-type(4) > span {
            font-size: 14px;
            color: #666;
        }

        .cart-contain .contain-good ul > li a .product_title {
            margin-bottom: 4px;
        }

        .cart-contain .contain-good ul > li .price_all {
            color: #007cba;
        }

        .cart-contain .contain-good ul > li .good-box {
            display: table-cell;
            vertical-align: middle;
            border: 1px solid #eee;
            width: 80px;
            height: 80px;
        }

        .cart-contain .contain-good ul > li img {
            display: inline-block;
        }

        .cart-contain .contain-good ul > li p {
            color: #666;
            font-size: 14px;
            padding: 0;
        }

        .cart-contain .contain-good ul > li:nth-of-type(2) > p {
            line-height: 18px;
        }

        .cart-contain .contain-good ul > li:nth-of-type(2) > p:nth-child(1) {
            color: #666;
            font-size: 14px;
            padding-bottom: 4px;
        }

        .cart-contain .contain-good ul > li .account-info span {
            display: inline-block;
            color: #f5b539;
            font-size: 12px;
            height: 18px;
            line-height: 18px;
            padding-left: 10px;
            padding-right: 5px;
            border-top: 1px solid #f5b539;
            border-left: 1px solid #f5b539;
            border-bottom: 1px solid #f5b539;
            border-top-left-radius: 2px;
            border-bottom-left-radius: 2px;
            position: relative;
        }

        .cart-contain .contain-good ul > li .account-info span::after {
            content: '';
            width: 10px;
            height: 20px;
            background: url('${pageContext.request.contextPath }/images/q2.jpg') no-repeat;
            position: absolute;
            top: -1px;
            right: -10px;
        }

        .price_all:before, .productPrice:before {
            content: "￥";
        }

        .myaddress {
            width: 50%;
            resize: none;
        }

        #new_address {
            display: none;
        }
    </style>
</head>
<body>
<div class="header-page" style="height: 110px;">
    <%@ include file="/page/header.html" %>
</div>

<form action="${pageContext.request.contextPath }/order/addOrder" id="cart" method="post"
      onsubmit="return checkInfo();">
    <div class="container" style="margin-top: 50px">
        <div class="order-tit">
            <h3 class="text-left pull-left">提交订单</h3>
            <div class="text-right pull-right">
                <div class="cir-no1 pull-right now-checked">3</div>
                <div class="cir-no1 pull-right now-checked">2</div>
                <div class="cir-no1 pull-right now-checked">1</div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="bg-style">
            <h4>* 收货信息</h4>
            <c:if test="${!empty myinfo.address}" var="myaddress">
            <textarea class="form-control myaddress input_address" rows="5" name="orderaddress"
                      placeholder="请输入收货地址">默认地址：${myinfo.address}</textarea>
            </c:if>
            <c:if test="${not myaddress}">
            <textarea class="form-control myaddress" id="new_address" rows="5" name="orderaddress"
                      placeholder="请输入收货地址"></textarea>
                <div class="add-address">
                    <div class="v-wrapper" data-toggle="modal" data-target="#myModal">
                        <div class="v-line"></div>
                        <div class="v-line"></div>
                    </div>
                </div>
                <!-- 模态框（Modal） -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">新增地址</h4>
                            </div>
                            <div class="modal-body">
                            <textarea class="form-control myaddress input_address" rows="5" name="orderaddress"
                                      placeholder="请输入收货地址"></textarea>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary sure_address" data-dismiss="modal">确定
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
            </c:if>
        </div>

        <script>
            $(function () {
                $(".sure_address").click(function () {
                    var $content = $(".input_address").val();
                    if ($content != null && "" != $content) {
                        $(".add-address").css("display", "none");
                        $("#new_address").css("display", "block");
                        $("#new_address").val($content);
                    }
                });
            })
        </script>

        <div class="invoice-info">
            <h4>* 发票信息</h4>
            <ul class="invoice">
                <li class="checked">
                    <p>不需要发票</p>
                </li>
                <li>
                    <p>普通发票</p>
                </li>
            </ul>
        </div>

        <div class="order-list">
            <h4>* 商品清单</h4>
            <div class="cart-contain">
                <div class="contain-header">
                    <ul>
                        <li><span>商品名称</span></li>
                        <li><span>&nbsp;</span></li>
                        <li><span>单价</span></li>
                        <li><span>数量</span></li>
                        <li><span>小计</span></li>
                    </ul>
                </div>
                <div class="contain-good">
                    <%-- totalAmount 用于计算总价 --%>
                    <c:set var="totalAmount" value="0"/>
                    <c:forEach items="${basic_info}" var="item_pro">
                        <%--隐藏域--%>
                        <input type="hidden" value="${item_pro.pid}" name="pid">
                        <input type="hidden" value="${item_pro.pronum}" name="pronum">
                        <ul>
                            <li>
                                <div class="good-box">
                                    <a href="#">
                                        <img src="${pageContext.request.contextPath }/statics/upprodectimg/${item_pro.pimg}"
                                             alt="图片" title="${item_pro.pname}" width="80px">
                                    </a>
                                </div>
                            </li>
                            <li>
                                <a href="#">
                                    <p class="product_title">${item_pro.pname}</p>
                                </a>
                                <small class="meta_title">6GB+128GB</small>
                            </li>
                            <li>
                                <span class="productPrice">${item_pro.price}</span>
                            </li>
                            <li>
                                <p>${item_pro.pronum}</p>
                            </li>
                            <li>
                                <p class="price_all">${item_pro.pronum*item_pro.price}</p>
                                <c:set var="totalAmount" value="${totalAmount+item_pro.pronum*item_pro.price}"/>
                            </li>
                        </ul>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="pay-info">
            <h4>* 支付方式</h4>
            <ul class="pay">
                <li class="checked">
                    支付宝
                </li>
                <li>
                    微信支付
                </li>
            </ul>
            <div class="clearfix"></div>
            <ul class="pay-way">
                <li class="checked">
                    <%--<img src="${pageContext.request.contextPath }/images/alipay.jpg" alt="图片">--%>
                    支付宝<img src="${pageContext.request.contextPath}/images/timg.gif">
                </li>
                <li>
                    <%--<img src="${pageContext.request.contextPath }/images/wechat.png" alt="图片">--%>
                    微信支付<img src="${pageContext.request.contextPath}/images/timg.gif">
                </li>
            </ul>
        </div>

        <div class="sure-submit text-right">
            <p>原价：<span>￥${totalAmount}</span></p>
            <p>应付款：<span>￥${totalAmount+12}</span>（含邮费：<span>￥12</span>）</p>
            <div class="line"></div>
            <div class="clearfix"></div>
            <p>温馨提示：提示信息提示信息提示信息提示信息提示信息提示信息</p>
            <button class="btn btn-primary btn-lg sure-order">提交订单</button>
        </div>
    </div>
</form>

<div class="footer-page">
    <%@ include file="/page/footer.html" %>
</div>

<script src="${pageContext.request.contextPath }/js/publicjs.js"></script>
<script>
    $(function () {
        $(".invoice-info>.invoice>li").click(function () {
            $(this).addClass("checked");
            $(this).siblings().removeClass("checked");
        });
        $(".pay-info>.pay>li").click(function () {
            $(this).addClass("checked");
            $(this).siblings().removeClass("checked");
            var index = $(this).index();
            var pay_li = $(".pay-way>li").eq(index);
            pay_li.addClass("checked");
            pay_li.siblings().removeClass("checked");
        });
    });

    function checkInfo() {
        var $content = $(".input_address").val();
        if ($content != null && "" != $content) {
            if (confirm("已确认个人信息并完成支付？")) {
                //下单成功，订单状态更新：待发货
                alert("下单成功，待发货！");
                return true;
            } else {
                //下单成功，订单状态更新：待付款
                alert("下单成功，待付款！");
                return true;
            }
        } else {
            alert("请填写收货信息！");
            return false;
        }
    }
</script>
</body>
</html>
