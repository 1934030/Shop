<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>在线商城官网-用户中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/upubliccss.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/form.js"></script>
    <!--bootstrap.min.js文件要放在jquery下方-->
    <script src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/publicjs.js"></script>
    <style>
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

        .cart-account .delete_all {
            position: absolute;
            top: 0;
            right: 0;
            border: 1px solid #f60;
        }

        .cart-account .deletes {
            position: absolute;
            top: 0;
            right: 90px;
            border: 1px solid #007cba;
            color: #007cba;
        }

        .cart-account .delete a {
            text-decoration: none;
            color: #007cba;
        }

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
            width: 10%;
            padding-right: 20px;
            text-align: left;
        }

        .cart-contain .contain-header ul > li:nth-child(2) {
            width: 15%;
            padding-right: 20px;
            text-align: left;
        }

        .cart-contain .contain-header ul > li:nth-child(3) {
            width: 50%;
            text-align: left;
        }

        .cart-contain .contain-header ul > li:nth-child(4) {
            width: 25%;
        }

        .cart-contain .contain-good {
            padding: 0 20px;
        }

        .cart-contain .contain-good ul {
            width: 100%;
            display: table;
            color: #a4a4a4;
            font-size: 14px;
            padding: 0;
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
            width: 10%;
            padding-right: 20px;
            text-align: left;
        }

        .cart-contain .contain-good ul > li:nth-of-type(2) {
            width: 15%;
            padding-right: 20px;
            text-align: left;
        }

        .cart-contain .contain-good ul > li:nth-of-type(3) {
            width: 50%;
            text-align: left;
        }

        .cart-contain .contain-good ul > li:nth-of-type(4) {
            width: 25%;
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<!--抛锚点-->
<div id="head" class="class" style="height: 110px">
    <%@ include file="/page/header.html" %>
</div>

<div class="container-fluid"
     style="margin-bottom: 80px; margin-top: 50px">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="row">
                <div class="col-md-2" style="background-color: #fff; padding-bottom: 50px">
                    <%@ include file="pub_left.jsp"%>
                </div>
                <div class="col-md-10">
                    <div style="width: 100%; min-height: 1000px; background-color: #fff; padding: 50px 20px 50px 20px;">
                        <div class="panel-group" id="accordion">
                            <div class="cart-container-header" style="position: relative">
                                <h3 class="titleinfo" style="position: relative; margin-bottom: 20px">
                                    <span>我的日志</span>
                                    <small style="display: inline-block;">
                                        &nbsp;&nbsp;已加载最近【
                                        <strong class="showeve">
                                            <c:if test="${mylog_count<10 }" var="mcount">
                                                ${mylog_count }
                                            </c:if>
                                            <c:if test="${not mcount }">
                                                10
                                            </c:if>
                                        </strong>
                                        】条记录
                                    </small>
                                </h3>
                                <div class="cart-account">
                                    <a href="${pageContext.request.contextPath}/log/dellogall" class="del_all">
                                        <button type="button" name="button" class="btn btn-danger delete_all">一键删除
                                        </button>
                                    </a>
                                        <button type="button" name="button" class="btn btn-default deletes">批量删除
                                        </button>
                                </div>
                                <!--商品显示-->
                                <div class="cart">
                                    <form action="https://www.royole.com/cart-edit" id="cart" method="post">
                                        <div class="cart-contain">
                                            <div class="contain-header">
                                                <ul>
                                                    <li>
                                                        <span>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input id="checkAll" type="checkbox" value="111"/>全选
                                                                </label>
                                                            </div>
														</span>
                                                    </li>
                                                    <li><span>操作者</span></li>
                                                    <li><span>信息</span></li>
                                                    <li><span>操作时间</span></li>
                                                </ul>
                                            </div>
                                            <div class="contain-good">
                                                <c:if test="${!empty mylog_info[0] }" var="e_log">
                                                    <c:forEach items="${mylog_info }" var="itemslog">
                                                        <ul>
                                                            <li>
                                                                <span>
                                                                    <div class="checkbox">
                                                                        <label>
                                                                            <input name="subBox" type="checkbox"
                                                                                   value="${itemslog.logid }"/>
                                                                        </label>
                                                                    </div>
																</span>
                                                            </li>
                                                            <li>${itemslog.uname }</li>
                                                            <li>${itemslog.descb }</li>
                                                            <li>${itemslog.bytime }</li>
                                                        </ul>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${not e_log }">
                                                    <div class="alert alert-info text-center" style="margin-top: 50px">
                                                        <img src="${pageContext.request.contextPath}/images/robote.png" width="100px">
                                                        <span style="font-size: 20px"> 暂无日志记录。</span>
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="center-block text-center loading"
                                                 style="width: 50%; display: none">
                                                <img src="${pageContext.request.contextPath}/images/timg.gif"
                                                     width="30px">
                                                <span>加载中...</span>
                                            </div>
                                            <c:choose>
                                                <c:when test="${myload.hasNextPage}">
                                                    <!-- 有上一页显示按钮 -->
                                                    <div class="center-block text-center" style="width: 50%;">
                                                        <button type="button" class="btn btn-primary toloading">继续加载
                                                        </button>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </form>
                                </div>
                                <!--商品展示 end-->
                            </div>
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

<script type="text/javascript">
    $(function () {
        var scurrentPage = ${myload.currentPage + 1 };

        $(".toloading").click(function () {
            $(".loading").css("display", "block");
            $(".toloading").css("display", "none");

            $.ajax({
                url: "getload",
                data: {"scurrentPage": scurrentPage},
                dataType: "json",
                type: "post",
                success: function (date) {
                    setTimeout(function () {
                        var hasnext = date[0].logpage;
                        switch (hasnext) {
                            case true:
                                $(".loading").css("display", "none");
                                $(".toloading").css("display", "");
                                for (var i = 0; i < date.length; i++) {
                                    $(".contain-good").append("<ul><li><span><div class='checkbox'><label> <input name='subBox' type='checkbox' value='"
                                        + date[i].log_id
                                        + "' /></label></div></span></li>"
                                        + "<li>" + date[i].logbyname + "</li>"
                                        + "<li>" + date[i].logdescb + "</li>"
                                        + "<li>" + date[i].logtime + "</li>"
                                        + "</ul>");
                                }
                                var ul_num = $(".contain-good").find("ul").length;
                                $(".showeve").html(ul_num);

                                scurrentPage++;
                                break;

                            default:
                                for (var i = 0; i < date.length; i++) {
                                    $(".contain-good").append("<ul><li><span><div class='checkbox'><label> <input name='subBox' type='checkbox' value='"
                                        + date[i].log_id
                                        + "' /></label></div></span></li>"
                                        + "<li>" + date[i].logbyname + "</li>"
                                        + "<li>" + date[i].logdescb + "</li>"
                                        + "<li>" + date[i].logtime + "</li>"
                                        + "</ul>");
                                }
                                var ul_num = $(".contain-good").find("ul").length;
                                $(".showeve").html(ul_num);
                                $(".loading").css("display", "none");
                                break;
                        }
                    }, 700);
                },
                error: function () {
                    alert("error");
                }
            });
        });

        /*购物车相关*/
        /* 全选和全不选 */
        $("#checkAll").click(function () {
            if (this.checked == true) {
                $("input[name='subBox']").each(function () {
                    this.checked = true;
                })
            } else if (this.checked == false) {
                $('input[name="subBox"]').each(function () {
                    this.checked = false;
                })
            }
        });

        $(".deletes").click(function () {   //点击批量删除时获取所有选中的日志id
            var logids = [];
            $("input[name='subBox']:checked").each(function (value) {
                logids.push($(this).val());   //将所有选中的id放入数组传递
            });

            if(logids.length>=1){
                $.post("${pageContext.request.contextPath}/log/delLogbyids",{"logids":logids},function (date) {
                    if(date["my_i"]>0){
                        alert("删除成功！");
                        window.location.reload();
                    }else {
                        alert("删除失败！");
                    }
                });
            }else {
                alert("请至少选择一个进行操作！");
            }
        });

        $(".del_all").click(function (e) {
            var isClick = confirm("确认一键删除所有日志吗？");
            if(!isClick){
                e.preventDefault(); //阻止 a 标签的默认跳转链接行为，即不跳转
            }
        });
        if(${my_del_i>0}){
            alert("一键删除成功！");
        }
    })
</script>
</body>
</html>