<%--
  Created by IntelliJ IDEA.
  User: MR·Wang
  Date: 2019/10/19
  Time: 下午 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线商城官网-服务与支持</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/upubliccss.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/form.js"></script>
    <style type="text/css">
        .bg-style{
            background-color: #fff;
            padding: 50px 10%;
            margin-bottom: 20px;
        }
        .title-text{
            padding: 30px 0;
        }
        .title-text>p{
            text-indent: 2em;
        }

        .nav-one>li{
            line-height: 35px;
            border-collapse: separate;
            position: relative;
            font-weight: bold;
            font-size: 20px;
            padding: 10px 0;
        }
        .nav-one>li>span{
            display: inline-block;
            width: 35px;
            height: 35px;
            text-indent: 0;
            text-align: center;
            position: absolute;
            font-size: 20px;
        }
        .sub{
            display: none;
            font-weight: normal;
        }
        .sub>p{
            text-indent: 2em;
        }
        .sub:hover{
        }
        .nav-one>.current>span{
            transform: rotate(90deg);
        }
    </style>
</head>
<body>
<header>
    <div class="header-page">
        <%@ include file="header.html" %>
    </div>
    <img class="header-img" src="${pageContext.request.contextPath }/images/lastbg.jpg" width="100%">
</header>

<div class="container-fluid bg-style">
    <h4>辉腾售后服务政策</h4>
    <div class="title-text">
        <p>感谢您选择产品和服务，我们将基于本服务政策向您提供售后服务。</p>
   
    </div>
</div>

<div class="container-fluid bg-style">
    <h4>售后服务</h4>
    <div class="box">
        <ul class="nav-one">
            <li>一．保修服务<span>&gt;</span>
                <div class="sub">
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                </div>
            </li>
            <li>二. 保修服务的例外情形 <span>&gt;</span>
                <div class="sub">
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                </div>
            </li>
            <li>三. 收费维修服务 <span>&gt;</span>
                <ul class="sub">
                    <li>二级菜单</li>
                    <li>二级菜单</li>
                    <li>二级菜单</li>
                </ul>
            </li>
            <li>四. 维修服务质量承诺 <span>&gt;</span>
                <div class="sub">
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                </div>
            </li>
            <li>五. 售后服务反馈时间<span>&gt;</span>
                <div class="sub">
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                </div>
            </li>
            <li>六. 其他声明<span>&gt;</span>
                <div class="sub">
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                </div>
            </li>
            <li>售后常见问题 <span>&gt;</span>
                <div class="sub">
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                </div>
            </li>
            <li>退换货常见问题 <span>&gt;</span>
                <div class="sub">
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                </div>
            </li>
            <li>退款常见问题 <span>&gt;</span>
                <div class="sub">
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                    <p>content content content content content content content content content content
                        content content content content content content content content content content content
                        content content content content content content content content content content</p>
                </div>
            </li>
        </ul>
    </div>
</div>

<div class="footer-page">
    <%@ include file="/page/footer.html" %>
</div>

<script>
    $(function () {
        $(".nav-one>li").click(function () {
            //children() 寻找子节点
            var sub = $(this).children(".sub");
            sub.slideDown(500);
            var otherSub = $(this).siblings().children(".sub");
            otherSub.slideUp(500);

            $(this).addClass("current");
            $(this).siblings().removeClass("current");
        });
    })
</script>
</body>
</html>
