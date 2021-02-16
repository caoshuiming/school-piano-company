// 页面加载完毕
window.onload = function () {

    // 给用户名的输入框注册“失去焦点的事件”
    var username = document.getElementById("username");
    // GET方式。
    //username.onblur = checkUsernameByGet;
    // POST方式。
    username.onblur = checkUsernameByGet
}

/**
 * 用于检测用户名是否被占用:GET实现。
 */
function checkUsernameByGet() {
    var username = document.getElementById("username").value;
    console.log("获取的用户名是：" + username);
    // 判断一下
    if(username != null && "" != username) {
        // 获取 XMLHttpRequest 对象。
        var xhr = getXMLHttpRequest();
        console.log("XMLHttpRequest=" + xhr);
        // 要注册回调函数。
        xhr.onreadystatechange = function () {
            // 0: 请求未初始化
            // 1: 服务器连接已建立
            // 2: 请求已接收
            // 3: 请求处理中
            // 4: 请求已完成，且响应已就绪。
            if(xhr.readyState == 4) {// 请求处理完毕了。
                if(xhr.status == 200) {// 请求已经正常的处理完毕。
                    // 获取servlet里面通过流响应的数据
                    var bool = xhr.responseText;
                    console.log("响应值：" + bool);
                    var span = document.getElementById("nameTip");
                    if(bool == "true") {
                        // 可用就打钩 √
                        span.innerHTML = "√√√";
                    } else {
                        // 显示用户名已经被占用。
                        span.innerHTML = "用户名已经被占用!!!";
                    }
                    span.style.display = "inline";
                }
            }
        }
        // 把请求发往后台:假设用GET。
        var url = "checkusersname.action?username=" + username;
        // 如果用中文，我们需要编码一下。
        url = encodeURI(url);
        console.log("url:" + url)
        // 打开链接: 提交的方式是GET，还是POST；第二个是URL；第三个是是否为异步。
        xhr.open("GET", url, true);
        // 发送请求:因为GET是通过URL发送的。
        xhr.send(null);
    }
}

/**
 * 用于检测用户名是否被占用:POST实现。
 */
function checkUsernameByPost() {

    var username = document.getElementById("username").value;
    console.log("获取的用户名是：" + username);
    // 判断一下
    if(username != null && "" != username) {
        // 获取 XMLHttpRequest 对象。
        var xhr = getXMLHttpRequest();
        console.log("XMLHttpRequest=" + xhr);
        // 要注册回调函数。
        xhr.onreadystatechange = function () {
            // 0: 请求未初始化
            // 1: 服务器连接已建立
            // 2: 请求已接收
            // 3: 请求处理中
            // 4: 请求已完成，且响应已就绪。
            if(xhr.readyState == 4) {// 请求处理完毕了。
                if(xhr.status == 200) {// 请求已经正常的处理完毕。
                    // 获取servlet里面通过流响应的数据
                    var bool = xhr.responseText;
                    console.log("响应值：" + bool);
                    var span = document.getElementById("nameTip");
                    if(bool == "true") {
                        // 可用就打钩 √
                        span.innerHTML = "√";
                    } else {
                        // 显示用户名已经被占用。
                        span.innerHTML = "用户名已经被占用!!!";
                    }
                    span.style.display = "inline";
                }
            }
        }
        // 把请求发往后台:假设用POST。
        var url = "checkusersname.action";
        // 如果用中文，我们需要编码一下。
        console.log("url:" + url)
        // 打开链接: 提交的方式是GET，还是POST；第二个是URL；第三个是是否为异步。
        xhr.open("POST", url, true);
        // POST要设置请求头
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        // 需要把请求的参数通过send()发送过去。
        var para = "username=" + username;
        xhr.send(para);
    }
}

/**
 * 获取 XMLHttpRequest.
 * 不同的浏览器，获取的方式不一样。
 */
function getXMLHttpRequest() {

    var xhr = null;
    // IE要特殊的实例化。
    if(typeof XMLHttpRequest == "undefined") {
        xhr = new ActiveXObject("Microsoft.XMLHttp");
    } else {
        // firefox,chrome,苹果的浏览器。
        xhr = new XMLHttpRequest();
    }
    return xhr;
}