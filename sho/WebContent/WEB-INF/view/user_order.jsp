<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>在线商城官网-用户中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/upubliccss.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/form.js"></script><!--此文件要放在jquery下方-->
    <script src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style type="text/css">
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

        /* 以下是单独样式 */
        .cart {
            width: 100%;
            height: auto;
            margin-top: 24px;
        }

        .cart-container-header h2::after {
            position: absolute;
            left: 23%;
            width: 50%;
            content: '';
            height: 3px;
            bottom: -4px;
            background: #007cba;
        }

        .cart-account .delete a {
            text-decoration: none;
            color: #007cba;
        }

        .cart-contain {
            background-color: #fff;
        }

        .cart-contain .contain-good {
            padding: 20px 0;
        }

        .order_list {
            width: 100%;
            display: table;
            color: #a4a4a4;
            font-size: 14px;
            padding: 0;
            border-bottom: 1px solid #eee;
        }

        .order_list:last-child {
            border-bottom: 0 solid #eee !important;
        }

        .order_list > li {
            display: table-cell;
            text-align: center;
            vertical-align: middle;
            box-sizing: content-box;
            padding-right: 30px;
        }

        .order_list > li:nth-of-type(1) {
            width: 10%;
            padding-right: 20px;
            text-align: left;
        }

        .order_list > li:nth-of-type(2) {
            width: 30%;
            padding-right: 20px;
            text-align: left;
        }

        .order_list > li:nth-of-type(n+3) {
            width: 20%;
            text-align: center;
        }

        .order_center {
            width: 100%;
            padding: 20px;
            background-color: #fff;
        }

        .order_title {
            background-color: #d9edf7;
            margin: 0;
            padding: 20px;
            user-select: none;
        }

        .order_title a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<!--抛锚点-->
<div id="head" class="class" style="height: 110px">
    <%@ include file="/page/header.html" %>
</div>

<div class="container-fluid" style="margin-bottom: 80px; margin-top: 50px">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="row">
                <div class="col-md-2" style="background-color: #fff; padding-bottom: 50px">
                    <%@ include file="pub_left.jsp" %>
                </div>
                <div class="col-md-10">
                    <div style="width: 100%; min-height: 1000px; background-color: #fff; padding: 50px 20px 50px 20px;">
                        <div class="panel-group" id="accordion">
                            <div class="cart-container-header">
                                <h3 class="titleinfo" style="position: relative; margin-bottom: 20px"><span>我的订单</span>
                                </h3>
                            </div>
                            <c:if test="${!empty order_list}" var="em_order">
                                <!--商品显示-->
                                <div class="cart">
                                    <form action="https://www.royole.com/cart-edit" id="cart" method="post">
                                        <div class="cart-contain">
                                            <c:forEach items="${order_list}" var="item_order" varStatus="vs">
                                                <div class="contain-good">
                                                    <div class="panel panel-info">
                                                        <ul class="list-inline order_title">
                                                            <li>
                                                                <c:if test="${item_order.status==4 || item_order.status==5}"
                                                                      var="not_">
                                                                    <a href="javascript:;" data-toggle="modal"
                                                                       data-target="#myModal${vs.index}">查看订单详情</a>
                                                                </c:if>
                                                                <c:if test="${not not_}">
                                                                    <a href="javascript:;">暂无详情</a>
                                                                </c:if>
                                                            </li>
                                                            <li>
                                                            <span>下单日期：<fmt:formatDate value="${item_order.orderdate}"
                                                                                       pattern="yyyy年MM月dd日"/></span>
                                                            </li>
                                                            <li>
                                                                <span>订单号：${item_order.ordercode} </span>
                                                            </li>
                                                            <li class="pull-right">
                                                        <span id="orderstatus">
                                                            订单状态：
                                                            <c:if test="${item_order.status==0}">
                                                                <span>等待付款</span>
                                                                <span style="padding-left: 20px"><a href="javascript:;"
                                                                                                    onclick="handleOrder(${item_order.orderid},9,'确定要取消这个订单吗？',event);">取消订单</a> |</span>
                                                                <span><a href="javascript:;"
                                                                         onclick="toPay(${item_order.orderid},'是否成功支付支付',event);">去付款</a></span>
                                                            </c:if>
                                                            <c:if test="${item_order.status==1}">
                                                                <span>未发货</span>
                                                                <span style="padding-left: 20px"><a
                                                                        href="javascript:;"
                                                                        onclick="handleOrder(${item_order.orderid},2,'确定要申请退款吗？',event)">申请退款</a></span>
                                                            </c:if>
                                                            <c:if test="${item_order.status==2}">
                                                                <span>已提交退款申请，等待商家处理</span>
                                                            </c:if>
                                                            <c:if test="${item_order.status==3}">
                                                                <span>退款成功</span>
                                                            </c:if>
                                                            <c:if test="${item_order.status==4}">
                                                                <span>已发货</span>
                                                                <span style="padding-left: 20px"><a href="javascript:;"
                                                                                                    onclick="handleOrder(${item_order.orderid},5,'确定要收货吗？',event)">确认收货 |</a></span>
                                                                <span><a href="javascript:;"
                                                                         onclick="handleOrder(${item_order.orderid},6,'确定要申请退货吗？',event)">申请退货</a></span>
                                                            </c:if>
                                                            <c:if test="${item_order.status==5}">
                                                                <span>交易完成</span>
                                                                <span style="padding-left: 20px"><a
                                                                        href="${pageContext.request.contextPath}/order/delMyOrders?orderid=${item_order.orderid}"
                                                                        onclick="return confirm('确定要删除这个订单吗？')">删除订单</a></span>
                                                            </c:if>
                                                            <c:if test="${item_order.status==6}">
                                                                <span>已提交退货申请，请等待商家处理</span>
                                                            </c:if>
                                                            <c:if test="${item_order.status==7}">
                                                                <span>退货中</span>
                                                            </c:if>
                                                            <c:if test="${item_order.status==8}">
                                                                <span>退货成功</span>
                                                            </c:if>
                                                            <c:if test="${item_order.status==9}">
                                                                <span>交易取消</span>
                                                                <span style="padding-left: 20px"><a
                                                                        href="${pageContext.request.contextPath}/order/delMyOrders?orderid=${item_order.orderid}"
                                                                        onclick="return confirm('确定要删除这个订单吗？')">删除订单</a></span>
                                                            </c:if>
                                                        </span>
                                                            </li>
                                                                <%--<li class="pull-right"><a href="#">删除订单</a></li>--%>
                                                        </ul>
                                                        <!-- 模态框（Modal） -->
                                                        <div class="modal fade" id="myModal${vs.index}" tabindex="-1"
                                                             role="dialog" aria-labelledby="myModalLabel"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close"
                                                                                data-dismiss="modal" aria-hidden="true">
                                                                            &times;
                                                                        </button>
                                                                        <h4 class="modal-title"
                                                                            id="myModalLabel${vs.index}">订单详情</h4>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <ul class="">
                                                                            <li>快递公司：${item_order.orderpostname}</li>
                                                                            <li>快递单号：${item_order.orderpostcode}</li>
                                                                            <li>物流信息：未同步</li>
                                                                            <c:if test="${item_order.status==5}"
                                                                                  var="it_rec">
                                                                                <li>交易信息：交易完成</li>
                                                                            </c:if>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-default"
                                                                                data-dismiss="modal">关闭
                                                                        </button>
                                                                        <button type="button" class="btn btn-primary">
                                                                            提交更改
                                                                        </button>
                                                                    </div>
                                                                </div><!-- /.modal-content -->
                                                            </div><!-- /.modal -->
                                                        </div>
                                                        <div class="order_center">
                                                                <%-- 用屏蔽的方法这么写也可以<c:forEach items="${item_order.getOdetails()}" var="item_odetails"> --%>
                                                                <%--定义局部变量：总价格--%>
                                                            <c:set var="totalAmount" value="0"/>
                                                            <c:forEach items="${item_order.odetails}"
                                                                       var="item_odetails">
                                                                <ul class="order_list">
                                                                    <li>
                                                                        <div class="good-box">
                                                                            <a href="${pageContext.request.contextPath }/product/productinfo?pid=${item_odetails.pid}">
                                                                                <img src="${pageContext.request.contextPath }/statics/upprodectimg/${item_odetails.pimg}"
                                                                                     alt="图片"
                                                                                     title="${item_odetails.pname}"
                                                                                     width="80px">
                                                                            </a>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <a href="${pageContext.request.contextPath }/product/productinfo?pid=${item_odetails.pid}">
                                                                            <p class="product_title">${item_odetails.pname}</p>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <span class="productPrice">￥${item_odetails.price}</span>
                                                                    </li>
                                                                    <li>
                                                                        <div class="input-group btn-clock input-group-xadd">
                                                                            <input hidden="" value="1000000"
                                                                                   class="hiddenVal">
                                                                            <span class="productPrice">${item_odetails.odetailnum}件</span>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <p class="price_all">
                                                                            ￥${item_odetails.odetailnum*item_odetails.price}</p>
                                                                        <c:set var="totalAmount"
                                                                               value="${totalAmount+item_odetails.odetailnum*item_odetails.price}"/>
                                                                    </li>
                                                                </ul>
                                                            </c:forEach>
                                                            <div class="text-right">
                                                                <p>合计：￥${totalAmount+item_order.postalfee}</p>
                                                                <p>含运费￥${item_order.postalfee}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </form>
                                </div>
                                <!--商品展示 end-->
                            </c:if>
                            <c:if test="${not em_order}">
                                <div class="alert alert-info text-center none_info">
                                    <img src="${pageContext.request.contextPath}/images/robote.png" width="100px">
                                    <span style="font-size: 20px"> 暂无订单 o . O !</span>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer-page">
    <%@ include file="/page/footer.html" %>
</div>

<!--锚点-->
<div class="float text-center">
    <a href="#head" title="回到顶部"><span class="glyphicon glyphicon-chevron-up"></span></a>
</div>

<script src="${pageContext.request.contextPath }/js/publicjs.js"></script>
<script>
    $(function () {
        if (${errorI==0}) {
            alert(${errorMessage});
        }
    });

    function handleOrder(orderid, status, msg, e) {
        if (confirm(msg)) {
            var os = $(e.target).parent().parent("#orderstatus");
            //alert(os.attr("id"));
            $.post("${pageContext.request.contextPath}/order/orderStatus", {
                orderid: orderid,
                status: status
            }, function (date) {
                if (date.handle == "success") {
                    if (status == 2) {
                        os.html("已提交退款申请，请等待商家处理");
                    }
                    else if (status == 5) {
                        os.html("订单状态：<span>交易完成</span><span style=\"padding-left: 20px\"><a href=\"${pageContext.request.contextPath}/order/delMyOrders?orderid=" + orderid + "\" onclick=\"return confirm('确定要删除这个订单吗？')\">删除订单</a></span>");
                    }
                    else if (status == 6) {
                        os.html("已提交退货申请，请等待商家处理");
                    }
                    else if (status == 9) {
                        os.html("订单状态：<span>交易取消</span><span style=\"padding-left: 20px\"><a href=\"${pageContext.request.contextPath}/order/delMyOrders?orderid=" + orderid + "\" onclick=\"return confirm('确定要删除这个订单吗？')\">删除订单</a></span>");
                    }
                    alert("操作订单成功");
                } else if (date.handle == "failure") {
                    alert("抱歉，目前的订单状态无法进行此操作");
                } else {
                    alert("操作订单失败");
                }
            });
        }
    }

    function toPay(orderid, msg, event) {
        if (confirm(msg)) {
            var os = $(event.target).parent().parent("#orderstatus");
            $.post("${pageContext.request.contextPath}/order/toPay", {orderid: orderid}, function (date) {
                alert("操作订单成功");
                os.html("<span>未发货</span><a href=\"javascript:;\" style=\"padding-left: 20px\" onclick=\"handleOrder(" + orderid + ",2,'确定要申请退款吗？',event)\">申请退款</a>");
            });
        }
    }
</script>
</body>
</html>