$(function () {

    // 订单的下载模式对话框的打开
    $("#download").on("click", function () {
        // 打开模式对话框
        $("div#myDownload").modal();
    });

    // 注册一个下载事件按钮：事件注册使用one，只响应一次。
    $("#downloadBtn").one("click", function () {
        // ajax发请求。
        $.ajax({
            type: "GET",
            url: "downloadTrade.action",
            dataType: "text",
            success:function (text, status) {
                console.log("fileName=" + text);
                // 要下载的超链接
                var a = $("#downloadA");
                // 设置下载链接:在download目录下面，然后文件名为：后台返回的。
                a.attr("href", "download/" + text);
                // 显示下载链接
                a.show(1000);
            }
        });
    });
});