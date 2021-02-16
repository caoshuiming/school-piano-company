$(function () {

    //删除
    // A[B^=C]匹配A标签且拥有B属性且属性值以C开头
    console.log("进入异步操作");
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
            url: "Cart_delete.action?goods_id=" + id,
            dataType: "text",
            success: function (text, status) {
                /**
                 * 删除时修改下方总数
                 * @type {string}
                 */
                var numpath="num_"+id;
                console.log("numpath"+numpath)
                //获取单行数量
                var nums1= document.getElementById(numpath).value;
                console.log("nums1"+nums1)
                //删除该行修改总数量
                var nums2=$("span[id='nums']").html();
                console.log("nums2"+nums2)
                $("span[id='nums']").html(nums2-nums1);
                /**
                 * 删除时修改下方总计
                 */
                var totalpath="total_"+id;
                console.log("totalpath"+totalpath)
                //获取单行小计
                var total1= document.getElementById(totalpath).innerHTML;
                console.log(" total1"+ total1)
                //删除该行修改总计
                var  total2=$("span[id='totals']").html().replaceAll("$", "");
                total3=total2-total1;
                console.log(" total2"+ total2)
                console.log(" total3"+ total3)
                $("span[id='totals']").html("$"+  total3.toFixed(1));
                // console.log("text=" + text + ", goods_id=" + id);
                $("tr#goods_" + id).remove();
            }
        });
    });


    // 拿到“num”元素
    var num = $("input[id^='num_']");

    num.bind("change", changeNum);
});

/**
 * num改变,价格改变:GET实现。
 */
function changeNum() {
    // 拿到num
    var val = $(this).val();
    //var id=$(this).attr("id");
    var goodsId = $(this).attr("goodsId")


    var url = "Cart_update.action?num=" + val + "&goods_id=" + goodsId;
    console.log("url=" + url);

    $.ajax({
        type: "GET",
        url:  url,
        dataType: "text",

        success: function (text, status) {

            var pricepath="price_"+goodsId;
                //获取单价
              var price= document.getElementById(pricepath).innerHTML;
            console.log("price="+price) ;
            //获取数量

            //修改单行总计
            var totalpath="total_"+goodsId;
            var total= price*val;

            document.getElementById(totalpath).innerHTML=total.toFixed(1);

            //修改购物车总数量
            var nums=0;
             //转为整型。
            Number(nums);
            $("input[id^='num_']").each(function () {

                    nums=nums+Number($(this).val());
            })
            $("span[id='nums']").html(nums);

            //修改购物车总计
            var totals=0.0;
            //转为浮点数。
            parseFloat(totals);
            $("span[id^='total_']").each(function () {

                totals=totals+parseFloat($(this).html());
            })
            $("span[id='totals']").html('$'+totals.toFixed(1));


        }, complete:function (XMLHttpRequest, textStatus) {
            console.log("complete.....");
        }, error: function () {
            console.log("error...............")
        }
    });



}

