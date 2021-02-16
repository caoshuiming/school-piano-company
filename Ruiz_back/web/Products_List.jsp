<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.test.pojo.Pagination" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.pojo.Goods" %>
<%@ page import="com.test.utils.ConfigFactory" %>
<%
    String path = request.getContextPath();
    Pagination pagination = (Pagination) request.getAttribute("pagination");
    List<Goods> goodsList = (List<Goods>) pagination.getResult();

%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link href="Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript" ></script>
    <script src="assets/laydate/laydate.js" type="text/javascript"></script>
    <script type="text/javascript" src="Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
    <script src="js/lrtk.js" type="text/javascript" ></script>
    <title>产品列表</title>
</head>
<body>
<div class="container">
     <div class="border ">
       <span class="l_f">
           <a href="home.jsp" title="返回主页" class="btn btn-success "><i class="icon-home"></i>返回主页</a>
           <button id="addGoods_List" title="添加商品" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加商品</button>
           <button class="btn btn-danger" id="removeBatchGoods"><i class="icon-trash"></i>批量删除</button>
        <!-- 使用隐藏域保存页码。 -->
        <input type="hidden" name="displayPageNo" id="displayPageNo" value="<%=pagination.getPageNo()%>"/>
        <select id="sizeSelect" class="btn btn-info" style="height: 35px;width: 110px">
            <option value="5" <%=pagination.getPageSize() == 5 ? "selected" : "" %>>每页5条</option>
            <option value="10" <%=pagination.getPageSize() == 10 ? "selected" : "" %>>每页10条</option>
            <option value="20" <%=pagination.getPageSize() == 20 ? "selected" : "" %>>每页20条</option>
            <option value="50" <%=pagination.getPageSize() == 50 ? "selected" : "" %>>每页50条</option>
            <option value="100" <%=pagination.getPageSize() == 100 ? "selected" : "" %>>每页100条</option>
        </select>

       </span>
       <span class="r_f" id="goodsCounts">
           共：<b><%= pagination.getCounts()%></b>件商品
       </span>
     </div>
     <!--产品列表展示-->
     <div >
        <table class="table table-striped table-bordered table-hover" >
            <thead>
                <tr>
                    <th ><label><input type="checkbox" class="ace" id="checkboxGoods"><span class="lbl"></span></label></th>
                    <th >商品序号</th>
                    <th >商品名称</th>
                    <th >商品图片</th>
                    <th >商品价格</th>
                    <th >商品品牌</th>
                    <th >商品分类</th>
                    <th >商品库存</th>
                    <th >销量</th>
                    <th >操作</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (goodsList != null){
                        for (int i = 0; i < goodsList.size(); i++) {
                            Goods goods = goodsList.get(i);
                %>
                <tr id="goods_<%=goods.getGoods_id()%>">
                    <td>
                        <label><input type="checkbox" class="ace" id="checkboxGoods_<%=goods.getGoods_id()%>"><span class="lbl" ></span></label>
                    </td>
                    <td id="index_<%=goods.getGoods_id()%>">
                        <%=pagination.getPageNo()*pagination.getPageSize() + (i + 1)%>
                    </td>
                    <td>
                        <%=goods.getGoods_name()%>
                    </td>
                    <td>
                        <img src="<%=goods.getImg_url()%>" style="width: 50px;height: 50px;">
                    </td>
                    <td>
                        <%=goods.getPrice()%>
                    </td>
                    <td>
                        <%=goods.getBrand()%>
                    </td>
                    <td>
                        <%=goods.getCategory()%>
                    </td>
                    <td>
                        <%=goods.getStock()%>
                    </td>
                    <td>
                        <%=goods.getPayed_num()%>
                    </td>
                    <td>
                        <button title="编辑" id="ModifyGoods_<%=goods.getGoods_id()%>" class="btn btn-xs btn-warning" ><i class="icon-edit bigger-120"></i>
                        </button>
                        <button title="删除" id="deleteOneGoods_<%=goods.getGoods_id()%>" class="btn btn-xs btn-danger" ><i class="icon-trash  bigger-120"></i>
                        </button>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="9">没有数据！</td>
                        </tr>
                 <% } %>

                <tr>
                    <td align="center" colspan="10" >

                        <span>
                         <button class="btn btn-default"><b><%=pagination.getPageNo() + 1 %></b>/<%=pagination.getPages() %></button>
                            <% if(pagination.getFirstPage()) { %>
                                <button class="btn btn-default">首页</button> <button class="btn btn-default"> 上一页</button>
                            <% } else { %>
                                <button class="btn btn-info" style="height: 35px"><a href="goodsPage.action?pageNo=0&pageSize=<%=pagination.getPageSize() %>">首页</a></button>
                                <button class="btn btn-info" style="height: 35px"><a href="goodsPage.action?pageNo=<%=pagination.getPageNo()-1 %>&pageSize=<%=pagination.getPageSize() %>">上一页</a></button>
                            <% } %>
                        </span>
                        <span>
                            <% if(pagination.getLastPage()) { %>
                                <button class="btn btn-default">下一页</button> <button class="btn btn-default"> 尾页</button>
                            <% } else { %>
                                <button class="btn btn-info" style="height: 35px"><a href="goodsPage.action?pageNo=<%=pagination.getPageNo()+1 %>&pageSize=<%=pagination.getPageSize() %>">下一页</a></button>
                                <button class="btn btn-info" style="height: 35px"><a href="goodsPage.action?pageNo=<%=pagination.getPages()-1 %>&pageSize=<%=pagination.getPageSize() %>">尾页</a></button>
                            <% } %>
                        </span>
                        <span>
                             <%--<button id="btnJump1" class="btn btn-default" style="width: 70px;height: 28px;" ></button>--%>
                            <input type="number" id="jump" name="jump" value="" style="width:70px;margin-left :0px; float: right;height: 35px" size="5" maxlength="5" placeholder="第几页"  />
                            <input type="button" id="btnJump" class="btn btn-info" value="跳转至" style="float: right;margin-right: 0px;width: 65px;height: 35px;"/>
                                 <!-- 使用隐藏域保存页大小。 -->
                            <input type="hidden" name="pageSize" id="pageSize" value="<%=pagination.getPageSize()%>" />
                        </span>
                    </td>
                </tr>
            </tbody>
        </table>
     </div>
</div>

<!-- 模式对话框  -->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLabel">
    <div class="modal-dialog" role="document" style="width:700px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="descsEndinfoLabel">商品上传向导</h4>
            </div>
            <div class="modal-body">
                <div class="container text-center">

                    <form class="form-horizontal" method="post" action="<%=path%>/goodsAdd.action">
                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品名称
                            </label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="goodsName" name="goodsName" value="" placeholder="商品名称" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品图片
                            </label>
                            <div class="col-md-5">
                                <%--file类型--%>
                                <input type="text" class="form-control" id="goodsImage" name="goodsImage" value="" placeholder="上传图片" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品价格
                            </label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="goodsPrice" name="goodsPrice" value="" placeholder="商品价格" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品品牌
                            </label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="goodsBrand" name="goodsBrand" value="" placeholder="商品品牌" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品分类
                            </label>
                            <div class="col-md-5">
                                <input type="text" id="goodsCategory" name="goodsCategory" class="form-control" value="" placeholder="吉他·钢琴·管乐器·弦乐器" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品库存
                            </label>
                            <div class="col-md-5">
                                <input type="number" class="form-control" id="goodsStock" name="goodsStock" value="" placeholder="库存数量" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品描述
                            </label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="goodsDescription" name="goodsDescription" value="" placeholder="描述一波"  />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                            <button id="btn1" type="submit" class="btn btn-primary">添加</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>


<!-- 模式对话框  -->
<div id="myModify" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLabel">
    <div class="modal-dialog" role="document" style="width:700px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="descsEndinfoLabelAa">商品编辑向导</h4>
            </div>
            <div class="modal-body">
                <div class="container text-center">

                    <form class="form-horizontal" method="post" action="<%=path%>/modifyGoods.action">
                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品名称
                            </label>
                            <div class="col-md-5">
                                <input type="hidden" id="ModifyId" name="ModifyId" value=""/>
                                <input type="text" class="form-control" id="ModifyName" name="ModifyName" value=""  required />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品图片
                            </label>
                            <div class="col-md-5">
                                <%--file类型--%>
                                <input type="text" class="form-control" id="ModifyImage" name="ModifyImage" value="" placeholder="" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品价格
                            </label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="ModifyPrice" name="ModifyPrice" value="" placeholder="商品价格" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品品牌
                            </label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="ModifyBrand" name="ModifyBrand" value="" placeholder="商品品牌" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品分类
                            </label>
                            <div class="col-md-5">
                                <input type="text" id="ModifyCategory" name="ModifyCategory" class="form-control" value="" placeholder="吉他·钢琴·管乐器·弦乐器" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品库存
                            </label>
                            <div class="col-md-5">
                                <input type="number" class="form-control" id="ModifyStock" name="ModifyStock" value="" placeholder="库存数量" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-1 text-right">
                                商品描述
                            </label>
                            <div class="col-md-5">
                                <input type="hidden" id="ModifyPageNo" name="ModifyPageNo" value="<%=pagination.getPageNo()%>"/>
                                <input type="hidden" id="ModifyPageSize" name="ModifyPageSize" value="<%=pagination.getPageSize()%>"/>
                                <input type="text" class="form-control" id="ModifyDescription" name="ModifyDescription" value="" placeholder="描述一波"  />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                            <button id="btn2" type="submit" class="btn btn-primary">确认编辑</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>

    $(function () {
        <%--页面跳转--%>
        $("#btnJump").bind("click", function () {
            var no = $("#jump").val();
            no = no - 1;
            var pageSize = $("#pageSize").val();
            // 往后发送请求。
            var url = "goodsPage.action?pageNo=" + no + "&pageSize=" + pageSize;
            //console.log("url=" + url);
            //alert(url);
            // 使用javascript进行页面跳转。
            window.location.href = url;
        });

        // 给页大小下拉框注册change事件
        $("#sizeSelect").bind("change", function () {
            // 获取设置的页大小
            var pageSize = $(this).val();
            // 获取页码。
            var pageNo = $("#displayPageNo").val();
            // 往后发送请求。
            var url = "goodsPage.action?pageNo=" + pageNo + "&pageSize=" + pageSize;
            //console.log("url=" + url);
            //alert(url);
            // 使用javascript进行页面跳转。
            window.location.href = url;
        });

        /*应该是复选框得处理，原有的*/
        $('table th input:checkbox').on('click' , function(){
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function(){
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });
        });

        //当点击批量删除时，删除所有复选框选中goods
        $("#removeBatchGoods").on("click",function () {
            var data = "";
            $("input[id^='checkboxGoods_']").each(function () {
                //获取复选框状态
                var status = $(this).prop("checked");
                //console.log(status);
                if (status){
                    var id = $(this).attr("id");
                    //console.log(id);
                    id = id.replaceAll("checkboxGoods_","");
                    //console.log(id);
                    // 根据ID去查找要删除的<tr>：先fadeOut，然后在删除页面的tr.
                    $("tr#goods_" + id).fadeOut(1000, function () {
                        $("tr#goods_" + id).remove();
                        // 重新编序：找到序号的<td>，然后循环然后重新设置。
                        $("td[id^='index_']").each(function (i) {
                            $(this).html(i+1);
                        });
                    });
                    data = data+id+"*";
                }
            });
            if ("" !== data ){
                console.log(data);
                $.ajax({
                    type : "GET",
                    url :"deleteBatchGoods.action?id=" + data,
                    dataType : "text",
                    success : function (text,status) {
                        //text返回查询到得总库存数
                        //console.log("text=" + text + ", id=" + id);
                        //每删除一件goods，重新获取所以goods库存数
                        var spans = " 共：<b>"+text+"</b>件商品";
                        console.log(spans);
                        $("span#goodsCounts").html(spans);
                    }
                })
            }
        });



        // 打开模式对话框：添加单个商品信息
        $("#addGoods_List").bind("click", function () {
            $("div#myModal").modal();
        });


        // 打开模式对话框：修改单个商品信息
        $("button[id^='ModifyGoods_']").bind("click",function () {
            $("div#myModify").modal();
            //获取id，查询此tr下goods的原本信息
            var id = $(this).attr("id");
            //console.log("id=" + id);
            id = id.replaceAll("ModifyGoods_","");
            //给隐藏域设置value值，
            $("input#ModifyId").val(id);
            //console.log("id=" + id);
            // 异步发请求。先查询此goods的信息
            $.ajax({
                type: "GET",
                url: "getGoodsById.action?id="+id,
                dataType: "JSON",
                success:function (json,status) {
                    console.log(json);
                    // handlerHtml(json);
                    $("input#ModifyName").val(json.goods_name);
                    $("input#ModifyImage").val(json.img_url);
                    $("input#ModifyPrice").val(json.price);
                    $("input#ModifyBrand").val(json.brand);
                    $("input#ModifyCategory").val(json.category);
                    $("input#ModifyStock").val(json.stock);
                    $("input#ModifyDescription").val(json.description);
                }
            })
        });




        //Ajax删除goods，局部刷新
        // A[B^=C]匹配A标签且拥有B属性且属性值以C开头
        $("button[id^='deleteOneGoods_']").bind("click", function () {
            var id = $(this).attr("id");
            // console.log("id=" + id);
            id = id.replaceAll("deleteOneGoods_", "");
            // console.log("id=" + id);
            // 异步发请求。
            $.ajax({
                type: "GET",
                url: "deleteGoodsAjax.action?id=" + id,
                dataType: "text",
                success: function (text, status) {
                    //text返回查询到得总库存数
                    //console.log("text=" + text + ", id=" + id);
                    //每删除一件goods，重新获取所以goods库存数
                    var spans = " 共：<b>"+text+"</b>件商品";
                    console.log(spans)
                    $("span#goodsCounts").html(spans);
                    // 干什么？？？ 页面局部刷新
                    // 根据ID去查找要删除的<tr>：先fadeOut，然后在删除页面的tr.
                    $("tr#goods_" + id).fadeOut(1000, function () {
                        $("tr#goods_" + id).remove();
                        // 重新编序：找到序号的<td>，然后循环然后重新设置。
                        $("td[id^='index_']").each(function (i) {
                            $(this).html(i+1);
                        });
                    });
                }
            });
        });



    })
</script>