
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

        .user-list ul li {
            width: 70%;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
        }

        .user-list ul li .form-group {
            text-align: right;
        }

        .user-list ul li:nth-of-type(1) {
            position: relative;
        }

        .user-list ul li:after {
            content: ' ';
            display: block;
            clear: both;
        }

        .inline-select {
            display: inline-block;
            width: auto;
        }

        .change-name {

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
                        <h3 class="titleinfo" style="position: relative; margin-bottom: 20px"><span>商品管理&gt;添加商品</span>
                        </h3>
                        <div class="container-fluid" style="padding: 0">
                            <div class="row">
                                <div class="col-lg-12" style="padding: 20px 10px">
                                    <a href="${pageContext.request.contextPath }/admin/topage?page=pro_manage"
                                       class="btn btn-primary">返回管理</a>
                                </div>
                                <div class="col-lg-12 user-list">
                                    <form class="form-product" method="post"
                                          action="${pageContext.request.contextPath }/adminproduct/addProduct"
                                          enctype="multipart/form-data">
                                        <ul style="padding-left: 0">
                                            <li>
                                                <div class="form-group">
                                                    <span class="col-sm-2 change-name">展示图片</span>
                                                    <div class="col-sm-10 text-left">
                                                        <!--<img alt="图片" class="img-thumbnail" src="../images/q1.jpg"
                                                             width="100%">
                                                        <p style="padding: 20px">当前商品图</p>-->
                                                        <p class="text-danger up_error">error提示文本！</p>
                                                        <button type="button" class="btn btn-default upfile2">上传图片
                                                        </button>
                                                        <span class="help-block" style="display: inline-block"> * 支持jpg,png,gif,bmp格式,最大不超过3M</span>
                                                        <input type="file" id="inputfile2" style="display: none"
                                                               name="addfile">
                                                        <p class="help-block">图片预览</p>
                                                        <div class="showdeadimg2">
                                                            <img alt="预览图" src="" width="100%" height="100%"
                                                                 style="display: none">
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-group">
                                                    <span class="col-sm-2 change-name">商品编号</span>
                                                    <div class="col-sm-6">
                                                        <span class="form-control text-left">编号将由系统生成</span>
                                                    </div>
                                                    <span class="col-sm-4 text-left text-danger">禁止输入项</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-group">
                                                    <label for="pname" class="col-sm-2 control-label">* 商品名</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" class="form-control" id="pname" name="pname"
                                                               placeholder="请输入商品名">
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-group">
                                                    <label for="title" class="col-sm-2 control-label">标题</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" class="form-control" id="title"
                                                               placeholder="请输入标题" title="暂不使用" disabled>
                                                    </div>
                                                    <span class="col-sm-4 text-left text-danger">未使用项</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-group">
                                                    <label for="descb" class="col-sm-2 control-label">产品描述</label>
                                                    <div class="col-sm-10">
                                                    <textarea id="descb" class="form-control" rows="3" name="descb"
                                                              placeholder="请输入描述信息"></textarea>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">所属类别</label>
                                                    <div class="col-sm-6 text-left">
                                                        <select class="form-control inline-select sort_select"
                                                                name="classid">
                                                            <option value="0" class="op">分类选择---</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">* 价格</label>
                                                    <div class="col-sm-6 text-left">
                                                        <input type="text" class="form-control" id="price" name="price"
                                                               placeholder="请输入价格">
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-group">
                                                    <span class="col-sm-2 control-label">* 库存</span>
                                                    <div class="col-sm-6 text-left">
                                                        <input type="text" class="form-control" id="stock" name="stock"
                                                               placeholder="请输入库存">
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">上架时间</label>
                                                    <div class="col-sm-6">
                                                        <span class="form-control text-left">上架时间将由系统生成</span>
                                                    </div>
                                                    <span class="col-sm-4 text-left text-danger">禁止输入项</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-group" style="width: 130px; margin-bottom: 0">
                                                    <button type="button" class="btn btn-warning btn-block save_addpro">
                                                        保 存
                                                    </button>
                                                </div>
                                            </li>
                                        </ul>
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
                alert("头像发生变化！")
            });
        });

        $(".upfile2").click(function () {
            $("#inputfile2").click(); //相当于点击了文件上传
            $("#inputfile2").on("change", function () {
                var objUrl = getObjectURL(this.files[0]); //调用函数传参，获取图片的路径，该路径不是图片在本地的路径
                if (objUrl) {
                    $(".showdeadimg2 img").css("display", "block");
                    $(".showdeadimg2 img").attr("src", objUrl); //将图片路径存入src中，显示出图片
                }
            });
        });

        $.ms_DatePicker({
            YearSelector: ".sel_year",
            MonthSelector: ".sel_month",
            DaySelector: ".sel_day"
        });

        $.ajax({
            url: "${pageContext.request.contextPath }/sort/getSort",
            success: function (date) {
                var html = "";
                for (var i = 0; i < date.sort_list.length; i++) {
                    var obj = date.sort_list[i];
                    html += getHtml(obj);
                }
                $(".sort_select").append(html)
            }
        });

        function getHtml(obj) {
            var $html = "<option value=\"" + obj.classid + "\" class=\"op\">" + obj.cname + "</option>";
            return $html;
        }

        /*$("body").on("change",".sort_select:selected",function () {
                alert("已选中");
            })*/

        $(".save_addpro").click(function () {
            if ($(".sort_select option:selected").val() != 0 &&
                $("#pname").val() != 0 &&
                $("#price").val() != 0 &&
                $("#stock").val() != 0) {
                $(".form-product").ajaxSubmit({
                    success: function (date) {
                        if (date.resI > 0) {
                            alert("添加成功！");
                            window.location.reload();
                        } else {
                            alert("添加失败！");
                            if (date.upError != null) {
                                $(".up_error").html(date.upError);
                                alert("图片上传错误！");
                            }
                        }
                    }, error: function (er) {
                        alert("错误：" + er.status + "，添加异常！");
                    }
                });
            } else {
                alert("填写完整信息并为商品选择一个分类！");
            }
        });
    })
</script>
</body>
</html>
