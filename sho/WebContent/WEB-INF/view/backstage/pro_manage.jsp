
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
            width: 100%;
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

        .user-list ul {
            padding: 0;
            margin: 0;
        }

        .user-list ul:hover {
            background-color: #f0f0f0;
            transition: .5s;
        }

        .user-list ul li {
            width: 14%;
            padding: 10px 0;
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
        .user-list ul li:nth-of-type(3){
            width: 23%;
        }
        .user-list ul li:nth-of-type(5){
            width: 8%;
        }
        .user-list ul li:nth-of-type(1),
        .user-list ul li:nth-of-type(5),
        .user-list ul li:nth-of-type(6),
        .user-list ul li:nth-of-type(7),
        .user-list ul li:nth-of-type(9){
            text-align: center;
        }
        .user-list ul li:nth-of-type(1),
        .user-list ul li:nth-of-type(2),
        .user-list ul li:nth-of-type(6),
        .user-list ul li:nth-of-type(7) {
            width: 6%;
        }

        .show-list ul li {
            padding: 4px;
        }

        .main-list li a {
            display: inline-block;
            color: #0f0f0f;
        }

        .user-list ul li img {
            box-shadow: 0 0 4px #c0c0c0;
        }

        /*.moredescb span:hover{
            position: fixed;
            border: 1px solid #000;
            transition: .5s;
            width: 200px;
            min-height: 50px;
            line-height: 50px;
        }*/
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
                        <h3 class="titleinfo" style="position: relative; margin-bottom: 20px"><span>商品管理</span></h3>
                        <div class="container-fluid" style="padding: 0">
                            <div class="row">
                                <div class="col-lg-12" style="padding: 20px 10px">
                                    <a href="${pageContext.request.contextPath }/admin/topage?page=pro_add" class="btn btn-primary">添加商品</a>
                                    <a href="${pageContext.request.contextPath }/admin/topage?page=pro_manage_sort" class="btn btn-warning">分类管理</a>
                                </div>
                                <div class="user-list">
                                    <h3>基础信息</h3>
                                    <span>点击修改查看详情信息</span>
                                    <ul class="list-inline">
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
                                        <li><a href="#">编号</a></li>
                                        <li><a href="#">商品名</a></li>
                                        <li><a href="#">产品描述</a></li>
                                        <li><a href="#">类别名称</a></li>
                                        <li><a href="#">价格</a></li>
                                        <li><a href="#">库存</a></li>
                                        <li><a href="#">上架时间</a></li>
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

                        <%--分页--%>
                        <%--<ul class="pagination pagination-lg" style="margin-left: 50%; transform: translateX(-50%)">
                            <!-- 有上一页显示链接 -->
                            <li class="hasper">
                                <a href="showphone?scurrentPage=${mypage.currentPage - 1 }&classid=${mycinfo.classid }"
                                   title="上一页">&laquo;</a>
                            </li>
                            <li class="hasper">
                                <a href="showphone?scurrentPage=1&classid=${mycinfo.classid }" title="前往首页">首页</a>
                            </li>
                            <li class="noper">
                                <a title="到头啦" style="background: #eee">&laquo;</a>
                            </li>
                            <li class="noper">
                                <a title="已是首页" style="background: #eee">首页</a>
                            </li>

                            <li style="display: inline-block">
                                <a>第 <b class="thispage">--</b> 页 / 共 <b class="allpage">--</b> 页</a>
                            </li>

                            <li class="hasnext">
                                <a href="showphone?scurrentPage=${mypage.totalPage }&classid=${mycinfo.classid }"
                                   title="前往尾页">尾页</a>
                            </li>
                            <li class="hasnext">
                                <a href="showphone?scurrentPage=${mypage.currentPage + 1 }&classid=${mycinfo.classid }"
                                   title="下一页">&raquo;</a>
                            </li>
                            <li class="nonext">
                                <a title="已是尾页" style="background: #eee">尾页</a>
                            </li>
                            <li class="nonext">
                                <a title="到头啦" style="background: #eee">&raquo;</a>
                            </li>
                        </ul>--%>
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

        /*加载商品数据列表*/
        $.ajax({
            url: "${pageContext.request.contextPath }/adminproduct/productlist",
            success: function (date) {
                var html = "";
                for (var i = 0; i < date.pro_all_list.length; i++) {
                    var prolists = date.pro_all_list[i];
                    html += "<ul class='list-inline main-list'>\n" +
                        "                            <li><span>×</span></li>\n" +
                        "                            <li>"+prolists.pid+"</li>\n" +
                        "                            <li><img src='${pageContext.request.contextPath }/statics/upprodectimg/"+prolists.pimg+"' alt='' width='80px'><span title='"+prolists.pname+"'> "+prolists.pname+"</span></li>\n" +
                        "                            <li class='moredescb'><span>"+prolists.descb+"</span></li>\n" +
                        "                            <li>"+prolists.cname+"</li>\n" +
                        "                            <li>￥"+prolists.price+"</li>\n" +
                        "                            <li>"+prolists.stock+"</li>\n" +
                        "                            <li>"+prolists.bytime+"</li>\n" +
                        "                            <li>\n" +
                            "                            <a href='${pageContext.request.contextPath}/adminproduct/proalter?pid="+prolists.pid+"' class='btn btn-default'>修改</a>\n" +
                        "                                <button type='button' class='btn btn-warning' onclick='delProduct("+prolists.pid+")'>删除</button>\n" +
                        "                            </li>\n" +
                        "                        </ul>";
                }
                setTimeout(function () {
                    $(".loading").css("display", "none");
                    $(".user-list").append(html);
                }, 100);

                /*$(".allpage").text(date.page_info.totalPage);
                $(".thispage").text(date.page_info.currentPage);

                if (date.page_info.hasPrePage) {  //是否有上一页
                    $(".hasper").css("display", "inline-block");
                    $(".noper").css("display", "none");
                } else {
                    $(".hasper").css("display", "none");
                    $(".noper").css("display", "inline-block");
                }
                if (date.page_info.hasNextPage) {  //是否有下一页
                    $(".hasnext").css("display", "inline-block");
                    $(".nonext").css("display", "none");
                } else {
                    $(".hasnext").css("display", "none");
                    $(".nonext").css("display", "inline-block");
                }*/
            }
        });
    });

    function delProduct(id) {
        if(confirm("你确定要删除这件商品吗？")){
            $.post(
                "${pageContext.request.contextPath}/adminproduct/delProduct",
                {pid:id},
                function (date) {
                    if(date.delPro_res>0){
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
