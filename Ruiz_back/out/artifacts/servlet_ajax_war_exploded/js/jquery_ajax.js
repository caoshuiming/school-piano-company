// 文档就绪
$(function () {
    // 拿到“用户名”元素
    var username = $("#user_name");
    // 失去焦点事件
    //username.bind("blur", checkUsernameByGet);
    username.bind("blur", checkUsernameByPost);
});

/**
 * 用于检测用户名是否被占用:GET实现。
 */
function checkUsernameByGet() {
    // 拿到用户名
    var username = $("#user_name").val();
    // 非空判断。
    if(username == null || username == "") {
        return;
    }
    var url = "checkusersname.action?username=" + username;
    console.log("url=" + url);
    $.ajax({
        type: "GET",
        url:  url,
        dataType: "text",
        beforeSend:function (XMLHttpRequest) {
            console.log("beforeSend......");
        }, success: function (text, status) {
            console.log("text=" + text + ", status=" + status);
            // 获取提示的<span>
            var span = $("#usersnameTip");
            var bt=$("#tj");
            if(text == "true") {
                span.html("<span style='color: green'>*该用户名可以使用!</span>");
                bt.attr("type","submit");
            } else if(text == "false") {
                span.html("<span style='color: #c12e2a'>*该用户名已经被占用！</span>");
                bt.attr("type","reset");
            }
            span.show(300);
        }, complete:function (XMLHttpRequest, textStatus) {
            console.log("complete.....");
        }, error: function () {
            console.log("error...............")
        }
    });
}

/**
 * 用于检测用户名是否被占用:post实现。
 */
function checkUsernameByPost() {

    // 拿到用户名
    var username = $("#user_name").val();
    // 非空判断。
    if(username == null || username == "") {
        return;
    }
    var url = "checkusersname.action";
    console.log("url=" + url);
    $.ajax({
        type: "POST",
        url: url,
        dataType: "text",
        data: "username=" + username + "&second=test", // 可以传递多个参数。
        beforeSend:function (XMLHttpRequest) {
            console.log("beforeSend......");
        }, success: function(text, status) {
            console.log("text=" + text + ", status=" + status);
            // 获取提示的<span>
            var span = $("#usersnameTip");
            var bt=$("#tj");
            if(text == "true") {
                span.html("<span style='color: green'>*该用户名可以使用!</span>");
                bt.attr("type","submit");
            } else if(text == "false") {
                span.html("<span style='color: #c12e2a'>*该用户名已经被占用!</span>");
                bt.attr("type","reset");
            }
            span.show(300);
        }, complete:function (XMLHttpRequest, textStatus) {
            console.log("complete.....");
        }
    });
}


// 文档就绪
$(function () {
    // 拿到“用户名”元素
    var username = $("#m_name");
    // 失去焦点事件
    //username.bind("blur", checkManagernameByGet);
    username.bind("blur", checkManagernameByPost);
});

/**
 * 用于检测用户名是否被占用:GET实现。
 */
function checkManagernameByGet() {
    // 拿到用户名
    var username = $("#m_name").val();
    // 非空判断。
    if(username == null || username == "") {
        return;
    }
    var url = "checkmanagername.action?m_name=" + username;
    console.log("url=" + url);
    $.ajax({
        type: "GET",
        url:  url,
        dataType: "text",
        beforeSend:function (XMLHttpRequest) {
            console.log("beforeSend......");
        }, success: function (text, status) {
            console.log("text=" + text + ", status=" + status);
            // 获取提示的<span>
            var span = $("#managernameTip");
            var bt=$("#m_tj");
            if(text == "true") {
                span.html("<span style='color: green'>*该用户名可以使用!</span>");
                bt.attr("type","submit");
            } else if(text == "false") {
                span.html("<span style='color: #c12e2a'>*该用户名已经被占用！</span>");
                bt.attr("type","reset");
            }
            span.show(300);
        }, complete:function (XMLHttpRequest, textStatus) {
            console.log("complete.....");
        }, error: function () {
            console.log("error...............")
        }
    });
}

/**
 * 用于检测用户名是否被占用:post实现。
 */
function checkManagernameByPost() {

    // 拿到用户名
    var username = $("#m_name").val();
    // 非空判断。
    if(username == null || username == "") {
        return;
    }
    var url = "checkmanagername.action";
    console.log("url=" + url);
    $.ajax({
        type: "POST",
        url: url,
        dataType: "text",
        data: "m_name=" + username + "&second=test", // 可以传递多个参数。
        beforeSend:function (XMLHttpRequest) {
            console.log("beforeSend......");
        }, success: function(text, status) {
            console.log("text=" + text + ", status=" + status);
            // 获取提示的<span>
            var span = $("#managernameTip");
            var bt=$("#m_tj");
            if(text == "true") {
                span.html("<span style='color: green'>*该用户名可以使用!</span>");
                bt.attr("type","submit");
            } else if(text == "false") {
                span.html("<span style='color: #c12e2a'>*该用户名已经被占用！</span>");
                bt.attr("type","reset");
            }
            span.show(300);
        }, complete:function (XMLHttpRequest, textStatus) {
            console.log("complete.....");
        }
    });
}