<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/productcss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/upubliccss.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/form.js"></script>
    <!--此文件要放在jquery下方-->
    <script src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<header>
    <!--抛锚点-->
    <div id="head" class="class">
        <%@ include file="/page/header.html" %>
    </div>
    <img class="header-img" src="${pageContext.request.contextPath }/images/lastbg.jpg">
</header>

<article>
    <h1 class="text-center" style="margin-top: 50px; margin-bottom: 50px">在线商城——搜索结果</h1>
    <h4 style="padding: 20px 10%">搜索关键词：<strong class="text-danger">${search_key}</strong></h4>
    <c:if test="${!empty search_list}" var="itsearch">
        <!-- 商品缩略图 -->
        <div class="container-fluid">
            <div class="row">
                <c:forEach items="${search_list}" var="i_s">
                    <form action="${pageContext.request.contextPath }/order/genorder" method="post">
                    <div class="col-sm-6 col-md-3">
                        <div class="thumbnail text-center thumb-padding hover-pro">
                            <div class="text-right new-fire">
                                <c:if test="${i_s.bytime>mypasetime}">
                                    <div class="new-product">新品</div>
                                </c:if>
                                <c:if test="${i_s.price>2000 }" var="price">
                                    <div class="fire-product">热销</div>
                                </c:if>
                            </div>
                            <a href="productinfo?pid=${i_s.pid}">
                                <img src="${pageContext.request.contextPath }/statics/upprodectimg/${i_s.pimg}" alt="图片"/>
                            </a>
                            <div class="caption">
                                <h3>${i_s.pname}</h3>
                                <p title="产品描述文本">${i_s.descb}</p>
                                <h4 class="text-danger">
                                    <span class="glyphicon glyphicon-eye-open"></span> <span>102</span>
                                    <span>￥${i_s.price}</span>
                                </h4>
                                <input type="hidden" name="pid" value="${i_s.pid }">
                                    <%-- 此处隐藏域默认为购买 1 件 --%>
                                <input type="hidden" name="pronum" value="1">
                                <button type="submit" class="btn btn-primary">立即购买</button>
                            </div>
                        </div>
                    </div>
                    </form>
                </c:forEach>
            </div>
        </div>
    </c:if>
    <c:if test="${not itsearch}">
        <div class="container">
            <div class="alert alert-danger text-center none_info">
                <img src="${pageContext.request.contextPath }/images/robote.png" width="150px">
                <span> 没有搜索到结果 o . O ！</span>
            </div>
        </div>
    </c:if>
</article>

<!--锚点-->
<div class="float text-center">
    <a href="#head" title="回到顶部"><span class="glyphicon glyphicon-chevron-up"></span></a>
</div>

<div class="footer-page">
    <%@ include file="/page/footer.html" %>
</div>

<script src="${pageContext.request.contextPath }/js/publicjs.js"></script>
<script type="text/javascript">
    $(function () {
        $("a[href*=showphone]").click(function () {
            //遍历a标签，a特点：URL不同，但显示的数据风格相同，此处可用$.post()获取数据，进行页面局部刷新
        })
    })
</script>
</body>
</html>