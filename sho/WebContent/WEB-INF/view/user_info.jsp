<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>在线商城官网-用户中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/upubliccss.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/form.js"></script>
    <!--此文件要放在jquery下方-->
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/publicjs.js"></script>
    <style type="text/css">
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
    </style>
</head>
<body>
<div class="wrap-all">
    <div class="alert alert-info position-alert">
        <a href="#" class="close" data-dismiss="alert">
            &times;
        </a>
        <strong>提示：</strong><span>保存成功！</span>
    </div>
</div>

<div class="header-page" style="height: 110px;">
    <%@ include file="/page/header.html" %>
</div>

<div class="container-fluid" style="margin-bottom: 80px; margin-top: 50px">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="row">
                <div class="col-md-2" style="background-color: #fff; padding-bottom: 50px">
                    <%@ include file="pub_left.jsp"%>
                </div>
                <div class="col-md-10">
                    <div
                            style="width: 100%; min-height: 1000px; background-color: #fff; padding: 50px 20px 50px 20px;">
                        <h3 class="titleinfo"
                            style="position: relative; margin-bottom: 20px">
                            <span>我的信息</span>
                        </h3>
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion"
                                           href="#collapseOne">个人资料</a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="center-block"
                                             style="width: 60%; padding-top: 50px">
                                            <form class="form-horizontal form-basic" role="form"
                                                  action="${pageContext.request.contextPath}/user/upuserinfo"
                                                  method="post">
                                                <div class="form-group">
                                                    <label for="newname" class="col-sm-2 control-label">昵称</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="newname"
                                                               name="uname"
                                                               placeholder="${myinfo.uname }" style="width: 240px"
                                                               autocomplete="off">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">性别</label>
                                                    <div class="col-sm-10">
                                                        <c:if test="${!empty myinfo.sex }" var="sex">
                                                            <label class="radio-inline">
                                                                <input type="radio" name="sex"
                                                                       value="male" ${myinfo.sex=="male" ? 'checked':''}>男生
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" name="sex"
                                                                       value="female" ${myinfo.sex=="female" ? 'checked':''}>女生
                                                            </label>
                                                        </c:if>
                                                        <c:if test="${not sex }">
                                                            <label class="radio-inline">
                                                                <input type="radio" name="male" value="male" checked> 男生
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" name="female" value="female"> 女生
                                                                <span> 您还没有选择您的性别哦，已为您默认</span>
                                                            </label>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">生日</label>
                                                    <div class="col-sm-10">
                                                        <fmt:parseDate value="${myinfo.birthday}" var="parsedEmpDate"
                                                                       pattern="yyyy年MM月dd日"/>
                                                        <fmt:formatDate pattern="yyyy" value="${parsedEmpDate}"
                                                                        var="year"/>
                                                        <fmt:formatDate pattern="MM" value="${parsedEmpDate}"
                                                                        var="month"/>
                                                        <fmt:formatDate pattern="dd" value="${parsedEmpDate}"
                                                                        var="day"/>

                                                        <label>
                                                            <select class="sel_year form-control"
                                                                    rel="${year }" name="biryear"></select>
                                                        </label> 年
                                                        <label>
                                                            <select class="sel_month form-control"
                                                                    rel="${month }" name="birmonth"></select>
                                                        </label> 月
                                                        <label> <select class="sel_day form-control"
                                                                        rel="${day }" name="birday">
                                                        </select>
                                                        </label> 日
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="textroad">地址街道</label>
                                                    <div class="col-sm-10">
                                                        <c:if test="${!empty myinfo.address }" var="address">
																<textarea id="textroad" class="form-control"
                                                                          name="address" rows="3"
                                                                          placeholder="${myinfo.address }"></textarea>
                                                        </c:if>
                                                        <c:if test="${not address }">
																<textarea id="textroad" class="form-control"
                                                                          name="address" rows="3"
                                                                          placeholder="您还没有设置地址，设置后将为您默认为收货地址哦！"></textarea>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="textarea">个性签名</label>
                                                    <div class="col-sm-10">
                                                        <c:if test="${!empty myinfo.signature }" var="signature">
																<textarea id="textarea" class="form-control"
                                                                          name="signature" rows="3"
                                                                          placeholder="${myinfo.signature }"></textarea>
                                                        </c:if>
                                                        <c:if test="${not signature }">
																<textarea id="textarea" class="form-control"
                                                                          name="signature" rows="3"
                                                                          placeholder="您还没有签名，快设置一个吧"></textarea>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="width: 130px">
                                                    <button type="button" class="btn btn-warning btn-block save-basic">保
                                                        存
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion"
                                           href="#collapseTwo">头像</a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <form class="form-headimg" action="${pageContext.request.contextPath}/user/upuserinfo" method="post" enctype="multipart/form-data">
                                        <div class="center-block"
                                             style="width: 60%; padding-top: 50px">
                                            <div class="form-group">
                                                <p class="text-danger error-head">error提示文本！</p>
                                                <button type="button" class="btn btn-default upfile">上传头像</button>
                                                <span class="help-block" style="display: inline-block"> * 支持 jpg，jpeg，png，pneg，gif 格式，最大不超过3M</span>
                                                <input type="file" id="inputfile" name="file" accept="image/*"
                                                       style="display: none">
                                                <p class="help-block">图片预览</p>
                                                <div class="showdeadimg">
                                                    <div class="img-last">
                                                        <img alt="预览图" src="" width="100%" height="100%"
                                                             style="display: none">
                                                    </div>
                                                    <div class="img-bgcolor"></div>
                                                    <div class="img-cut">
                                                        <img alt="预览图" src="" width="100%" height="100%"
                                                             style="display: none">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group" style="width: 130px">
                                                <button type="button" class="btn btn-warning btn-block sava-headimg">保 存</button>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion"
                                           href="#collapseThree">手机和邮箱</a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="center-block"
                                             style="width: 60%; padding-top: 50px">
                                            <form class="form-horizontal form-phone" role="form"
                                                  action="${pageContext.request.contextPath}/user/upuserinfo"
                                                  method="post">
                                                <div class="form-group">
                                                    <label for="phone" class="col-sm-2 control-label">手机号</label>
                                                    <div class="col-sm-10">
                                                        <c:if test="${!empty myinfo.phone }" var="phone">
                                                            <input type="text" class="form-control" id="phone"
                                                                   name="phone"
                                                                   placeholder="${myinfo.phone }" autocomplete="off">
                                                        </c:if>
                                                        <c:if test="${not phone }">
                                                            <input type="text" class="form-control" id="phone"
                                                                   name="phone"
                                                                   placeholder="请添加您的手机号" autocomplete="off">
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="email" class="col-sm-2 control-label">E-mail</label>
                                                    <div class="col-sm-10">
                                                        <c:if test="${!empty myinfo.email }" var="email">
                                                            <input type="email" class="form-control" id="email"
                                                                   name="email"
                                                                   placeholder="${myinfo.email }" autocomplete="off">
                                                        </c:if>
                                                        <c:if test="${not email }">
                                                            <input type="email" class="form-control" id="email"
                                                                   name="email"
                                                                   placeholder="请添加您的邮箱" autocomplete="off">
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="width: 130px">
                                                    <button type="button" class="btn btn-warning btn-block save-phone">保
                                                        存
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion"
                                           href="#collapseFour">密码修改</a>
                                    </h4>
                                </div>
                                <div id="collapseFour" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="center-block"
                                             style="width: 60%; padding-top: 50px">
                                            <form class="form-horizontal form-pswd" role="form"
                                                  action="${pageContext.request.contextPath}/user/upuserpswd"
                                                  method="post">
                                                <div class="form-group">
                                                    <label for="old_pswd" class="col-sm-2 control-label">旧密码</label>
                                                    <div class="col-sm-10">
                                                        <input type="password" class="form-control" id="old_pswd"
                                                               name="old_pswd"
                                                               placeholder="请输入原密码" autocomplete="off"
                                                               style="width: auto; display: inline-block">
                                                        <span class="error-pswd"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="new_pswd" class="col-sm-2 control-label">新密码</label>
                                                    <div class="col-sm-10">
                                                        <input type="password" class="form-control" id="new_pswd"
                                                               name="password"
                                                               placeholder="请输入新密码" autocomplete="off"
                                                               style="width: auto; display: inline-block">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="new_pswd2" class="col-sm-2 control-label">确认密码</label>
                                                    <div class="col-sm-10">
                                                        <input type="password" class="form-control" id="new_pswd2"
                                                               placeholder="请再次确认密码" autocomplete="off">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="width: 130px">
                                                    <button type="button" class="btn btn-warning btn-block save-pswd">保
                                                        存
                                                    </button>
                                                </div>
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
    </div>
</div>

<div class="footer-page">
    <%@ include file="/page/footer.html" %>
</div>

<script>
    $(function () {
        /*生日列表*/
        $.ms_DatePicker({
            YearSelector: ".sel_year",
            MonthSelector: ".sel_month",
            DaySelector: ".sel_day"
        });

        $(".position-alert a").click(function () {
            $(".wrap-all").css("display", "none");
        });

        /*ajax，对用户基本信息的修改请求*/
        $(".save-basic").click(function () {
            var biryear = $("[name='biryear']").val();
            var birmonth = $("[name='birmonth']").val();
            var birday = $("[name='birday']").val();
            var birthday = biryear + "年" + birmonth + "月" + birday + "日";
            if (biryear == 0 || birmonth == 0 || birday == 0) {
                $(".form-basic").ajaxSubmit({
                    success: function (date) {
                        if (date["mysavebasic"] > 0) {
                            $(".wrap-all").css("display", "block");
                            $(".position-alert a").click(function () {
                                window.location = "userinfo";
                            });
                        } else {
                            $(".position-alert span").html("保存失败！");
                            $(".wrap-all").css("display", "block");
                        }
                    }
                });
            } else {
                $(".form-basic").ajaxSubmit({
                    data: {birthday: birthday},
                    success: function (date) {
                        if (date["mysavebasic"] > 0) {
                            $(".wrap-all").css("display", "block");
                            $(".position-alert a").click(function () {
                                window.location = "userinfo";
                            });
                        } else {
                            $(".position-alert span").html("保存失败！");
                            $(".wrap-all").css("display", "block");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        console.log(XMLHttpRequest.status);
                        console.log(XMLHttpRequest.readyState);
                    }
                });
            }
        });

        /*头像更改*/
        $(".upfile").click(function () { //点击按钮触发文件上传
            $("#inputfile").click(); //相当于点击了文件上传
            $("#inputfile").on("change", function () {
                var objUrl = getObjectURL(this.files[0]); //调用函数传参，获取图片的路径，该路径不是图片在本地的路径
                if (objUrl) {
                    $(".showdeadimg img").css("display", "block");
                    $(".showdeadimg img").attr("src", objUrl); //将图片路径存入src中，显示出图片
                }
            });
            $("body").on("click",".sava-headimg",function () {
                $(".form-headimg").ajaxSubmit({
                    success:function (date) {
                        console.log(date.adm_upres);
                        if(date.adm_upres>0){
                            alert("修改成功！");
                            console.log(date.adm_upres);
                            window.location.reload();
                        }else {
                            console.log(date.adm_upres);
                            console.log(date.upError);
                            $(".error-head").text(date.upError);
                        }
                    }
                })
            })
        });


        /*对手机与邮箱信息的修改*/
        $(".save-phone").click(function () {
            $(".form-phone").ajaxSubmit({
                success: function (date) {
                    if (date["mysavebasic"] > 0) {
                        $(".wrap-all").css("display", "block");
                        $(".position-alert a").click(function () {
                            window.location = "userinfo";
                        });
                    } else {
                        $(".position-alert span").html("保存失败！");
                        $(".wrap-all").css("display", "block");
                    }
                }
            });
        });

        /*密码的修改，进行前端密码对比时注意安全性问题，应保证密码不会泄露*/
        $(".save-pswd").click(function () {
            if ($("#old_pswd").val() == "" ||
                $.trim($("#new_pswd").val()) == "" ||
                $.trim($("#new_pswd2").val()) == "") {
                alert("不允许为空！");
            } else if ($("#new_pswd").val() != $("#new_pswd2").val()) {
                alert("密码不一致");
            } else {
                $(".form-pswd").ajaxSubmit({
                    success: function (date) {
                        if (date["mysavepswd"] > 0) {
                            $(".error-pswd").html(date["ERROR_PSWD"]);
                            $(".error-pswd").css("color", "green");
                            $(".position-alert span").html("密码修改成功，请重新登录！");
                            $(".wrap-all").css("display", "block");
                            $(".position-alert a").click(function () {
                                window.location.reload();
                            });
                        } else {
                            $(".position-alert span").html("密码修改失败！");
                            $(".wrap-all").css("display", "block");
                            $(".error-pswd").html(date["ERROR_PSWD"]);
                            $(".error-pswd").css("color", "red");
                        }
                    },
                    error: function (lat) {
                        alert("error")
                    }
                });
            }
        });

        /*个人信息模块点击的平滑过渡*/
        $("a[href*=#collapse]").click(function () {
            var aname = $(this).attr("href");
            setTimeout(function () {
                var targetOffset = $("a[href=" + aname + "]").offset().top;
                $('html,body').animate({
                    scrollTop: targetOffset - 70
                }, 500);
            }, 300);

        })
    });
</script>
</body>
</html>