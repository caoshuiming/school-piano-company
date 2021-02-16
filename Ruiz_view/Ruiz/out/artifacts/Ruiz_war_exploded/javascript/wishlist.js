$(function () {


    // A[B^=C]匹配A标签且拥有B属性且属性值以C开头
    $("i[id^='delSpan_']").bind("click", function () {
        var id = $(this).attr("id");
        console.log("id=" + id);
        // id=delSpan_10
        id = id.replaceAll("delSpan_", "");
        console.log("id=" + id);
        // 异步发请求。
        $.ajax({
            type: "GET",
            url: "Wishlist_delete.action?goods_id=" + id,
            dataType: "text",
            success: function (text, status) {
                // console.log("text=" + text + ", goods_id=" + id);
                $("tr#goods_" + id).remove();
            }
        });
    });


});


