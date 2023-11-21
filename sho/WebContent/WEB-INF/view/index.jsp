
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
    <title>在线商城官网-首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/indexcss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/upubliccss.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/form.js"></script><!--此文件要放在jquery下方-->
    <script src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!--抛锚点-->
<div id="head" class="class">
    <%@ include file="/page/header.html" %>
</div>
<!--data-ride="carousel"设置自动轮播 data-interval="2000"为轮播间隔2秒-->
<div id="myCarousel" class="carousel slide height-style" data-ride="carousel" data-interval="3000">
    <!-- 轮播指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- 轮播项目 -->
    <div class="carousel-inner bg-height">
        <div class="item active"></div>
        <div class="item"></div>
        <div class="item"></div>
    </div>
    <!-- 轮播导航 -->
    <a class="left carousel-control2" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control2" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"
              style="left: 0;transform: translate(25%,-50%);"></span>
        <span class="sr-only">Next</span>
    </a>
    <div class="float-img"><img src="${pageContext.request.contextPath }/images/bottom_arrow_normal.png"
                                class="bottom-img"></div>
</div>

<!--热门商品展示-->
<div class="container-fluid" style="margin-top: 80px;">
    <div class="goto" id="goto"></div>
    <!--模块一-->
    <h1 class="text-center">热门商品系列</h1>
    <div class="row row1 text-center get_ele">
        <div class="col-lg-6">
            <a href="#" class="a1_img">
                <img src="${pageContext.request.contextPath }/images/infor.png" alt="图片">
            </a>
        </div>
        <div class="col-lg-6">
            <!--内嵌列-->
            <div class="row row2 text-center">
                <div class="col-lg-12">
                    <a href="#" class="a2_img">
                        <img src="${pageContext.request.contextPath }/images/infor.png" alt="图片">
                    </a>
                </div>
                <div class="col-lg-12 a2_margin">
                    <a href="#" class="a2_img">
                        <img src="${pageContext.request.contextPath }/images/infor.png" alt="图片">
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!--模块二-->
    <div class="row center-content" style="padding-bottom: 80px">
        <%--<img src="" alt="图片">--%>
        <h1 class="text-center">"柔性+" 商用解决方案</h1>
        <p class="text-center">金陵科技学院公司是全球柔性显示、柔性传感、柔性屏手机及相关智能设备的领航者，</p>
        <p class="text-center">专注于下一代人机交互及万物互联技术和产品的研究、开发、生产及销售。</p>
        <div class="col-lg-4">
            <img alt="图片" src="${pageContext.request.contextPath }/images/siba.jpg" width="100%">
        </div>
        <div class="col-lg-4 margin-div">
            <img alt="图片" src="${pageContext.request.contextPath }/images/sibb.jpg" width="100%">
        </div>
        <div class="col-lg-4">
            <img alt="图片" src="${pageContext.request.contextPath }/images/sibc.jpg" width="100%">
        </div>
        <div class="col-lg-4" style="margin-top: 30px">
            <img alt="图片" src="${pageContext.request.contextPath }/images/sibd.jpg" width="100%">
        </div>
        <div class="col-lg-4" style="margin-top: 30px">
            <img alt="图片" src="${pageContext.request.contextPath }/images/sibe.jpg" width="100%">
        </div>
        <div class="col-lg-4" style="margin-top: 30px">
            <img alt="图片" src="${pageContext.request.contextPath }/images/sibf.jpg" width="100%">
        </div>
    </div>
    <!--模块三-->
    <div class="row" style="margin-top: 80px">
        <h1 class="text-center" style="margin-bottom: 30px">"柔性+" 技术</h1>
        <div class="col-lg-6">
            <div class="text-left public-div">
                <img src="${pageContext.request.contextPath }/images/flexible_screen_img3.jpg" alt="图片">
                <h3>柔性显示屏</h3>
                <p>在全球第一个发布了国际业界最薄、</p>
                <p>厚度仅0.01毫米的柔性显示屏，</p>
                <p>引领了柔性显示和柔性电子产业的新潮流，</p>
                <p>并于2018年大规模在量产线上成功点亮投产。</p>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="text-left public-div">
                <img src="${pageContext.request.contextPath }/images/flexible_sence_img.jpg" alt="图片">
                <h3>柔性传感器</h3>
                <p>柔性传感器由柔性显示技术衍生而来，</p>
                <p>是集新材料、新工艺、新设计于一体的全方位创新产品</p>
                <p>其性能卓越、成本低，并可大幅缩短制作周期，</p>
                <p>具有极大的竞争力。</p>
            </div>
        </div>
    </div>
</div>
<!--锚点-->
<div class="float text-center">
    <a href="#head" title="回到顶部"><span class="glyphicon glyphicon-chevron-up"></span></a>
</div>

<!--公共版权文件以include方式引入-->
<div class="footer-page">
    <%@ include file="/page/footer.html" %>
</div>

<script src="${pageContext.request.contextPath }/js/publicjs.js"></script>
<script>
    $(function () {
        var $img = $(".get_ele img");
        var $a = $(".get_ele a");
        $.ajax({
            url: "${pageContext.servletContext.contextPath}/product/getHotList",
            success: function (date) {
                console.log(date.my_pro_list[1]);
                for (var i = 0; i < date.my_pro_list.length; i++) {
                    var obj = date.my_pro_list[i];
                    $img.eq(i).attr("src", "${pageContext.servletContext.contextPath}/statics/upprodectimg/" + obj.pimg);
                    $a.eq(i).attr("href", "${pageContext.servletContext.contextPath}/product/productinfo?pid=" + obj.pid);
                }
            }
        })
    })
</script>
</body>
</html>