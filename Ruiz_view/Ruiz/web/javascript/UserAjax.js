// 页面加载完毕
$(function(){
    // GET方式。
    console.log("进入ajax事件");
    $("#ruser-name").bind("blur",checkUsernameByGet);
    $("#ruser-password").bind("blur",checkPasswordByGet);
    $("#rEmail").bind("blur",checkEmailByGet);
    $("#login").bind("click",checkLogin);
    $("#searchkey").bind("keyup",autocomplete);
    $("a[id^='detail_']").bind("click",detailGoods);
    $("#shopping_cost").bind("click",shoppingcost);
    $("#free").bind("click",freeshoppingcost);
    $("#logout").bind("click",logout);
    $("#relogout").bind("click",logout);

    $("#bankpay").bind("click",function () {
        $("#tb1").show(800);
        $("#tb2").hide();
        $("#tb3").hide();
    });
    $("#vxpay").bind("click",function () {
        $("#tb2").show(800);
        $("#tb1").hide();
        $("#tb3").hide();
    });

    $("#zfbpay").bind("click",function () {
        $("#tb3").show(800);
        $("#tb1").hide();
        $("#tb2").hide();
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
                span.show(1000);
            }

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
        $("#searchkey").val(value);
        console.log("获取的值：" + $("#searchkey").attr("value"));
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
    $("div#ac").slideDown(1000);
}


/**
 * 商品细节
 */
function detailGoods() {
    var id= $(this).attr("goodsId");
    if(id == null || id == "") {
        return;
    }
    console.log("id-->"+id);
    $.ajax({
        type: "GET",
        url: "getGoods.action?goods_id=" + id,
        dataType: "JSON",
        success: function (json, status) {
            var goods_name= json.goods_name;
            var price=json.price;
            var description=json.description;
            var img=json.img_url;
            var category=json.category;
            var brand=json.brand;
            $("#largeimg").attr("src",img);
            $("#detailname").html(goods_name);
            $("#detaildescription").html(description);
            $("#modal_category").html(category);
            $("#modal_brand").html(brand);
            $("#old-price").html("$"+price);
            var new_price=price*0.8;
            $("#new-price").html("$"+new_price.toFixed(2));
            $("#cartgoodsid").attr("action","Cart_add.action?goods_id="+id);
            $("#wishgoodsid").attr("href","Wishlist_add.action?goods_id="+id);
        }
    })
}


/**
 * 确认运费的方法
 */
function shoppingcost() {
    var count=$("#final_totals").val();
    var totalcount=parseFloat(count)+parseFloat(7);
    $("#last_totals").html(totalcount.toFixed(1));
}

function freeshoppingcost() {
    var count=$("#final_totals").val();
    $("#last_totals").html(count);

}

/**
 *注销的确认
 */
function logout() {
    var flag=window.confirm("确认注销？");
    if(flag==true){
        window.location.href="logout.action";
    }
}