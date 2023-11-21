
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线商城官网-后台中心</title>
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
                <div class="col-md-2" style="padding-right: 0">
                    <%@ include file="pub_leftpage.jsp" %>
                </div>
                <div class="col-md-10">
                    <div style="width: 100%; min-height: 1000px; background-color: #fff; padding: 50px 20px 50px 20px;">
                        <h3 class="titleinfo" style="position: relative; margin-bottom: 20px"><span>系统信息</span></h3>
                        <div class="container-fluid">
                            <!--面板1-->
                            <div class="row">
                                <div class="col-sm-6 col-md-3">
                                    <div class="thumbnail">
                                        <div class="system-date-wrapper">
                                            <div class="get-date">
                                                <span class="glyphicon glyphicon-usd" style="font-size: 40px"></span>
                                                <div>￥34000</div>
                                            </div>
                                        </div>
                                        <div class="caption tit-text">
                                            <h4 class="one">
                                                <span class="glyphicon glyphicon-usd"></span> 总营业额
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3">
                                    <div class="thumbnail">
                                        <div class="system-date-wrapper">
                                            <div class="get-date">
                                                <span class="glyphicon glyphicon-user" style="font-size: 40px"></span>
                                                <div>1301035</div>
                                            </div>
                                        </div>
                                        <div class="caption tit-text">
                                            <h4 class="two">
                                                <span class="glyphicon glyphicon-user"></span> 总注册量
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3">
                                    <div class="thumbnail">
                                        <div class="system-date-wrapper">
                                            <div class="get-date">
                                                <span class="glyphicon glyphicon-plus" style="font-size: 40px"></span>
                                                <div>12</div>
                                            </div>
                                        </div>
                                        <div class="caption tit-text">
                                            <h4 class="three">
                                                <span class="glyphicon glyphicon-plus"></span> 最新上架
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3">
                                    <div class="thumbnail">
                                        <div class="system-date-wrapper">
                                            <div class="get-date">
                                                <span class="glyphicon glyphicon-ok-sign"
                                                      style="font-size: 40px"></span>
                                                <div>7965434</div>
                                            </div>
                                        </div>
                                        <div class="caption tit-text">
                                            <h4 class="four">
                                                <span class="glyphicon glyphicon-ok-sign"></span> 总成交量
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--面板2-->
                            <div class="row">
                                <div class="col-md-6 wrapper-two">
                                    <div class="thumbnail" style="padding: 20px">
                                        <div class="system-date-left">
                                            <div class="body-opa"></div>
                                            <div class="top-time">
                                                <h3>
                                                    <span class="glyphicon glyphicon-stats"></span> 数据统计
                                                </h3>
                                                <div class="loading text-center" style="margin-top: 130px">
                                                    <span style="font-size: 18px">数据加载中 </span>
                                                    <img src="${pageContext.request.contextPath}/images/timg.gif"
                                                         width="30px">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 wrapper-two">
                                    <div class="thumbnail" style="padding: 20px">
                                        <div class="system-date-right">
                                            <div class="body-opa"></div>
                                            <div class="top-time">
                                                <h3>
                                                    <span class="glyphicon glyphicon-time"></span> 系统时钟
                                                </h3>
                                                <div class="sys-time">
                                                    <ul class="list-inline" style="display: inline-block">
                                                        <li class="hh">0</li>
                                                        <li class="h">0</li>
                                                    </ul>
                                                    <span>:</span>
                                                    <ul class="list-inline" style="display: inline-block">
                                                        <li class="mm">0</li>
                                                        <li class="m">0</li>
                                                    </ul>
                                                    <span>:</span>
                                                    <ul class="list-inline" style="display: inline-block">
                                                        <li class="ss">0</li>
                                                        <li class="s">0</li>
                                                    </ul>
                                                </div>
                                                <h3>
                                                    <span class="glyphicon glyphicon-bell"></span> 运行
                                                </h3>
                                                <div class="sys-time">
                                                    <ul class="list-inline" style="display: inline-block">
                                                        <li class="mmi">0</li>
                                                        <li class="mi">0</li>
                                                    </ul>
                                                    <span>:</span>
                                                    <ul class="list-inline" style="display: inline-block">
                                                        <li class="sse">0</li>
                                                        <li class="se">0</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--面板3-->
                            <div class="row show_six_product">
                                <h4>最新上架</h4>
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
                var objUrl = getObjectURL(this.files[0]); //调用函数传参，获取图片的路径，该路径不是图片在本地的路径
                if (objUrl) {
                    $(".showdeadimg img").css("display", "block");
                    $(".showdeadimg img").attr("src", objUrl); //将图片路径存入src中，显示出图片
                }
            });
        });

        /*系统时间*/
        setInterval(function () {
            var now = new Date();
            var ch_hour = getStringTime(now.getHours());
            var ch_minutes = getStringTime(now.getMinutes());
            var ch_second = getStringTime(now.getSeconds());
            $(".hh").html(ch_hour[0]);
            $(".h").html(ch_hour[1]);
            $(".mm").html(ch_minutes[0]);
            $(".m").html(ch_minutes[1]);
            $(".ss").html(ch_second[0]);
            $(".s").html(ch_second[1]);
        }, 1000);

        /*时间分割*/
        function getStringTime(time) {
            if (time < 10) {
                time = "0" + time;
            }
            var string_now = time.toString();
            var ch = new Array();
            ch.push(string_now[0]);
            ch.push(string_now[1]);
            return ch;
        }

        /*运行计时*/
        var mm = 0;
        var m = 0;
        var ss = 0;
        var s = 0;
        setInterval(function () {
            s++;
            if (s >= 10) {
                s = 0;
                ss++;
            }
            if (ss >= 6) {
                ss = 0;
                m++;
            }
            if (m >= 10) {
                m = 0;
                mm++;
            }
            if (mm >= 10) {
                alert("休息一下吧！");
                mm = 0;
            }
            var storage = window.localStorage;
            /*storage.key1 = s;
            storage["key2"] = ss;
            storage["key3"] = m;
            storage["key4"] = mm;*/
            $(".se").html(s);
            $(".sse").html(ss);
            $(".mi").html(m);
            $(".mmi").html(mm);
        }, 1000);

        $.ajax({
            url:"${pageContext.request.contextPath }/adminproduct/prolistcount",
            success:function (date) {
                var html = "";
                for (var i = 0; i < date.my_list.length; i++) {
                    var obj = date.my_list[i];
                    html+=getHtml(obj.pimg,obj.pname);
                }
                $(".show_six_product").append(html);
            }
        });

        function getHtml(obj1,obj2) {
            $html="<div class=\"col-sm-6 col-md-4 text-center\">\n" +
                "                                    <div class=\"thumbnail\">\n" +
                "                                        <a href=\"#\">\n"+
                "                                        <img src=\"${pageContext.request.contextPath }/statics/upprodectimg/"+obj1+"\" alt=\"缩略图\">\n" +
                "                                        </a>\n"+
                "                                        <div class=\"caption\">\n" +
                "                                            <h4>"+obj2+"</h4>\n" +
                "                                        </div>\n" +
                "                                    </div>\n" +
                "                                </div>";
            return $html;
        }
    })
</script>
</body>
</html>
