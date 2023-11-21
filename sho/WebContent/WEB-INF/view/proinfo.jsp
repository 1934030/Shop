<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>在线商城官网</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/productcss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/upubliccss.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/form.js"></script>
    <!--此文件要放在jquery下方-->
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

        /*评论样式*/
        .content {
            width: 60%;
            min-height: 300px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
        }

        .center {
            height: 200px;
            padding: 10px;
            position: relative;
            background-color: #fff;
        }

        .center .comment {
            width: 100%;
            height: 73px;
            background-color: white;
            resize: none; /*禁止输入框拖拽*/
            font-size: 16px;
        }

        .center .send {
            position: absolute;
            right: 10px;
            bottom: 10px;
            width: 80px;
            line-height: 35px;
            background: #f60;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        .content .message {
            width: 100%;
            min-height: 100px;
            margin-top: 20px;
        }

        .message {
            background-color: #fff;
        }

        .message .info {
            padding: 10px;
            border-bottom: 2px solid #ccc;
            overflow: hidden; /*子元素浮动，父元素清除浮动可撑起内容*/
        }

        .info .infoText {
            line-height: 25px;
            margin-bottom: 10px;
        }

        .info .infoTime {
            font-size: 14px;
            color: #bbb;
            float: left;
        }

        .info .top, .info .down, .info .deleteInfo {
            font-size: 14px;
            color: #bbb;
            float: right;
            cursor: pointer;
            padding: 0 4px;
            user-select: none;
        }
    </style>
</head>
<body>
<div class="header-page" style="height: 110px;">
    <%@ include file="/page/header.html" %>
</div>

<c:if test="${!empty myproinfo}" var="itinfo">
    <div class="container-fluid"
         style="background: #fff; margin-top: 80px;">
        <form action="${pageContext.request.contextPath }/usercart/addcart" method="post">
            <input type="hidden" value="${myinfo.uid}" name="uid">
            <input type="hidden" class="numbers" value="1" name="numbers">
            <div class="container" style="padding: 50px 0">
                <div class="row">
                    <div class="col-lg-5" style="overflow: hidden;">
                        <img src="${pageContext.request.contextPath }/statics/upprodectimg/${myproinfo.pimg}"
                             alt="">
                    </div>
                    <div class="col-lg-7">
                        <h3>${myproinfo.pname }</h3>
                        <small>${myproinfo.descb }</small>
                        <div
                                style="padding: 20px; background-color: rgba(0, 0, 0, .1); margin: 20px 0;">
                            <h5>
                                价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：<span
                                    class="text-danger" style="font-size: 2rem">¥<span
                                    class="sellprice">${myproinfo.price }</span></span>
                            </h5>
                            <div class="pull-left">促&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销：</div>
                            <div class="pull-left spec">
                                <div>
                                    <span>整点赠送</span> 0/10/18/20/22整点下单，前100名赠不锈钢保温杯
                                </div>
                                <div style="margin: 10px 0">
                                    <span class="">便捷支付</span> 支持在线支付宝、花呗、微信支付等
                                </div>
                                <div>
                                    <span>赠送积分</span> 购买即赠用户积分，可提升等级，享受优惠
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <c:if test="${myproinfo.price>48 }" var="ifprice">
                            <h5>服务说明：已满48元已免运费 由本商城负责发货，并提供售后服务</h5>
                        </c:if>
                        <c:if test="${not ifprice }">
                            <h5>
                                服务说明：<span class="text-danger">未满48元</span>运费自费 由本商城负责发货，并提供售后服务
                            </h5>
                        </c:if>
                        <input type="hidden" name="pid" value="${myproinfo.pid }">
                        <h5 style="border-bottom: 1px solid #999; padding: 20px 0">商品编码：${myproinfo.pid }</h5>
                        <h5>库&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存：${myproinfo.stock }件</h5>
                        <h4 class="text-primary text-right">
                            小计：￥<span class="price_all">${myproinfo.price }</span>
                        </h4>
                        <div id="pro-quantity-area">
                            <div class="pull-left product-stock" style="margin: 0 10px">
                                <div class="input-group btn-clock input-group-xadd">
                                    <input type="hidden" value="1000000" class="hiddenVal">
                                    <span class="form-reduce"></span>
                                    <input type="text" name="pronum" value="1" max="${myproinfo.stock }" size="1"
                                           class="form-control qtlimit commodityQty"
                                           style="width: 46px; text-align: center;">
                                    <span class="form-add"></span>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-lg pull-right gen-order">立即下单</button>
                            <button type="submit" class="btn btn-danger btn-lg pull-right cart-add"
                                    style="margin-right: 20px">加入购物车
                            </button>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="content">
        <div class="center">
            <p>评论发布</p>
            <textarea class="comment"></textarea>
            <input type="button" class="send" value="发 布" disabled>
        </div>
        <div class="message">
            <div class="info">
                <p class="infoText">
                    #在线商城#【#4个真评4条新闻#】测试用户1：盲人虽然眼睛看不见，
                    但心里却能感知真假；与人交往，承诺过的事情希望以真实行动来兑现；如果出了事故，
                    发生了事情，我们希望知道真相；对于文物，我们希望看到真品。假的真不了，
                    真的也假不了。同意的，转！
                </p>
                <p class="infoTime">10月15日 22:23 </p>
                <p class="deleteInfo">删除</p>
                <p class="down">踩<span>46</span></p>
                <p class="top">顶<span>134257</span></p>
            </div>
        </div>
    </div>
</c:if>
<c:if test="${not itinfo}">
    <div class="container">
        <div class="alert alert-danger text-center none_info">
            <img src="${pageContext.request.contextPath }/images/robote.png" width="150px">
            <span> 该商品并不存在！</span>
        </div>
    </div>
</c:if>

<div class="footer-page">
    <%@ include file="/page/footer.html" %>
</div>

<script src="${pageContext.request.contextPath }/js/publicjs.js"></script>
<script>
    $(function () {
        //由于事件委派delegate() 已弃用，所以用on()代替，此处做实时监听有无输入内容
        $("body").on("propertychange input", ".comment", function (event) {
            if ($(this).val().length > 0) {
                //prop()返回布尔值，此处使用它让按钮可用，而不是attr()
                $(".send").prop("disabled", false);
            } else {
                $(".send").prop("disabled", true);
            }
        });

        $("body").on("click", ".top", function (event) {
            $(this).find("span").text(parseInt($(this).find("span").text()) + 1);
        });
        $("body").on("click", ".down", function (event) {
            $(this).find("span").text(parseInt($(this).find("span").text()) + 1);
        });
        $("body").on("click", ".deleteInfo", function (event) {
            //寻找祖先节点parents()
            $(this).parents(".info").remove();
        });

        $(".send").click(function () {
            var $text = $(".comment").val();
            var $weibo = createEle($text);
            //在最前方插入，使用prepend()方法
            $(".message").prepend($weibo);
            //记得清除文本框内容！
            $(".comment").val("");
        });

        /* 6.评论生成辅助方法*/

        //自定义函数创建节点
        function createEle(text) {
            var $weibo = $("<div class=\"info\">\n" +
                "            <p class=\"infoText\">" + text + "</p>\n" +
                "            <p class=\"infoTime\">" + formatDate() + "</p>\n" +
                "            <p class=\"deleteInfo\">删除</p>\n" +
                "            <p class=\"down\">踩<span>0</span></p>\n" +
                "             <p class=\"top\">顶<span>0</span></p>\n" +
                "        </div>");
            return $weibo;
        }

        //生成格式化时间
        function formatDate() {
            var date = new Date();
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day = date.getDay();
            var hour = changeTime(date.getHours());
            var minutes = changeTime(date.getMinutes());
            var second = changeTime(date.getSeconds());

            function changeTime(t) {
                if (t < 10)
                    return "0" + t;
                else
                    return t;
            }

            var arr = [year + "-", month + "-", day + " ", hour + ":", minutes + ":", second];
            //join()可以将数组输出为字符串
            return arr.join("");
            //也可这样返回return year+"-"+month+"-"+day;
        }

        $(".gen-order").click(function () {
            $("form").attr("action", "${pageContext.request.contextPath }/order/genorder");
        });

        $(".cart-add").click(function () {
            $(".numbers").val($(".commodityQty").val());
        });
    });
</script>
</body>
</html>