/* 1.获取本地图片路径*/
function getObjectURL(file) {
    var url = null;
    if (window.createObjectURL != undefined) { // basic
        url = window.createObjectURL(file);
    } else if (window.URL != undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}

/* 2.日期选择*/
(function ($) {
    $.extend({
        ms_DatePicker: function (options) {
            var defaults = {
                YearSelector: "#sel_year",
                MonthSelector: "#sel_month",
                DaySelector: "#sel_day",
                FirstText: "请选择",
                FirstValue: 0
            };
            var opts = $.extend({}, defaults, options);
            var $YearSelector = $(opts.YearSelector);
            var $MonthSelector = $(opts.MonthSelector);
            var $DaySelector = $(opts.DaySelector);
            var FirstText = opts.FirstText;
            var FirstValue = opts.FirstValue;

            // 初始化
            var str = "<option value=\"" + FirstValue + "\">" + FirstText + "</option>";
            $YearSelector.html(str);
            $MonthSelector.html(str);
            $DaySelector.html(str);

            // 年份列表
            var yearNow = new Date().getFullYear();
            var yearSel = $YearSelector.attr("rel");
            for (var i = yearNow; i >= 1900; i--) {
                var sed = yearSel == i ? "selected" : "";
                var yearStr = "<option value=\"" + i + "\" " + sed + ">" + i + "</option>";
                $YearSelector.append(yearStr);
            }

            // 月份列表
            var monthSel = $MonthSelector.attr("rel");
            for (var i = 1; i <= 12; i++) {
                var sed = monthSel == i ? "selected" : "";
                var monthStr = "<option value=\"" + i + "\" " + sed + ">" + i + "</option>";
                $MonthSelector.append(monthStr);
            }

            // 日列表(仅当选择了年月)
            function BuildDay() {
                if ($YearSelector.val() == 0 || $MonthSelector.val() == 0) {
                    // 未选择年份或者月份
                    $DaySelector.html(str);
                } else {
                    $DaySelector.html(str);
                    var year = parseInt($YearSelector.val());
                    var month = parseInt($MonthSelector.val());
                    var dayCount = 0;
                    switch (month) {
                        case 1:
                        case 3:
                        case 5:
                        case 7:
                        case 8:
                        case 10:
                        case 12:
                            dayCount = 31;
                            break;
                        case 4:
                        case 6:
                        case 9:
                        case 11:
                            dayCount = 30;
                            break;
                        case 2:
                            dayCount = 28;
                            if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)) {
                                dayCount = 29;
                            }
                            break;
                        default:
                            break;
                    }

                    var daySel = $DaySelector.attr("rel");
                    for (var i = 1; i <= dayCount; i++) {
                        var sed = daySel == i ? "selected" : "";
                        var dayStr = "<option value=\"" + i + "\" " + sed + ">" + i + "</option>";
                        $DaySelector.append(dayStr);
                    }
                }
            }

            $MonthSelector.change(function () {
                BuildDay();
            });
            $YearSelector.change(function () {
                BuildDay();
            });
            if ($DaySelector.attr("rel") != "") {
                BuildDay();
            }
        } // End ms_DatePicker
    });
})(jQuery);

/* 3.生成验证码*/
function createCode(e) {
    var code = "";
    var codeLength = 4;
    var selectChar = [1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
    for (var i = 0; i < codeLength; i++) {  //生成 4 位数验证码
        var charIndex = Math.floor(Math.random() * 57);
        code += selectChar[charIndex];
    }
    if (code.length != codeLength) {
        createCode(e);
    } else {
        return code;
    }
}

$(function ($) {
    /*4.锚点跳转滑动效果 href*=# 即 href = # + **/
    $('a[href=#head]').click(function () {
        var $target = $(this.hash);//hash 属性是一个可读可写的字符串，该字符串是 URL 的锚部分（从 # 号开始的部分）
        $target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');//slice() 从已有的数组中返回选定的元素
        if ($target.length) {
            var targetOffset = $target.offset().top;//点击处距离顶部的距离
            $('html,body').animate({//动画效果
                scrollTop: targetOffset
            }, 1000);
            return false;
        }
    });

    $('.bottom-img').click(function () {
        var targetOffset = $(this).offset().top;
        var thisHeight = $(this).height() + 14;
        $('html,body').animate({
            scrollTop: targetOffset + thisHeight
        }, 1000);
    });

    $(window).scroll(function () {
        if ($(window).scrollTop() > 600) {
            $(".float").show(300);
        } else {
            $(".float").hide(300);
        }
    });

    /* 6.购物车相关*/
    /* 全选和全不选 */
    $("#checkAll").click(function () {
        if (this.checked == true) {
            $("input[name='subBox']").each(function () {
                this.checked = true;
            })
        } else if (this.checked == false) {
            $('input[name="subBox"]').each(function () {
                this.checked = false;
            })
        }
    });
});

/* 5.Ajax提交*/
function AjaxPost(Url, JsonData, ReturnFun) {
    $.ajax({
        type: "post",
        url: Url,
        data: JsonData,
        dataType: 'json',
        async: 'false',
        error: function () {
            AjaxError({"Status": "Erro", "Erro": "500"});
        },
        success: ReturnFun
    });
}

//示例
//AjaxPost("ajax调用路径", ajax传参,
//                function () {
//                     //ajax加载中
//                },
//                function (data) {
//                    //ajax返回
//                    //AjaxErro(data);
//                })

//Ajax 错误返回处理
function AjaxError(e) {
    if (e.Status == "Erro") {
        switch (e.Erro) {
            case "500":
                alert(e.Erro + "错误！");
                break;
            case "100001":
                alert("错误 : 错误代码 '10001'");
                break;
            default:
                alert(e.Erro);
        }
    } else {
        alert("未知错误！");
    }
}

/*商品数量右点+1，左点-1*/
$(".form-reduce").click(function () {
    var res = parseInt($(this).next().val());
    res--;
    if (res < 1) {
        res = 1;
        $(".form-reduce").hide();
    }
    var sellprice = parseInt($(".sellprice").html());
    $(".price_all").html(sellprice * res);
    $(this).next().val(res);
});
$(".form-add").click(function () {
    var res = parseInt($(this).prev().val());
    $(".form-reduce").show();
    res++;
    var sellprice = parseInt($(".sellprice").html());
    $(".price_all").html(sellprice * res);
    $(this).prev().val(res);
});
$(".commodityQty").blur(function () {
    var res = parseInt($(this).val());
    var sellprice = parseInt($(".sellprice").html());
    if (res < 1) {
        res = 1;
    }
    $(".price_all").html(sellprice * res);
    $($(this)).val(res);
});