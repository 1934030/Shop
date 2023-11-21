
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>在线商城</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <style type="text/css">
        body {
            background: url("${pageContext.request.contextPath }/images/errorimages/education.jpg") no-repeat;
            background-size: cover;
        }
        a:hover{
            text-decoration: none;
        }
        .v-center{
            width: 60%;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
        }
    </style>
</head>
<body>
<%--<c:set var="er" value="${execute_result}"/>
<c:forEach items="${er.redirURLs}" var="ru">
    <c:set var="redirKey" value="${ru.key}"/>
    <c:set var="redirValue" value="${ru.value}"/>
</c:forEach>--%>

<div class="v-center">
    <div class="alert alert-info text-center">
        <img src="${pageContext.request.contextPath }/images/robote.png" width="150px"> <span
            style="font-size: 22px"> 您的管理权限不足，无法访问！</span>
        <h4>
            【<span class="cspan" style="color: #f00; font-size: 36px">--</span>】秒后将跳转至主页面！
        </h4>
        <h4 style="padding: 20px">
            温馨提示：如未跳转请点击【<a href="${pageContext.request.contextPath }/admin/topage?page=index" style="color: #f00; font-size: 26px">后台主页</a>】
        </h4>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        var i = 3;
        $(".cspan").html(i);
        setInterval(function () {
            if (i > 0) {
                i--;
                $(".cspan").html(i);
            } else {
                window.location = "${pageContext.request.contextPath }/admin/topage?page=index";
            }
        }, 1000);
    })
</script>
</body>
</html>
