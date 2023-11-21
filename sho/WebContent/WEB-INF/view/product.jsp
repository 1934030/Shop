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
    <div class="header-page">
        <%@ include file="/page/header.html" %>
    </div>
    <c:if test="${mycinfo.classid==1001 }" var="m_c">
        <img class="header-img" src="${pageContext.request.contextPath }/images/banner-robot-pc.jpg">
    </c:if>
    <c:if test="${mycinfo.classid==1002 }" var="m_c2">
        <img class="header-img" src="${pageContext.request.contextPath }/images/lastbg.jpg">
    </c:if>
    <c:if test="${mycinfo.classid==1004 }" var="m_c3">
        <img class="header-img" src="${pageContext.request.contextPath }/images/banner-smart2.jpg">
    </c:if>
    <c:if test="${mycinfo.classid==1005 }" var="m_c4">
        <img class="header-img" src="${pageContext.request.contextPath }/images/banner-pc.jpg">
    </c:if>
    <c:if test="${mycinfo.classid==1006 }" var="m_c5">
        <img class="header-img" src="${pageContext.request.contextPath }/images/banner-stock.jpg">
    </c:if>
    <c:if test="${not m_c && not m_c2 && not m_c3 && not m_c4 && not m_c5 }" var="m_c">
        <img class="header-img" src="${pageContext.request.contextPath }/images/lastbg.jpg">
    </c:if>
</header>

<article>
    <c:if test="${!empty mycinfo.cname }" var="emptycname">
        <h1 class="text-center" style="margin-top: 50px; margin-bottom: 50px">在线商城——${mycinfo.cname }</h1>
    </c:if>
    <c:if test="${mycinfo.cname==null }" var="nullcname">
        <h1 class="text-center" style="margin-top: 50px; margin-bottom: 50px">在线商城——全部商品</h1>
    </c:if>
    <c:if test="${not emptycname and not nullcname }">
        <h1 class="text-center" style="margin-top: 50px; margin-bottom: 50px">在线商城——该分类不存在</h1>
    </c:if>
    <c:if test="${!empty myphone[0] }" var="emptypro">
        <!-- 商品缩略图 -->
        <div class="container-fluid">
            <div class="row">
                <c:forEach items="${myphone }" var="items">
                    <form action="${pageContext.request.contextPath }/order/genorder" method="post">
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail text-center thumb-padding hover-pro">
                                <div class="text-right new-fire">
                                    <c:if test="${items.bytime>mypasetime}">
                                        <div class="new-product">新品</div>
                                    </c:if>
                                    <c:if test="${items.price>2000 }" var="price">
                                        <div class="fire-product">热销</div>
                                    </c:if>
                                </div>
                                <a href="${pageContext.request.contextPath }/product/productinfo?pid=${items.pid }">
                                    <img src="${pageContext.request.contextPath }/statics/upprodectimg/${items.pimg }" alt="图片"/>
                                </a>
                                <div class="caption">
                                    <h3>
                                        <c:out value="${items.pname }"/>
                                    </h3>
                                    <p title="产品描述文本">
                                        <c:out value="${items.descb }"/>
                                    </p>
                                    <h4 class="text-danger">
                                        <span class="glyphicon glyphicon-eye-open"></span> <span>102</span>
                                        <span>￥<c:out value="${items.price }"/></span>
                                    </h4>
                                    <input type="hidden" name="pid" value="${items.pid }">
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

        <ul class="pagination pagination-lg" style="margin-left: 50%; transform: translateX(-50%)">
            <c:choose>
                <c:when test="${mypage.hasPrePage}">
                    <!-- 有上一页显示链接 -->
                    <li>
                        <a href="${pageContext.request.contextPath }/product/showpro?scurrentPage=${mypage.currentPage - 1 }&classid=${mycinfo.classid }"
                           title="上一页">&laquo;</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/product/showpro?scurrentPage=1&classid=${mycinfo.classid }"
                           title="前往首页">首页</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a title="到头啦" style="background: #eee">&laquo;</a>
                    </li>
                    <li>
                        <a title="已是首页" style="background: #eee">首页</a>
                    </li>
                </c:otherwise>
            </c:choose>

                <%-- <c:forEach var="i" begin="1" end="${mypage.totalPage}">
            <li><a href="showphone?scurrentPage=${i }"><c:out value="${i}"/></a></li>
        </c:forEach> --%>

            <li>
                <a>第 <b>${mypage.currentPage}</b> 页 / 共 <b>${mypage.totalPage}</b>
                    页
                </a>
            </li>

            <c:choose>
                <c:when test="${mypage.hasNextPage}">
                    <li>
                        <a href="${pageContext.request.contextPath }/product/showpro?scurrentPage=${mypage.totalPage }&classid=${mycinfo.classid }"
                           title="前往尾页">尾页</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/product/showpro?scurrentPage=${mypage.currentPage + 1 }&classid=${mycinfo.classid }"
                           title="下一页">&raquo;</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a title="已是尾页" style="background: #eee">尾页</a>
                    </li>
                    <li>
                        <a title="到头啦" style="background: #eee">&raquo;</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </c:if>
    <c:if test="${not emptypro }">
        <div class="container">
            <div class="alert alert-info text-center none_info">
                <img src="${pageContext.request.contextPath }/images/robote.png" width="150px">
                <span style="font-size: 20px"> 该分类下暂无商品。</span>
            </div>
        </div>
    </c:if>
</article>
<div class="footer-page">
    <%@ include file="/page/footer.html" %>
</div>
<script type="text/javascript">
    $(function () {
        $("a[href*=showphone]").click(function () {
            //遍历a标签，a特点：URL不同，但显示的数据风格相同，此处可用$.post()获取数据，进行页面局部刷新
        })
    })
</script>
</body>
</html>