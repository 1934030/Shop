
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线商城</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <style>
        html {
            width: 100%;
            height: 100%;
        }

        body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            color: white;
            background: url("${pageContext.request.contextPath }/images/admin-banner.jpg") no-repeat;
            background-size: cover;
        }

        input:-webkit-autofill{
            -webkit-text-fill-color: #fff !important;
            transition: background-color 5000s ease-in-out 0s;
        }

        @keyframes myopacity {
            from {
                opacity: 0;
                transform: translate(-50%, -50%) scale(0);
            }
            to {
                opacity: 1;
                transform: translate(-50%, -50%) scale(1);
            }
        }

        .login {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 26%;
            animation: myopacity 1s;
            transform: translate(-50%, -50%) scale(1);
            background: linear-gradient(230deg, rgba(53, 57, 74, 0) 0%, rgb(0, 0, 0) 100%);
            box-shadow: -20px 20px 20px rgba(0, 0, 0, 0.55);
            padding: 30px 30px 10px 30px;
            box-sizing: border-box;
            border-radius: 8px;
        }

        .form-group span, .form-group input {
            border: none;
            background-color: transparent;
            margin-top: 20px;
        }

        .form-group input:focus {
            box-shadow: none;
            color: #4FA1D9;
        }

        .login .login-btn input {
            transition: .75s;
            background-color: transparent;
            color: #4FA1D9;
            width: 40%;
            border: 2px solid #4FA1D9;
            border-radius: 30px;

        }

        .login .login-btn input:focus {
            outline: none;
        }

        .login .login-btn input:hover {
            background-color: #4FA1D9;
            color: white;

        }

        .body-opa {
            background: linear-gradient(45deg, #241663 70%, #FC5C7D 100%);
            opacity: 0.5;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: -1;
        }

        /*认证中*/
        .authent {
            box-shadow: 0 20px 30px 3px rgba(0, 0, 0, 0.55);
            display: none;
            background: #35394a;
            background: linear-gradient(230deg, rgba(53, 57, 74, 0) 0%, rgb(0, 0, 0) 100%);
            position: absolute;
            width: 30%;
            height: 300px;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            margin: auto;
            color: white;
            letter-spacing: 1px;
            padding: 20px 70px;
            opacity: 1;
            border-radius: 8px;
        }

        .authent p {
            font-size: 30px;
            text-align: center;
            color: white;
        }

        .ball-clip-rotate-multiple {
            position: relative;
        }

        .ball-clip-rotate-multiple > div {
            animation-fill-mode: both;
            position: absolute;
            left: 0;
            top: 0;
            border: 2px solid #fff;
            border-bottom-color: transparent;
            border-top-color: transparent;
            border-radius: 50%;
            height: 35px;
            width: 35px;
            animation: rotate 1s 0s ease-in-out infinite;
        }

        .ball-clip-rotate-multiple > div:last-child {
            display: inline-block;
            top: 10px;
            left: 10px;
            width: 15px;
            height: 15px;
            animation-duration: 0.5s;
            border-color: #fff transparent #fff transparent;
            animation-direction: reverse;
        }

        @keyframes rotate {
            0% {
                transform: rotate(0deg) scale(1);
            }

            50% {
                transform: rotate(180deg) scale(0.6);
            }

            100% {
                transform: rotate(360deg) scale(1);
            }
        }

        .body-opa-text {
            position: fixed;
            right: -120px;
            top: 155px;
            width: 550px;
            padding: 20px 0;
            margin: 0;
            background-color: rgba(0, 0, 0, .5);
            color: #c0c0c0;
            transform: translateY(-50%) rotate(45deg);
            letter-spacing: 6px;
            box-shadow: 0 0 30px 3px rgba(0, 0, 0, 0.55);
        }

        .body-opa-text p {
            margin: 0;
        }

        .loader-inner {
            top: 0;
        }

        .get_code {
            position: relative;
            cursor: pointer;
            color: #fff;
            letter-spacing: 2px;
        }
        .get_code:before{
            position: absolute;
            top: -6px;
            left: 50%;
            transform: translateX(-50%);
            content: "点击更换";
            font-size: 14px;
            letter-spacing: 1px;
            color: #c0c0c0;
        }

        .login_title {
            color: #c7cbea;
            margin: 80px 0 50px 0;
            text-shadow: 0 0 4px #c0b0e0;
        }

        .banner-text {
            position: absolute;
            right: 10%;
            top: 60%;
        }

        .banner-text p:nth-of-type(1), .banner-text p:nth-of-type(3) {
            color: #c0c0c0;
            font-size: 20px;
        }

        .banner-text p:nth-of-type(2) {
            font-size: 50px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<!--遮罩层-->
<div class="body-opa">
    <div class="banner-text">
        <p class="text-left">@ MORTAL</p>
        <p class="text-center">折叠不可能</p>
        <p class="text-right">2021 折叠下一个十年</p>
    </div>
</div>
<h4 class="body-opa-text text-center">
    <p style="padding-bottom: 10px">欢迎回来</p>
    <p>管理员登录平台</p>
</h4>



<div class='login'>
    <div class="loader-inner ball-clip-rotate-multiple">
        <div></div>
        <div></div>
        <div></div>
    </div>
    <div class='login_title'>
        <h3><strong>管理员登录</strong></h3>
    </div>
    <form role="form" action="${pageContext.request.contextPath }/admin/login" method="post" onsubmit="return login_sub()">
        <div class='login_fields'>
            <div class="form-group">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"><img alt="" src="${pageContext.request.contextPath }/images/cd-icon-username.svg"></span>
                    <input type="text" name="adminid" id="loginid" class="form-control" placeholder="请输入账户"
                           autocomplete="off"
                           style="margin-top:0;">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"><img alt="" src="${pageContext.request.contextPath }/images/cd-icon-password.svg"></span>
                    <input type="password" id="loginpswd" name="password" class="form-control" placeholder="请输入密码"
                           style="margin-top:0;">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"><img alt="" src="${pageContext.request.contextPath }/images/cd-icon-password.svg"></span>
                    <input type="text" id="ver_code" class="form-control" placeholder="验证码"
                           style="margin-top:0;">
                    <span class="input-group-addon get_code" title="点击更换">--</span>
                </div>
            </div>
            <div class="login-btn">
                <input id="login" class="btn btn-default btn-lg btn-block" type='button' value='登 录'
                       style="margin-top:30px;">
            </div>
        </div>
        <div style="margin-top: 20%">
            <p>进入<a href="index.jsp"
                    style="font-size: 18px"><i>前台</i></a>，请点击！</p>
            <p>欢迎进入管理员接入平台</p>
        </div>
    </form>
</div>

<div class='authent'>
    <div class="loader" style="height: 60px;width: 60px;margin-left: 28px;margin-top: 40px">
        <div class="loader-inner ball-clip-rotate-multiple">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <p class="text-center point">认证中...</p>
</div>

<script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath }/js/form.js"></script>
<script src="${pageContext.request.contextPath }/js/publicjs.js"></script>
<script>
    $(function () {
        var loginid = $("#loginid");
        var loginpswd = $("#loginpswd");
        function login_sub() {
            if (loginid.value == 0 || loginpswd.value.length == 0) {
                alert("用户名和密码不能为空！");
                return false;
            }
            return true;
        }

        $(".get_code").html(createCode());
        $(".get_code").click(function () {
            $(".get_code").html(createCode());
        });

        $("#login").click(function () {
            if (loginid.value != 0 && loginpswd.length != 0) {
                if($("#ver_code").val()!=0 && $("#ver_code").val()!=null){
                    $(".login").fadeOut(500);   //淡出
                    $(".authent").fadeIn(1000,function () {
                        //验证验证码.toLowerCase()转换小写
                        if($("#ver_code").val().toLowerCase() == $(".get_code").html().toLowerCase()){
                            $("form").ajaxSubmit(function (date) {
                                if(date["my_res"]>0){
                                    $(".point").html("认证成功，登录中...");
                                    setTimeout(function () {
                                        window.location="${pageContext.request.contextPath }/admin/topage?page=index";
                                    },1000);
                                }else{
                                    $(".point").html("认证失败！");
                                    $(".point").css("color","red");
                                    setTimeout(function () {
                                        window.location.reload();
                                    },2000);
                                }
                            });
                        }else{
                            $(".point").html("认证失败,验证码错误");
                            $(".point").css("color","red");
                            setTimeout(function () {
                                window.location.reload();
                            },2000);
                        }
                    }); //淡入
                }else{
                    alert("请输入验证码！");
                }
            } else {
                alert("用户名和密码不能为空！");
            }
        });
    })
</script>
</body>
</html>
