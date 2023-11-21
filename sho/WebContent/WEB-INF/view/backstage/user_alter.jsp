
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <h3 class="titleinfo" style="position: relative; margin-bottom: 20px"><span>用户管理&gt;修改用户</span>
                        </h3>
                        <div class="container-fluid" style="padding: 0">
                            <c:if test="${adm_userinfo!=null}" var="yn_user">
                                <div class="row">
                                    <c:if test="${adm_userinfo.status!=0 }" var="status">
                                        <div class="col-lg-12" style="padding: 20px 10px">
                                            <a href="${pageContext.request.contextPath }/admin/topage?page=user_manage"
                                               type="button" class="btn btn-primary">返回管理</a>
                                            <button type="button" class="btn btn-warning">强制退出</button>
                                        </div>
                                        <p style="padding: 20px">当前用户状态：【在线】</p>
                                    </c:if>
                                    <c:if test="${not status }">
                                        <div class="col-lg-12" style="padding: 20px 10px">
                                            <a href="${pageContext.request.contextPath }/admin/topage?page=user_manage"
                                               type="button" class="btn btn-primary">返回管理</a>
                                        </div>
                                        <p style="padding: 20px">当前用户状态：【离线】</p>
                                    </c:if>
                                    <div class="col-lg-12 user-list">
                                        <form class="form-admupuser" role="form" method="post"
                                              action="${pageContext.request.contextPath}/adminuser/admupuser"
                                              enctype="multipart/form-data">
                                            <ul style="padding-left: 0">
                                                <li>
                                                    <div class="form-group">
                                                        <span class="col-sm-2 change-name">头像</span>
                                                        <div class="col-sm-10 text-left">
                                                            <img alt="头像" class="img-circle"
                                                                 src="${pageContext.servletContext.contextPath}/statics/uploadfiles/${adm_userinfo.headimg}"
                                                                 width="100px"
                                                                 height="100px">
                                                            <!--隐藏域-->
                                                            <input type="text" value="${adm_userinfo.uid}" name="uid"
                                                                   hidden title="">
                                                            <p style="padding: 20px">当前用户头像</p>
                                                            <p class="text-danger error-head"></p>
                                                            <button type="button" class="btn btn-default upfile2">上传头像
                                                            </button>
                                                            <span class="help-block" style="display: inline-block"> * 支持jpg,png,gif,bmp格式,最大不超过900KB</span>
                                                            <input type="file" id="inputfile2" name="file"
                                                                   style="display: none">
                                                            <p class="help-block">图片预览</p>
                                                            <div class="showdeadimg">
                                                                <div class="img-last">
                                                                    <img alt="预览图" src="" width="100%" height="100%"
                                                                         hidden>
                                                                </div>
                                                                <div class="img-bgcolor"></div>
                                                                <div class="img-cut">
                                                                    <img alt="预览图" src="" width="100%" height="100%"
                                                                         hidden>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group">
                                                        <span class="col-sm-2 change-name">用户ID</span>
                                                        <div class="col-sm-6">
                                                    <span class="form-control text-left"
                                                          title="不允许修改">${adm_userinfo.uid }</span>
                                                        </div>
                                                        <span class="col-sm-4 text-left text-danger">禁止修改项</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group">
                                                        <label for="firstname" class="col-sm-2 control-label">昵称</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="firstname"
                                                                   name="uname"
                                                                   placeholder="${adm_userinfo.uname }">
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group">
                                                        <label for="oldpswd" class="col-sm-2 control-label">密码</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="oldpswd"
                                                                   name="password"
                                                                   placeholder="${adm_userinfo.password }">
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group">
                                                        <label for="phone" class="col-sm-2 control-label">真实姓名</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="myname"
                                                                   name="myname"
                                                                   placeholder="${adm_userinfo.myname }">
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">性别</label>
                                                        <div class="col-sm-10 text-left">
                                                            <label class="radio-inline">
                                                                <input type="radio" name="sex"
                                                                       value="male" ${adm_userinfo.sex=="male" ? 'checked':''}>男生
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" name="sex"
                                                                       value="female" ${adm_userinfo.sex=="female" ? 'checked':''}>女生
                                                            </label>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <fmt:parseDate value="${adm_userinfo.birthday}" var="parsedEmpDate"
                                                                   pattern="yyyy年MM月dd日"/>
                                                    <fmt:formatDate pattern="yyyy" value="${parsedEmpDate}"
                                                                    var="year"/>
                                                    <fmt:formatDate pattern="MM" value="${parsedEmpDate}"
                                                                    var="month"/>
                                                    <fmt:formatDate pattern="dd" value="${parsedEmpDate}"
                                                                    var="day"/>
                                                    <div class="form-group">
                                                        <span class="col-sm-2 control-label">出生年月</span>
                                                        <div class="col-sm-10 text-left">
                                                            <label>
                                                                <select class="sel_year form-control" rel="${year }"
                                                                ></select>
                                                            </label> 年
                                                            <label>
                                                                <select class="sel_month form-control" rel="${month }"
                                                                ></select>
                                                            </label> 月
                                                            <label>
                                                                <select class="sel_day form-control" rel="${day }"
                                                                ></select>
                                                            </label> 日
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group">
                                                        <label for="phone" class="col-sm-2 control-label">用户积分</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="vip" name="vip"
                                                                   placeholder="${adm_userinfo.vip }">
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group">
                                                        <label for="phone" class="col-sm-2 control-label">手机号</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="phone"
                                                                   name="phone"
                                                                   placeholder="${adm_userinfo.phone }">
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group">
                                                        <label for="phone" class="col-sm-2 control-label">身份证号</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="idnum"
                                                                   name="idnum"
                                                                   placeholder="${adm_userinfo.idnum }">
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group">
                                                        <label for="phone" class="col-sm-2 control-label">邮箱</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="email"
                                                                   name="email"
                                                                   placeholder="${adm_userinfo.email }">
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"
                                                               for="textroad">地址街道</label>
                                                        <div class="col-sm-10">
                                                    <textarea id="textroad" name="address" class="form-control" rows="3"
                                                              placeholder="${adm_userinfo.address }"></textarea>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"
                                                               for="textarea">个性签名</label>
                                                        <div class="col-sm-10">
                                                    <textarea id="textarea" name="signature" class="form-control"
                                                              rows="3"
                                                              placeholder="${adm_userinfo.signature }"></textarea>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group">
                                                        <label for="phone" class="col-sm-2 control-label">注册时间</label>
                                                        <div class="col-sm-6">
                                                    <span class="form-control text-left"
                                                          title="不允许修改">${adm_userinfo.bytime }</span>
                                                        </div>
                                                        <span class="col-sm-4 text-left text-danger">禁止修改项</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group">
                                                        <label for="phone" class="col-sm-2 control-label">最后登录</label>
                                                        <div class="col-sm-6">
                                                    <span class="form-control text-left"
                                                          title="不允许修改">${adm_userinfo.lasttime }</span>
                                                        </div>
                                                        <span class="col-sm-4 text-left text-danger">禁止修改项</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="form-group" style="width: 130px; margin-bottom: 0">
                                                        <button type="button"
                                                                class="btn btn-warning btn-block sava-user">保 存
                                                        </button>
                                                    </div>
                                                </li>
                                            </ul>
                                        </form>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${not yn_user}">
                                <div class="alert alert-info text-center none_info">
                                    <img src="${pageContext.request.contextPath }/images/robote.png" width="150px">
                                    <span> 用户不存在或尚未选择。</span>
                                </div>
                            </c:if>
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
                    $(".showdeadimg img").css("display", "block");
                    $(".showdeadimg img").attr("src", objUrl); //将图片路径存入src中，显示出图片
                }
            });
        });

        $.ms_DatePicker({
            YearSelector: ".sel_year",
            MonthSelector: ".sel_month",
            DaySelector: ".sel_day"
        });

        $(".sava-user").click(function () {
            $(".form-admupuser").ajaxSubmit({
                success: function (date) {
                    if (date.adm_upres > 0) {
                        alert("修改成功！");
                        window.location.reload();
                    } else {
                        alert("修改失败 " + date.upError);
                        $(".error-head").text(date.upError);
                    }
                }, error: function (er) {
                    alert("错误：" + er.status + "，修改异常！");
                }
            });
        });
    })
</script>
</body>
</html>
