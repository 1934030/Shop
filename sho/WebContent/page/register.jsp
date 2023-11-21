<%--
  Created by IntelliJ IDEA.
  User: MR·Wang
  Date: 2019/11/18
  Time: 下午 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>在线商城-欢迎注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/logincss.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/form.js"></script><!--此文件要放在jquery下方-->
    <style>
        html {
            width: 100%;
            height: 100%;
        }

        body {
            width: 100%;
            height: 100%;
        }

        input:-webkit-autofill {
            -webkit-text-fill-color: #000 !important;
            transition: background-color 5000s ease-in-out 0s;
        }
    </style>
</head>
<body>
<div class="container-fluid height-fluid">
    <div class="row height-fluid">
        <!-- col-xs-* col-sm-* col-md-* col-lg-* 依次为超小设备<765、手机、平板、电脑 -->
        <div class="col-sm-12 hidden-md visible-xs-block visible-sm-block visible-md-block bg-color title-style">
            <img src="../images/logo.png" class="logo-style">
            <img src="../images/user_bg_m.png" class="uper">
        </div>
        <div class="col-md-8">
            <div class="row">
                <div class="col-sm-8 col-md-8 col-sm-offset-2 col-md-offset-2 login-main">
                    <div class="hidden-xs hidden-sm visible-md-block visible-lg-block">
                        <img src="../images/logo.png" width="150" height="35"/>
                    </div>
                    <div class="login-text">
                        Welcome to register !<br/> 欢迎注册账号 !
                    </div>
                    <form class="form-horizontal" role="form"
                          action="${pageContext.request.contextPath }/login/register">
                        <div class="form-group">
                            <div class="col-sm-12 col-md-8">
                                <div class="error-text"></div>
                                <input type="text" class="form-control" name="uname" placeholder="请输入用户名">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 col-md-8">
                                <input type="password" class="form-control pswd" name="password" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 col-md-8">
                                <input type="password" class="form-control pswd2" placeholder="请确认密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 col-md-6">
                                <button type="button" class="btn btn-primary btn-lg login-btn">注 册</button>
                            </div>
                        </div>
                    </form>
                    <div style="font-size: 12px">
                        <p>已有账号，请点击 <a href="login.html">立即登录&gt;</a></p>
                        <p style="margin: 0">用户名为用户昵称，账号由系统生成，请用账号登录</p>
                    </div>

                </div>
            </div>
        </div>

        <div class="hidden-sm visible-md-block visible-lg-block col-md-4 height-fluid bg-color">
            <div class="bg-img">
                <img src="../images/uper.png" class="uper2">
                <div class="text-center text-slogan">
                    <p>DREAM</p>
                    <p>Hope is not extinguished,</p>
                    <p>Dream is the future.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="text-center footer col-xs-12 col-sm-12 col-md-8">
        <p>
            <a href="service.jsp">隐私政策</a><i>|</i> <a href="aboutus.jsp">关于我们</a><i>|</i> <a
                href="/product/showpro">商品选购</a><i>|</i> <a href="javascript:alert('欢迎致电：15896554878');">反馈渠道</a>
        </p>
        <p>版权所有金陵科技学院</p>
    </div>
</div>

<script>
    $(function () {
        $(".login-btn").click(function () {
            if ($(".pswd").val() != $(".pswd2").val()) {
                $(".error-text").text("密码不一致");
                $(".error-text").css("color", "red");
            } else {
                $("form").ajaxSubmit({
                    success: function (date) {
                        if (date.add_res > 0) {
                            $(".error-text").text("注册成功，您的账号是" + date.add_userres.uid);
                            $(".error-text").css("color", "green");
                        } else {
                            $(".error-text").text("注册失败，换一个用户名试试！");
                            $(".error-text").css("color", "red");
                        }
                    },
                    error: function (err) {
                        alert("错误：" + err.status + " 系统异常！");
                    }
                });
            }
        });
    })
</script>
</body>
</html>
