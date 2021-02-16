// 页面加载完毕
$(function(){
    // GET方式。
    console.log("进入ajax事件");
    $("#ruser-name").bind("blur",checkUsernameByGet);
    $("#ruser-password").bind("blur",checkPasswordByGet);
    $("#rEmail").bind("blur",checkEmailByGet);
    $("#login").bind("click",checkLogin);
    $("#search_name").bind("keyup",autocomplete);

        // console.log("根据信息获取产品")
        var keyName=$("#goodslist a");
        keyName.each(function (i) {
            $(this).bind("click",function () {
                console.log($(this).html())
            })
        });

})


/**
 * 用于登录检测
 */
function checkLogin() {
    var username = $("#user-name").val();
    var password=$("#user-password").val();
    // 查询的url
    if(username == null || username == "" &&password == null || password == "") {
        return;
    }
    var url = "login.action?user-name=" + username+"&user-password="+password;
    $.ajax({
        type: "GET",
        url:  url,
        dataType: "text",
        success: function (text, status) {
            //alert("回传的bool"+text);
            // 获取提示的<span>
            var span = $("#loginTip");
            if(text == "true") {
                span.html("√");
                span.css({
                    color:"green"
                });
                window.location.href="index.jsp";
            } else if(text == "false") {
                //alert("false");
                span.css({
                    color:"red"
                });
            }
            span.show(1000);
        }
    });
}

/**
 * 用于检测用户名是否被占用:GET实现。
 */
function checkUsernameByGet() {
    // 拿到用户名。
    var rusername = $("#ruser-name").val();
    // 查询的url
    if(rusername == null || rusername == "") {
        return;
    }
    var url = "registercheck.action?user-name=" + rusername;
    $.ajax({
        type: "GET",
        url:  url,
        dataType: "text",
        success: function (text, status) {
            // 获取提示的<span>
            var span = $("#nameTip");
            if(text == "true") {
                span.html("用户名可用");
                span.css({
                    color:"green"
                });

            } else if(text == "false") {
                span.css({
                    color:"red"
                });
            }
            span.show(1000);
        }
    });
}


/**
 * 用于检测密码位数是否合适
 */
function checkPasswordByGet() {
    // 拿到用户名。
    var rpassword = $("#ruser-password").val();
    // 查询的url
    if(rpassword == null || rpassword == "") {
        return;
    }
    var url = "registercheck.action?user-password=" + rpassword;
    $.ajax({
        type: "GET",
        url:  url,
        dataType: "text",
        success: function (text, status) {
            // 获取提示的<span>
            var span = $("#passwordTip");
            if(text == "true") {
                span.html("密码可用");
                span.css({
                    color:"green"
                });

            } else if(text == "false") {
                span.css({
                    color:"red"
                });
            }
            span.show(1000);
        }
    });
}


/**
 * 用于检测邮箱格式是否正确
 */
function checkEmailByGet() {
    // 拿到用户名。
    var Email = $("#rEmail").val();
    // 查询的url
    if (Email == null || Email == "") {
        return;
    }
    var url = "registercheck.action?Email=" + Email;
    $.ajax({
        type: "GET",
        url: url,
        dataType: "text",
        success: function (text, status) {
            // 获取提示的<span>
            var span = $("#emailTip");
            if (text == "true") {
                span.html("邮箱可用");
                span.css({
                    color:"green"
                });

            } else if(text == "false") {
                span.css({
                    color:"red"
                });
            }
            span.show(1000);
        }
    });
}

/**
 * 根据列表信息获取产品
 */
function getGoodsByName() {
   // console.log("根据信息获取产品")
    var keyName=$("#goodslist a");
    keyName.each(function (i) {
       $(this).bind("click",function () {
            console.log($(this).html())
       })
    })

}

/**
 * 自动补全搜索框
 */
function autocomplete() {
    console.log("进入自动补全方法")
    var value=$(this).val();
    if(value == null || value == "") {
        return;
    }
    // ajax异步处理。
    $.ajax({
        type: "GET",
        url: "autoComplete.action?keyword=" + value,
        dataType: "JSON",
        success: function (json, status) {
            if(json !=null && json.length>0) {
                // 去拼装HTML。
                handlerHtml(json);
            }
        }
    })

    $(document).on("mouseover", ".div", function () {
        // 鼠标移入就加背景颜色
        $(this).css("background", "#ccc");
    }).on("mouseout", ".div", function () {
        // 鼠标移出以后去掉背景
        $(this).css("background", "white");
    }).on("click", ".div", function () {
        // 如果点击的话，获取div的内容，然后设置到文本框，然后提示隐藏。
        var value = $(this).text();
        //$(".search_input").attr("value", value); // 设置value属性的时候有点问题。
        $("#search_name").val(value);
        console.log("获取的值：" + $("#search_name").attr("value"));
        // 然后提示隐藏。
        $("div#ac").hide();
    })
}


function handlerHtml(json) {
    var divs = "";
    // 循环JSON
    for(var i=0; i<json.length; i++) {
        divs += "<div class=\"div\">" + json[i] + "</div>";
    }
    // 把拼装的DIV加入到“<div id="ac">”
    $("div#ac").html(divs);
    // 显示DIV
    $("div#ac").slideDown(2000);
}