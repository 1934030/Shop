<%@ page import="com.shop.util.Constants" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线商城官网-用户中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/upubliccss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/adindexcss.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/form.js"></script><!--此文件要放在jquery下方-->
    <script src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/publicjs.js"></script>
    <style type="text/css">
        a:hover {
            text-decoration: none;
        }

        a:link {
            text-decoration: none;
        }

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

        .wrap-all {
            position: fixed;
            top: 0;
            left: 0;
            z-index: 9999;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, .5);
            display: none;
        }

        .position-alert {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }

        .copyright {
            font-size: 12px;
            color: #999;
            margin: 0;
            padding: 20px 0;
            letter-spacing: 6px;
            border-top: 1px solid #fff;
        }

        .slo-vertical {
            font-size: 18px;
            display: inline;
            font-weight: bold;
            vertical-align: middle
        }

        .panel-body {
            padding: 0;
        }

        .two-menu {
            margin: 0;
            padding: 0
        }

        .two-menu li {
            transition: .5s;
        }

        .two-menu li a {
            padding: 10px 0;
            display: block;
            transition: .5s;
            color: #000;
        }

        .two-menu li a:hover {
            border-radius: 4px;
            background-color: #007cba;
            color: #fff;
        }

        .two-menu li:hover {
            background-color: #007cba;
        }

        .two-menu li:hover a {
            transform: translateX(6px);
        }

        .upfile {
            cursor: pointer;
        }

        /*本页单独样式*/
        .user-list {
            padding: 0;
        }

        .user-list > ul:nth-of-type(1) > li {
            color: #007cba;
        }

        .user-list > ul:nth-of-type(1) > li a {
            display: block;
            color: #007cba;
            padding: 10px 0;
        }

        .user-list > ul > li {
            width: 19%;
            padding: 10px 0;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            vertical-align: middle;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        .user-list > ul > li:nth-of-type(3),
        .user-list > ul > li:nth-of-type(5) {
            text-align: left;
        }

        .user-list > ul > li:nth-of-type(1) {
            width: 5%;
        }

        .user-list > ul > li:nth-of-type(5) {
            width: 10%;
        }

        .user-list > ul > li:nth-of-type(3),
        .user-list > ul > li:nth-of-type(4),
        .user-list > ul > li:nth-of-type(6) {
            width: 15%;
        }

        .user-list ul:hover {
            background-color: #f0f0f0;
            transition: .5s;
        }

        .odetails_title li {
            width: 25%;
            color: #007cba;
            text-align: center;
            padding: 10px 0;
        }

        .odetails li {
            width: 25%;
            padding: 10px 0;
            text-align: center;
            line-height: 50px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .odetails li:nth-of-type(2) {
            text-align: left;
        }

        .main-list li a {
            display: inline-block;
            color: #0f0f0f;
        }

        @media ( min-width: 768px) {
            .mobile-change {
                padding-right: 0 !important;
            }
        }

        @media ( max-width: 768px) {
            .mobile-change {
                padding-right: 15px !important;
            }
        }
    </style>
</head>
<body>
<div id="head" class="header-page" style="height: 102px; background-color: #fff">
    <%@ include file="pub_header.jsp" %>
</div>

<div class="container-fluid" style="margin-bottom: 80px; margin-top: 50px">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-2 mobile-change">
                    <%@ include file="pub_leftpage.jsp" %>
                </div>
                <div class="col-md-10">
                    <div style="width: 100%; min-height: 1000px; background-color: #fff; padding: 50px 20px 50px 20px;">
                        <h3 class="titleinfo" style="position: relative; margin-bottom: 20px"><span>订单管理</span></h3>
                        <div class="container-fluid" style="padding: 0">
                            <div class="row">
                                <div class="col-lg-12" style="padding: 20px 10px">
                                    <form action="${pageContext.request.contextPath }/adminorder/getAdminOrders">
                                        <label for="orderStatus"></label>
                                        <select class="form-control" name="status" id="orderStatus"
                                                style="width: 150px">
                                            <c:set var="statusDisc" value="<%=Constants.ORDER_STATUS_DISC%>"/>
                                            <option value="-1">---所有状态---</option>
                                            <c:forEach begin="0" end="9" var="i">
                                                <option value="${i}" ${arrarInfo[2]==i?'selected':''}>${statusDisc[i] }</option>
                                            </c:forEach>
                                        </select>
                                        <input type="submit" class="sub_select" hidden>
                                    </form>
                                </div>
                                <c:if test="${!empty orders }" var="notOrders">
                                    <div class="col-lg-12 user-list">
                                        <ul class="list-inline" style="margin: 0">
                                            <li>
                                            <span>
                                                <div class="checkbox">
                                                    <label>
                                                        <input id="checkAll" type="checkbox"
                                                               value="111"/><strong>全选</strong>
                                                    </label>
                                                </div>
                                            </span>
                                            </li>
                                            <li><a href="#">订单号</a></li>
                                            <li><a href="#">用户名</a></li>
                                            <li><a href="#">运费</a></li>
                                            <li><a href="#">订单状态</a></li>
                                            <li><a href="#">下单日期</a></li>
                                            <li><a href="#">管理</a></li>
                                        </ul>
                                        <c:forEach items="${orders}" var="ord" varStatus="vs">
                                            <ul class="list-inline" style="margin: 0">
                                                <li>
                                                        <%--<span>
                                                            <div class="checkbox">
                                                                <label><input id="id" type="checkbox" value="111"/></label>
                                                            </div>
                                                        </span>--%>
                                                    ×
                                                </li>
                                                <li>${ord.ordercode}</li>
                                                <li>【${ord.uid}】${ord.uname}</li>
                                                <li>￥${ord.postalfee}</li>
                                                <li class="orderstatus">
                                                    <c:if test="${ord.status==0}">未付款</c:if>
                                                    <c:if test="${ord.status==1}">未发货</c:if>
                                                    <c:if test="${ord.status==2}"><span style="color: #f0ad4e">未退款 <span class="glyphicon glyphicon-info-sign"></span></span></c:if>
                                                    <c:if test="${ord.status==3}">已退款</c:if>
                                                    <c:if test="${ord.status==4}">已发货</c:if>
                                                    <c:if test="${ord.status==5}"><span style="color: #5cb85c">交易完成 <span
                                                            class="glyphicon glyphicon-ok-sign"></span></span></c:if>
                                                    <c:if test="${ord.status==6}">未退货</c:if>
                                                    <c:if test="${ord.status==7}"><span style="color: #f0ad4e">申请退货 <span class="glyphicon glyphicon-info-sign"></span></span></c:if>
                                                    <c:if test="${ord.status==8}"><span style="color: #d9534f">已退货 <span
                                                            class="glyphicon glyphicon-remove-sign"></span></span></c:if>
                                                    <c:if test="${ord.status==9}"><span style="color: #d9534f">交易取消 <span
                                                            class="glyphicon glyphicon-remove-sign"></span></span></c:if>
                                                </li>
                                                <fmt:formatDate value="${ord.orderdate}" pattern="yyyy年MM月dd日"
                                                                var="fmtDate"/>
                                                <li>${fmtDate}</li>
                                                <li class="orderDo">
                                                    <c:if test="${ord.status==1}">
                                                        <a href="javascript:;"
                                                           onclick="sendGoods(${ord.orderid},4,event)"
                                                           class="btn btn-warning">立即发货</a>
                                                    </c:if>
                                                    <c:if test="${ord.status==2}">
                                                        <a href="javascript:;"
                                                           onclick="handleOrder(${ord.orderid},3,'确定要同意这个订单退款吗？',event);"
                                                           class="btn btn-warning">同意退款</a>
                                                    </c:if>
                                                    <c:if test="${ord.status==4}">
                                                        <a href="javascript:;" class="btn btn-success"
                                                           data-toggle="modal" data-target="#myModal${vs.index}">查看 /
                                                            修改</a>
                                                        <!-- 模态框（Modal） -->
                                                        <div class="modal fade" id="myModal${vs.index}" tabindex="-1"
                                                             role="dialog" aria-labelledby="myModalLabel"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <form id="alter_order" method="post"
                                                                          action="${pageContext.request.contextPath }/adminorder/updateOrder">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close"
                                                                                    data-dismiss="modal"
                                                                                    aria-hidden="true">&times;
                                                                            </button>
                                                                            <h4 class="modal-title"
                                                                                id="myModalLabel${vs.index}">
                                                                                订单查看与修改</h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <div class="form-group">
                                                                                <label for="postname"
                                                                                       class="col-sm-2 control-label">快递公司</label>
                                                                                <div class="col-sm-10">
                                                                                    <input type="text"
                                                                                           class="form-control"
                                                                                           id="postname"
                                                                                           name="orderpostname"
                                                                                           value="${ord.orderpostname}">
                                                                                </div>
                                                                            </div>
                                                                            <br/>
                                                                            <div class="form-group">
                                                                                <label for="postcode"
                                                                                       class="col-sm-2 control-label">快递单号</label>
                                                                                <div class="col-sm-10">
                                                                                    <input type="text"
                                                                                           class="form-control"
                                                                                           id="postcode"
                                                                                           name="orderpostcode"
                                                                                           value="${ord.orderpostcode}">
                                                                                </div>
                                                                            </div>
                                                                            <c:set var="totalAmount" value="0"/>
                                                                            <div class="form-group">
                                                                                <div class="col-sm-12">
                                                                                    <ul class="list-inline odetails_title">
                                                                                        <li>商品编号</li>
                                                                                        <li>
                                                                                            商&nbsp;&nbsp;品&nbsp;&nbsp;名
                                                                                        </li>
                                                                                        <li>
                                                                                            单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价
                                                                                        </li>
                                                                                        <li>订购数量</li>
                                                                                    </ul>
                                                                                    <c:forEach items="${ord.odetails}"
                                                                                               var="od"
                                                                                               varStatus="od_vs">
                                                                                        <ul class="list-inline odetails">
                                                                                            <li>${od.pid}</li>
                                                                                            <li>
                                                                                                <img src="${pageContext.request.contextPath }/statics/upprodectimg/${od.pimg}"
                                                                                                     height="50"
                                                                                                     title="${od.pname}">
                                                                                                <span title="${od.pname}">${od.pname}</span>
                                                                                            </li>
                                                                                            <li class="text_danger">
                                                                                                ￥${od.price}</li>
                                                                                            <li>${od.odetailnum}</li>
                                                                                        </ul>
                                                                                        <c:set var="totalAmount"
                                                                                               value="${totalAmount+od.odetailnum*od.price}"/>
                                                                                    </c:forEach>
                                                                                    <i>总支付额：<span
                                                                                            class="text_danger">￥${totalAmount+ord.postalfee}</span>（含运费<span
                                                                                            class="text_danger">￥${ord.postalfee}</span>）</i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="clearfix"></div>
                                                                        <div class="modal-footer">
                                                                            <button type="button"
                                                                                    class="btn btn-default"
                                                                                    data-dismiss="modal">关闭
                                                                            </button>
                                                                            <button type="button"
                                                                                    class="btn btn-primary"
                                                                                    onclick="alterOrder('确定修改吗？',${ord.orderid})">
                                                                                提交更改
                                                                            </button>
                                                                        </div>
                                                                    </form>
                                                                </div><!-- /.modal-content -->
                                                            </div><!-- /.modal -->
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${ord.status==6}">
                                                        <a href="javascript:;"
                                                           onclick="handleOrder(${ord.orderid},7,'确定要同意这个订单退货吗？',event);"
                                                           class="btn btn-success">同意退货</a>
                                                    </c:if>
                                                    <c:if test="${ord.status==7}">
                                                        <a href="javascript:;"
                                                           onclick="handleOrder(${ord.orderid},8,'确定收到这个订单退货吗？',event);"
                                                           class="btn btn-warning">已收退货</a>
                                                    </c:if>
                                                    <c:if test="${ord.status==0||ord.status==3||ord.status==8||ord.status==5||ord.status==9}">
                                                        <a href="javascript:;" class="btn btn-danger"
                                                           onclick="checkDel(${ord.orderid})">删除订单</a>
                                                    </c:if>
                                                </li>
                                            </ul>
                                        </c:forEach>
                                    </div>
                                </c:if>
                                <c:if test="${not notOrders}">
                                    <div class="col-lg-12">
                                        <div class="alert alert-info text-center none_info">
                                            <img src="${pageContext.request.contextPath }/images/robote.png"
                                                 width="150px">
                                            <span style="font-size: 20px"> 暂无订单需要管理。</span>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="postInfoFormModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-inline" role="form" id="postForm" method="post">
                <div class="modal-header">
                    <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                    <h4 class="modal-title" id="myModalLabel">添加发货信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="orderPostname"> 快递公司名称 </label>
                        <input class="form-control" name="orderPostname" id="orderPostname" type="text"
                               placeholder="快递公司名称" required/>
                    </div>
                    <div class="form-group">
                        <label for="orderPostcode"> 快递单号</label>
                        <input class="form-control" name="orderPostcode" id="orderPostcode" type="text"
                               placeholder="快递单号" required/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" data-dismiss="modal" id="ok">确定</button>
                    <button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!--锚点-->
<div class="float text-center">
    <a href="#head" title="回到顶部"><span class="glyphicon glyphicon-chevron-up"></span></a>
</div>

<div class="footer-page copyright text-center">
    <p>Copyright:For me &copy; 1019 All Rights Reserved. 金陵科技学院</p>
</div>

<script>
    $(function () {
        $(".upfile").click(function () { //点击按钮触发文件上传
            $("#inputfile").click(); //相当于点击了文件上传
            $("#inputfile").on("change", function () {
                var objUrl = getObjectURL(this.files[0]); //调用函数传参，获取图片的路径，该路径不是图片在本地的路径
                if (objUrl) {
                    $(".showdeadimg img").css("display", "block");
                    $(".showdeadimg img").attr("src", objUrl); //将图片路径存入src中，显示出图片
                }
            });
        });

        $("#orderStatus").change(function () {
            if ($("#orderStatus").val() == -1) {
                $("#orderStatus").val(null);
            }
            $(".sub_select").click();
        });

        if (${ERROR_MESSAGE!=null}) {
            alert(${ERROR_MESSAGE});
        }
    });

    function checkDel(orderid) {
        if (confirm('确定要删除这个订单吗？')) {
            $.post(
                "${pageContext.request.contextPath}/adminorder/delOrder?orderid=" + orderid,
                {orderid: orderid},
                function (date) {
                    if (date.ERROR_MESSAGE != null) {
                        alert(date.ERROR_MESSAGE);
                    } else {
                        window.location.reload();
                    }
                });
        }
    }

    function handleOrder(orderId, status, msg, e) {
        if (confirm(msg)) {
            var os = $(e.target).parent().siblings(".orderstatus");

            $.post("${pageContext.request.contextPath}/adminorder/handleOrderStatus",
                {
                    orderid: orderId,
                    status: status
                },
                function (result) {
                    if (result.handle == "success") {
                        var tdTag = $(e.target).parent();
                        tdTag.html("");
                        if (status == 9) {
                            os.html("交易关闭");
                            tdTag.html("<a href=\"javascript:;\" class=\"btn btn-danger\" onclick=\"checkDel(" + orderId + ")\">删除订单</a>");
                        }
                        else if (status == 3) {
                            os.html("退款成功");
                            tdTag.html("<a href=\"javascript:;\" class=\"btn btn-danger\" onclick=\"checkDel(" + orderId + ")\">删除订单</a>");
                        }
                        else if (status == 7) {
                            os.html("退货中");
                            tdTag.html("<a href=\"javascript:;\" onclick=\"handleOrder(" + orderId + ",8,'确定收到这个订单退货吗？',event);\" class=\"btn btn-warning\">已收退货</a>");
                        }
                        else if (status == 8) {
                            os.html("已退货");
                            tdTag.html("<a href=\"javascript:;\" class=\"btn btn-danger\" onclick=\"checkDel(" + orderId + ")\">删除订单</a>");
                        }
                        alert("操作订单成功");
                    } else if (result.handle == "failure") {
                        alert("抱歉，目前的订单状态无法进行此操作");
                    }
                    else {
                        alert("操作订单失败");
                    }
                });
        }
    }

    /*发货的方法*/
    function sendGoods(orderId, status, e) {
        $('#postInfoFormModal').modal();
        $("#ok").click(function () {
            var os = $(e.target).parent().siblings(".orderstatus");

            var orderPostname = $("#orderPostname").val();
            var orderPostcode = $("#orderPostcode").val();
            $.post(
                "${pageContext.request.contextPath}/adminorder/handleOrderStatus",
                {
                    orderid: orderId,
                    status: status,
                    orderpostname: orderPostname,
                    orderpostcode: orderPostcode
                },
                function (result) {
                    if (result.handle == "success") {
                        os.html("已发货");
                        $(e.target).parent().html("");
                        alert("操作成功");
                    } else if (result.handle == "failure") {
                        alert("抱歉，目前的订单状态无法进行此操作");
                    }
                    else {
                        alert("操作订单失败" + result.handle);
                    }
                });
        });
    }

    function alterOrder(msg, orderid) {
        if (confirm(msg)) {
            var postname = $("#postname").val();
            var postcode = $("#postcode").val();
            if (postname != null && postname != '' && postcode != null && postcode != '') {
                $("#alter_order").ajaxSubmit({
                    data: {orderid: orderid},
                    success: function (data) {
                        if (data.res_error < 0) {
                            alert("修改失败！");
                            return;
                        }
                        alert("修改成功");
                        window.location.reload();
                    }
                });
            } else {
                alert("所填内容不允许为空！");
            }
        }
    }
</script>
</body>
</html>
