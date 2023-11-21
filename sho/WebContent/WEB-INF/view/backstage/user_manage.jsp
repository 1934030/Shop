
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        .user-list ul:nth-of-type(1) li {
            color: #007cba;
        }

        .user-list ul:nth-of-type(1) li a {
            display: block;
            color: #007cba;
            padding: 10px 0;
        }

        .user-list ul li {
            width: 12.8%;
            padding: 10px 0;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            vertical-align: middle;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }
        .user-list ul li:nth-of-type(n+1){
            text-align: left;
        }
        .user-list ul li:nth-of-type(1){
            text-align: center;
        }
        .user-list ul li:nth-of-type(1),
        .user-list ul li:nth-of-type(2),
        .user-list ul li:nth-of-type(4),
        .user-list ul li:nth-of-type(7) {
            width: 5%;
        }

        .user-list ul:hover {
            background-color: #f0f0f0;
            transition: .5s;
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
                        <h3 class="titleinfo" style="position: relative; margin-bottom: 20px"><span>用户管理</span></h3>
                        <div class="container-fluid" style="padding: 0">
                            <div class="row">
                                <div class="col-lg-12" style="padding: 20px 10px">
                                    <%--<button type="button" class="btn btn-warning" title="不可用" disabled>批量删除</button>
                                    <button type="button" class="btn btn-danger" title="不可用" disabled>一键删除</button>--%>
                                </div>
                                <div class="col-lg-12 user-list">
                                    <h3>基础信息</h3>
                                    <span>点击修改查看详情信息</span>
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
                                        <li><a href="#">账号</a></li>
                                        <li><a href="#">用户名</a></li>
                                        <li><a href="#">年龄</a></li>
                                        <li><a href="#">手机号</a></li>
                                        <li><a href="#">住址</a></li>
                                        <li><a href="#">状态</a></li>
                                        <li><a href="#">注册时间</a></li>
                                        <li><a href="#">最后登录</a></li>
                                        <li><a href="#">管理</a></li>
                                    </ul>
                                    <div class="loading text-center">
                                        <span style="font-size: 18px">数据加载中 </span>
                                        <img src="${pageContext.request.contextPath}/images/timg.gif"
                                             width="30px">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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

        /*加载数据*/
        $.ajax({
            url: "${pageContext.request.contextPath }/adminuser/showalluser",
            success: function (date) {
                var html = "";
                for (var i = 0; i < date.adm_alluser.length; i++) {
                    var obj = date.adm_alluser[i];
                    html+=getHtml(obj);
                }
                setTimeout(function () {
                    $(".loading").css("display", "none");
                    $(".user-list").append(html);
                }, 500);
            },
            error: function (er) {
                console.log("错误：" + er.toSource);
            }
        });
        function getHtml(obj) {
            var $status = "暂无数据";
            if(obj.status==1){
                $status = "在线";
            }else{
                $status = "离线";
            }
            var $birthday = "暂无数据";
            if(obj.birthday!=null){
                $birthday = obj.birthday;
            }
            var $phone = "暂无数据";
            if(obj.phone!=null){
                $phone = obj.phone;
            }
            var $address = "暂无数据";
            if(obj.address!=null){
                $address = obj.address;
            }
            var $lasttime = "暂无数据";
            if(obj.lasttime!=null){
                $lasttime = obj.lasttime;
            }
            var $html = "<ul class='list-inline main-list'><li><span>×</span></li>\n<li>"
                + obj.uid + "</li>\n<li>"
                + "<img src='${pageContext.servletContext.contextPath}/statics/uploadfiles/"+ obj.headimg +"' class='img-circle' alt='' width='50' height='50'><span title='用户名'> "
                + obj.uname + "</span></li>\n<li>"
                + $birthday + "</li>\n<li>"
                + $phone + "</li>\n<li>"
                + $address + "</li>\n<li>"
                + $status + "</li>\n<li>"
                + obj.bytime + "</li>\n<li>"
                + $lasttime + "</li>\n<li>"
                + "<a href='${pageContext.request.contextPath}/adminuser/useralter?uid="+obj.uid+"' class='btn btn-default'>修改</a>\n"
                + "<button type='button' class='btn btn-warning' onclick=\"delUser("+obj.uid+")\">删除</button></li></ul>";
            return $html;
        }
    });

    function delUser(uid) {
        if(confirm("你确定要删除该用户吗？")){
            $.post(
                "${pageContext.request.contextPath}/adminuser/delUser",
                {uid:uid},
                function (date) {
                    if(date.delU_res>0){
                        alert("删除成功！");
                        window.location.reload();
                    }else{
                        alert("删除失败！");
                    }
                }
            );
        }
    }
</script>
</body>
</html>
