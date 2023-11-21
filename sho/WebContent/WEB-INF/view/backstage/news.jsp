
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线商城-用户中心</title>
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
        .caption{
            display: inline-block;
            cursor: pointer;
            box-shadow: -3px 3px 6px #999;
        }
        .caption .one,.caption .two,.caption{
            padding-left: 10px;
            padding-right: 10px;
            border-radius: 4px;
        }
        .news-list ul:nth-of-type(1) li a{
            display: block;
            color: #007cba;
            padding: 10px 0;
        }
        .news-list ul li{
            width: 16%;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            vertical-align: middle;
        }
        .main-list li a{
            display: inline-block;
            color: #0f0f0f;
        }
        .print-news{
            display: none;
        }
    </style>
</head>
<body>
<div id="head" class="header-page" style="height: 102px; background-color: #fff">
    <%@ include file="pub_header.jsp"%>
</div>

<div class="container-fluid" style="margin-bottom: 80px; margin-top: 50px">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-2" style="padding-right: 0">
                    <%@ include file="pub_leftpage.jsp"%>
                </div>
                <div class="col-md-10">
                    <div style="width: 100%; min-height: 1900px; background-color: #fff; padding: 50px 20px 50px 20px;">
                        <h3 class="titleinfo" style="position: relative; margin-bottom: 20px"><span>新闻公告</span></h3>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12" style="padding: 20px 0">
                                    <div class="caption tit-text b-news-list">
                                        <h4 class="one">公告列表</h4>
                                    </div>
                                    <div class="caption tit-text b-print-news">
                                        <h4 class="two">发布公告</h4>
                                    </div>
                                </div>
                                <!--公告列表-->
                                <div class="col-lg-12 news-list">
                                    <ul class="list-inline" style="margin: 0">
                                        <li><a href="#">标题</a></li>
                                        <li><a href="#">发布者</a></li>
                                        <li><a href="#">发布信息</a></li>
                                        <li><a href="#">接收对象</a></li>
                                        <li><a href="#">发布时间</a></li>
                                        <li><a href="#">管理</a></li>
                                    </ul>
                                    <ul class="list-inline main-list" style="margin: 0">
                                        <li>公告标题</li>
                                        <li>CMW</li>
                                        <li>发布信息发布信息发布信息</li>
                                        <li>全部</li>
                                        <li>2019-10-10 23:23:23</li>
                                        <li>
                                            <a href="#" class="btn btn-default">修改</a>
                                            <a href="#" class="btn btn-default">删除</a>
                                        </li>
                                    </ul>
                                    <ul class="list-inline main-list" style="margin: 0">
                                        <li>公告标题</li>
                                        <li>CMW</li>
                                        <li>发布信息发布信息发布信息</li>
                                        <li>全部</li>
                                        <li>2019-10-10 23:23:23</li>
                                        <li>
                                            <a href="#" class="btn btn-default">修改</a>
                                            <a href="#" class="btn btn-default">删除</a>
                                        </li>
                                    </ul>
                                    <ul class="list-inline main-list" style="margin: 0">
                                        <li>公告标题</li>
                                        <li>CMW</li>
                                        <li>发布信息发布信息发布信息</li>
                                        <li>全部</li>
                                        <li>2019-10-10 23:23:23</li>
                                        <li>
                                            <a href="#" class="btn btn-default">修改</a>
                                            <a href="#" class="btn btn-default">删除</a>
                                        </li>
                                    </ul>
                                    <ul class="list-inline main-list" style="margin: 0">
                                        <li>公告标题</li>
                                        <li>CMW</li>
                                        <li>发布信息发布信息发布信息</li>
                                        <li>全部</li>
                                        <li>2019-10-10 23:23:23</li>
                                        <li>
                                            <a href="#" class="btn btn-default">修改</a>
                                            <a href="#" class="btn btn-default">删除</a>
                                        </li>
                                    </ul>
                                    <ul class="list-inline main-list" style="margin: 0">
                                        <li>公告标题</li>
                                        <li>CMW</li>
                                        <li>发布信息发布信息发布信息</li>
                                        <li>全部</li>
                                        <li>2019-10-10 23:23:23</li>
                                        <li>
                                            <a href="#" class="btn btn-default">修改</a>
                                            <a href="#" class="btn btn-default">删除</a>
                                        </li>
                                    </ul>
                                    <ul class="list-inline main-list" style="margin: 0">
                                        <li>公告标题</li>
                                        <li>CMW</li>
                                        <li>发布信息发布信息发布信息</li>
                                        <li>全部</li>
                                        <li>2019-10-10 23:23:23</li>
                                        <li>
                                            <a href="#" class="btn btn-default">修改</a>
                                            <a href="#" class="btn btn-default">删除</a>
                                        </li>
                                    </ul>
                                    <ul class="list-inline main-list" style="margin: 0">
                                        <li>公告标题</li>
                                        <li>CMW</li>
                                        <li>发布信息发布信息发布信息</li>
                                        <li>全部</li>
                                        <li>2019-10-10 23:23:23</li>
                                        <li>
                                            <a href="#" class="btn btn-default">修改</a>
                                            <a href="#" class="btn btn-default">删除</a>
                                        </li>
                                    </ul>
                                    <ul class="list-inline main-list" style="margin: 0">
                                        <li>公告标题</li>
                                        <li>CMW</li>
                                        <li>发布信息发布信息发布信息</li>
                                        <li>全部</li>
                                        <li>2019-10-10 23:23:23</li>
                                        <li>
                                            <a href="#" class="btn btn-default">修改</a>
                                            <a href="#" class="btn btn-default">删除</a>
                                        </li>
                                    </ul>
                                    <ul class="list-inline main-list" style="margin: 0">
                                        <li>公告标题</li>
                                        <li>CMW</li>
                                        <li>发布信息发布信息发布信息</li>
                                        <li>全部</li>
                                        <li>2019-10-10 23:23:23</li>
                                        <li>
                                            <a href="#" class="btn btn-default">修改</a>
                                            <a href="#" class="btn btn-default">删除</a>
                                        </li>
                                    </ul>
                                </div>
                                <!--公告发布-->
                                <div class="col-lg-12 print-news">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label for="news-title" class="col-sm-2 control-label">标题</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="news-title"
                                                       placeholder="请输入标题" style="width:400px">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">发布对象</label>
                                            <div class="col-sm-10">
                                                <select class="sel_year form-control" style="width: 150px">
                                                    <option value="1" selected>全部</option>
                                                    <option value="2">管理员</option>
                                                    <option value="3">指定对象</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="user-id" class="col-sm-2 control-label">指定ID</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="user-id"
                                                       placeholder="请输入对象ID" maxlength="15" style="width:150px">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="textarea">内容</label>
                                            <div class="col-sm-10">
                                                <textarea id="textarea" class="form-control" rows="20" placeholder="请输入公告信息"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group" style="padding-left: 20%">
                                            <button type="button" class="btn btn-warning btn-block"  style="width: 130px">发 布</button>
                                        </div>
                                    </form>
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

        $(".b-news-list").click(function () {
            $(".news-list").show(500);
            $(".print-news").hide(500);
        });
        $(".b-print-news").click(function () {
            $(".news-list").hide(500);
            $(".print-news").show(500);
        });
    })
</script>
</body>
</html>
