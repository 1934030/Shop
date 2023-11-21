<%--
  Created by IntelliJ IDEA.
  User: MR·Wang
  Date: 2019/10/14
  Time: 下午 12:36
  To change this template use File | Settings | File Templates.
--%>
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

        .user-list ul {
            padding: 0;
            margin: 0;
        }

        .user-list ul li {
            width: 34%;
            padding: 10px 0;
            font-size: 16px;
            font-weight: bold;
            vertical-align: middle;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        .user-list ul:hover {
            background-color: #f0f0f0;
            transition: .5s;
        }

        .user-list ul li:nth-of-type(1), .user-list ul li:last-child {
            width: 15%;
        }

        .user-list ul li:nth-of-type(1) {
            position: relative;
        }

        .user-list ul li:after {
            content: ' ';
            display: block;
            clear: both;
        }

        .add-class {
            padding: 0;
        }

        .add-class li {
            padding: 10px 0;
            text-align: right;
        }

        .add-class:after {
            content: ' ';
            display: table;
            clear: both;
        }

        .add-class li:after {
            content: ' ';
            display: block;
            clear: both;
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

        .classid_span {
            user-select: none; /*禁止选择*/
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
                        <h3 class="titleinfo" style="position: relative; margin-bottom: 20px"><span>商品管理&gt;商品分类</span>
                        </h3>
                        <div class="container-fluid" style="padding: 0">
                            <div class="row">
                                <div class="col-lg-12" style="padding: 20px 10px">
                                    <a href="${pageContext.request.contextPath }/admin/topage?page=pro_manage"
                                       class="btn btn-primary">返回管理</a>
                                    <button type="button" class="btn btn-warning" data-toggle="modal"
                                            data-target="#myModal">添加分类
                                    </button>
                                    <!-- 添加分类模态框 -->
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                         aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <form action="${pageContext.request.contextPath}/sort/addSort">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-hidden="true">&times;
                                                        </button>
                                                        <h4 class="modal-title" id="myModalLabel">添加分类信息</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <ul class="add-class">
                                                            <li>
                                                                <div class="form-group">
                                                                    <label class="col-sm-2 control-label">类别编号</label>
                                                                    <div class="col-sm-6">
                                                                        <span class="form-control text-left">由系统生成</span>
                                                                    </div>
                                                                    <span class="col-sm-4 text-left text-danger">禁止输入项</span>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <label for="cname1"
                                                                       class="col-sm-2 control-label">类别名称</label>
                                                                <div class="col-sm-6">
                                                                    <input type="text" class="form-control"
                                                                           id="cname1" name="cname"
                                                                           placeholder="请输入分类名称">
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <label for="descb"
                                                                       class="col-sm-2 control-label">备注</label>
                                                                <div class="col-sm-6">
                                                                <textarea id="descb" class="form-control" rows="5"
                                                                          name="descb"
                                                                          placeholder="请输入备注信息"></textarea>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default"
                                                                data-dismiss="modal">关闭
                                                        </button>
                                                        <button type="submit" class="btn btn-primary">确认添加</button>
                                                    </div>
                                                </div><!-- /.modal-content -->
                                            </form>
                                        </div><!-- /.modal -->
                                    </div>
                                </div>
                                <div class="col-lg-12 user-list">
                                    <ul class="list-inline">
                                        <li class="text-center"><a href="#">类别编号</a></li>
                                        <li><a href="#">分类名称</a></li>
                                        <li><a href="#">备注</a></li>
                                        <li class="text-center"><a href="#">管理</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 修改分类模态框 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form class="alterForm" action="${pageContext.request.contextPath}/sort/alterSort">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel2">修改分类信息</h4>
                </div>
                <div class="modal-body">
                    <ul class="add-class">
                        <li>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">类别编号</label>
                                <div class="col-sm-6">
                                    <%--隐藏域--%>
                                    <input type="text" value="" class="classid" name="classid" hidden>
                                    <span class="form-control text-left classid_span">10001</span>
                                </div>
                                <span class="col-sm-4 text-left text-danger">禁止修改项</span>
                            </div>
                        </li>
                        <li>
                            <label for="cname" class="col-sm-2 control-label">类别名称</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control cname" id="cname" name="cname"
                                       placeholder="NAME">
                            </div>
                        </li>
                        <li>
                            <label for="descb2" class="col-sm-2 control-label">备注</label>
                            <div class="col-sm-6">
                                <textarea id="descb2" class="form-control" name="descb" rows="5"
                                          placeholder="请输入备注信息"></textarea>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="subAlter()">确认修改</button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
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

        $.ajax({
            url: "${pageContext.request.contextPath }/sort/getSort",
            success: function (date) {
                var html = "";
                for (var i = 0; i < date.sort_list.length; i++) {
                    var obj = date.sort_list[i];
                    html += getHtml(obj);
                }
                $(".user-list").append(html);
            }
        });

        function getHtml(obj) {
            var $descb = "无备注";
            if (obj.descb != null && obj.descb != "") {
                $descb = obj.descb;
            }
            var $html = "<ul class=\"list-inline main-list\">\n" +
                "                                        <li class=\"text-center\">" + obj.classid + "</li>\n" +
                "                                        <li>" + obj.cname + "</li>\n" +
                "                                        <li>" + $descb + "</li>\n" +
                "                                        <li class=\"text-center\">\n" +
                "                                            <a href=\"javascript:;\" class=\"btn btn-default alert_info\" data-toggle=\"modal\" data-target=\"#myModal2\">修改</a>\n" +
                "                                            <a href=\"${pageContext.request.contextPath}/sort/deleteSort?classid=" + obj.classid + "\" class=\"btn btn-warning delsort\" onclick=\"return confirm('确定要删除吗？')\">删除</a>\n" +
                "                                        </li>\n" +
                "                                    </ul>";
            return $html;
        }

        /* 由于元素是使用 append 方法追加的，因此内部元素无法进行事件访问，所以用到事件委派 */
        $(".user-list").on("click", ".alert_info", function () {
            var classid = $(this).parents("li").siblings().eq(0).html();
            var cname = $(this).parents("li").siblings().eq(1).html();
            var descb = $(this).parents("li").siblings().eq(2).html();
            $(".classid").val(classid);
            $(".classid_span").text(classid);
            $("#cname").attr("placeholder", cname);
            $("#descb2").attr("placeholder", descb);
        });
    });

    function subAlter() {
        $(".alterForm").ajaxSubmit({
            success:function (date) {
                if(date.sort_alter>0){
                    alert("修改成功！");
                    window.location.reload();
                    return;
                }
                alert("修改失败！");
            }
        })
    }
</script>
</body>
</html>
