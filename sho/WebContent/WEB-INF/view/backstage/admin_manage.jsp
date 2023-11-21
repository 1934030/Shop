
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线官网-用户中心</title>
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
            width: 26%;
            padding: 10px 0;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            vertical-align: middle;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        .user-list ul li:nth-of-type(2), .user-list ul li:nth-of-type(3) {
            text-align: left;
        }

        .user-list ul li:nth-of-type(1),
        .user-list ul li:nth-of-type(4),
        .user-list ul li:nth-of-type(5) {
            width: 15%;
        }

        .user-list ul:hover {
            background-color: #f0f0f0;
            transition: .5s;
        }

        .main-list li a {
            display: inline-block;
            color: #0f0f0f;
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
                        <h3 class="titleinfo" style="position: relative; margin-bottom: 20px"><span>管理员列表</span></h3>
                        <div class="container-fluid" style="padding: 0">
                            <div class="row">
                                <div class="col-lg-12" style="padding: 20px 10px">
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                            data-target="#myModal">添加管理
                                    </button>
                                </div>
                                <div class="col-lg-12 user-list">
                                    <h3>基础信息</h3>
                                    <ul class="list-inline" style="margin: 0">
                                        <li><a href="#">账号</a></li>
                                        <li><a href="#">用户名</a></li>
                                        <li><a href="#">密码</a></li>
                                        <li><a href="#">权限等级</a></li>
                                        <li><a href="#">管理</a></li>
                                    </ul>
                                    <div class="loading text-center">
                                        <span style="font-size: 18px">数据加载中 </span>
                                        <img src="${pageContext.request.contextPath}/images/timg.gif" width="30px">
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

<!-- 添加管理员 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="${pageContext.request.contextPath}/admin/addAdmin">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">添加管理员</h4>
                </div>
                <div class="modal-body">
                    <ul class="add-class">
                        <li>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">账号</label>
                                <div class="col-sm-6">
                                    <span class="form-control text-left">由系统生成</span>
                                </div>
                                <span class="col-sm-4 text-left text-danger">禁止输入项</span>
                            </div>
                        </li>
                        <li>
                            <label for="aname2" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="aname2" name="aname" placeholder="请输入用户名">
                            </div>
                        </li>
                        <li>
                            <label for="password2" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="password2" name="password"
                                       placeholder="请输入密码">
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">确认添加</button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>

<!-- 修改管理员 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form class="alterForm" action="${pageContext.request.contextPath}/admin/alterAdmin">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel2">修改管理员</h4>
                </div>
                <div class="modal-body">
                    <ul class="add-class">
                        <li>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">账号</label>
                                <div class="col-sm-6">
                                    <input type="text" value="" class="adminid" name="adminid" hidden>
                                    <span class="form-control text-left adminid_span">1111</span>
                                </div>
                                <span class="col-sm-4 text-left text-danger">禁止修改项</span>
                            </div>
                        </li>
                        <li>
                            <label for="aname" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="aname" name="aname" placeholder="请输入用户名">
                            </div>
                        </li>
                        <li>
                            <label for="password" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="password" name="password"
                                       placeholder="请输入密码">
                            </div>
                        </li>
                        <li>
                            <label for="grade" class="col-sm-2 control-label">管理权限</label>
                            <div class="col-sm-6">
                                <label for="grade" class="pull-left">
                                    <select class="form-control" id="grade" name="grade">
                                        <option value="0">普通账号</option>
                                        <option value="1" hidden>总管理员</option>
                                        <option value="2">管理员</option>
                                    </select>
                                </label>
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
                var objUrl = getObjectURL(this.files[0]); //调用函数传参，获取图片的路径，该路径不是图片在本地的路径
                if (objUrl) {
                    $(".showdeadimg img").css("display", "block");
                    $(".showdeadimg img").attr("src", objUrl); //将图片路径存入src中，显示出图片
                }
            });
        });

        /*加载数据*/
        $.ajax({
            url: "${pageContext.request.contextPath }/admin/getadminlist",
            success: function (date) {
                var html = "";
                for (var i = 0; i < date.adm_list.length; i++) {
                    var obj = date.adm_list[i];
                    html += getHtml(obj);
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
            var $grad = "暂无数据";
            if (obj.grade == 1) {
                $grad = "总管理员";
            } else if (obj.grade == 0) {
                $grad = "普通账号";
            } else {
                $grad = "管理员";
            }
            var $html = "<ul class='list-inline main-list'><li>"
                + obj.adminid + "</li>\n<li>"
                + "<img src='${pageContext.servletContext.contextPath}/statics/uploadfiles/" + obj.aimg + "' class='img-circle' alt='' width='50' height='50'><span title='用户名'> "
                + obj.aname + "</span></li>\n<li>"
                + obj.password + "</li>\n<li>"
                + $grad + "<input type='hidden' id='grade_code' value="+obj.grade+"></li>\n<li>"
                + "<a href=\"javascript:;\" class=\"btn btn-default alert_info\" data-toggle=\"modal\" data-target=\"#myModal2\">修改</a>\n" +
                "<a href='${pageContext.request.contextPath}/admin/deleteAdmin?adminid=" + obj.adminid + "' class='btn btn-warning' onclick='return confirm(\"你确定要删除这个账号吗？\")'>删除</a></li></ul>";
            return $html;
        }

        $(".user-list").on("click", ".alert_info", function () {
            var adminid = $(this).parents("li").siblings().eq(0).html();
            var aname = $(this).parents("li").siblings().eq(1).find("span").html();
            var password = $(this).parents("li").siblings().eq(2).html();
            var grade_code = $(this).parents("li").siblings().eq(3).find("#grade_code").val();
            $(".adminid").val(adminid);
            $(".adminid_span").text(adminid);
            $("#aname").attr("value", aname);
            $("#password").attr("value", password);
            if(grade_code==1){
                $("[name='grade']").prop("disabled",true);
                $("[name='grade'] option").eq(1).prop("hidden",false);
                $("[name='grade']").val(1);
                return;
            }
            $("[name='grade']").prop("disabled",false);
            $("[name='grade'] option").eq(1).prop("hidden",true);
            $("[name='grade']").val(grade_code);
        });
    });

    function subAlter() {
        $(".alterForm").ajaxSubmit({
            success: function (date) {
                if (date.adm_alter > 0) {
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
