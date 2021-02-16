<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.test.pojo.Pagination" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.pojo.Trade" %>
<%@ page import="com.test.service.TradeService" %>
<%@ page import="com.test.pojo.TradeItemsResult" %>
<%
    String path = request.getContextPath();
    Pagination pag = (Pagination) session.getAttribute("pagination_t");
    List<Trade> tradeList = (List<Trade>) pag.getResult();


//    System.out.println("pagina.getCounts()="+pagina.getCounts());
//    System.out.println("pageSize="+pageSize);
//    System.out.println("usersList="+usersList.size());
%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <%--    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />--%>
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
    <%--    <script src="assets/js/bootstrap.min.js"></script>--%>
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

    <link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="<%=path%>/bootstrap/js/jquery.min.js"></script>
    <script src="<%=path%>/bootstrap/js/bootstrap.js"></script>
    <script src="js/downTrade.js"></script>
    <title>交易列表</title>
</head>
<body>
<div class="container">
     <div class="border ">
       <span class="l_f">
           <a href="home.jsp" title="返回主页" class="btn btn-success "><i class="icon-home"></i>返回主页</a>
        <input type="hidden" name="displayPageNo" id="displayPageNo" value="<%=pag.getPageNo()%>"/>
        <select id="sizeSelect" class="btn btn-info" style="height: 35px;width: 110px">
            <option value="5" <%=pag.getPageSize() == 5 ? "selected" : "" %>>每页5条</option>
            <option value="10" <%=pag.getPageSize() == 10 ? "selected" : "" %>>每页10条</option>
             <option value="15" <%=pag.getPageSize() == 15 ? "selected" : "" %>>每页15条</option>
            <option value="20" <%=pag.getPageSize() == 20 ? "selected" : "" %>>每页20条</option>
            <option value="50" <%=pag.getPageSize() == 50 ? "selected" : "" %>>每页50条</option>
            <option value="100" <%=pag.getPageSize() == 100 ? "selected" : "" %>>每页100条</option>
        </select>

       </span>

         <span style="float: right">
              <button id="download" class="btn btn-primary">下载交易信息</button>
         </span>
       <span class="r_f" id="tradeCounts">
           共：<b><%= pag.getCounts()%></b>个交易
       </span>
     </div>
     <!--交易列表展示-->
     <div >
        <table class="table table-striped table-bordered table-hover" id="Trade_list_table" >
            <thead>
                <tr>
                    <th ><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                    <th >序号</th>
                    <th >订单id</th>
                    <th >用户id</th>
                    <th >交易总额</th>
                    <th >交易时间</th>
                    <th >交易状态</th>
                    <th>详细信息</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (tradeList != null){
                        for (int i = 0; i < tradeList.size(); i++) {
                            Trade trade = tradeList.get(i);
                %>
                <tr id="users_<%=trade.getTrade_id()%>">
                    <td>
                        <label><input type="checkbox" class="ace"><span class="lbl" ></span></label>
                    </td>
                    <td id="index_<%=trade.getTrade_id()%>">
                        <%=pag.getPageNo()*pag.getPageSize() + (i + 1)%>
                    </td>
                    <td>
                        <%=trade.getTrade_id()%>
                    </td>
                    <td>
                        <%=trade.getUser_id()%>
                    </td>
                    <td>
                        <%=trade.getMoney()%>
                    </td>
                    <td>
                        <%=trade.getTrade_time()%>
                    </td>
                    <td>
                        <%
                            TradeService tradeService = new TradeService();
                            String sign=tradeService.getStateById(trade.getState_id()).getSign();
                            if (sign.equals("已付款")){
                        %>
                        <span style="color: #00B83F"><%=sign%></span>
                        <%
                            } else if (sign.equals("未付款")){
                        %>
                        <span style="color: #c12e2a;"><%=sign%></span>
                        <%
                            } else if (sign.equals("已发货")){
                        %>
                        <span style="color: #218bee"><%=sign%></span>
                        <%
                            }else {
                        %>
                        <span style="color: #6b828e"><%=sign%></span>
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <a href="TradeItemsResult.action?trade_id=<%=trade.getTrade_id()%>">
                            <button id="TradeSearch_<%=trade.getTrade_id()%>" title="查询"  class="btn btn-xs btn-info" ><i class="icon-search bigger-120"></i>
                            </button>
                        </a>
                        <%--<a href="TradeItemsResult.action?trade_id=<%=trade.getTrade_id()%>"><input type="button" value="" id="TradeSearch_xx" title="查询" class="btn btn-xs btn-info"/><i class ="icon-search bigger-120"></i></a>--%>
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
                    <td align="center" colspan="8" >

                        <span>
                         <button class="btn btn-default"><b><%=pag.getPageNo() + 1 %></b>/<%=pag.getPages() %></button>
                            <% if(pag.getFirstPage()) { %>
                                <button class="btn btn-default">首页</button> <button class="btn btn-default"> 上一页</button>
                            <% } else { %>
                                <button class="btn btn-info" style="height: 35px"><a href="tradePage.action?pageNo=0&pageSize=<%=pag.getPageSize() %>">首页</a></button>
                                <button class="btn btn-info" style="height: 35px"><a href="tradePage.action?pageNo=<%=pag.getPageNo()-1 %>&pageSize=<%=pag.getPageSize() %>">上一页</a></button>
                            <% } %>
                        </span>
                        <span>
                            <% if(pag.getLastPage()) { %>
                                <button class="btn btn-default">下一页</button> <button class="btn btn-default"> 尾页</button>
                            <% } else { %>
                                <button class="btn btn-info" style="height: 35px"><a href="tradePage.action?pageNo=<%=pag.getPageNo()+1 %>&pageSize=<%=pag.getPageSize() %>">下一页</a></button>
                                <button class="btn btn-info" style="height: 35px"><a href="tradePage.action?pageNo=<%=pag.getPages()-1 %>&pageSize=<%=pag.getPageSize() %>">尾页</a></button>
                            <% } %>
                        </span>
                        <span>
                             <%--<button id="btnJump1" class="btn btn-default" style="width: 70px;height: 28px;" ></button>--%>
                            <input type="number" id="jump" name="jump" value="" style="width:70px;margin-left :0px; float: right;height: 35px" size="5" maxlength="5" placeholder="第几页"  />
                            <input type="button" id="btnJump" class="btn btn-info" value="跳转至" style="float: right;margin-right: 0px;width: 65px;height: 35px;"/>
                                 <!-- 使用隐藏域保存页大小。 -->
                            <input type="hidden" name="pageSize" id="pageSize" value="<%=pag.getPageSize()%>" />
                        </span>
                    </td>
                </tr>
            </tbody>
        </table>
     </div>
</div>


<!-- 下载的：模式对话框  -->
<div id="myDownload" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLabel">
    <div class="modal-dialog" role="document" style="width:800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myDownloadLabel">下载交易信息向导</h4>
            </div>
            <div class="modal-body">
                <div class="container text-left">
                    <button id="downloadBtn" class="btn btn-primary">下载</button>
                    <!-- 完成下载-->
                    <a id="downloadA" target="_blank" href="" style="display: none" title="点击下载">
                        <span class="glyphicon glyphicon-cloud-download"></span>
                    </a>
                </div>

                <!-- 提示框 -->
                <div id="myAlert3" class="alert alert-danger" role="alert" style="margin-top:10px;">
                    <a href="#" class="close" data-dismiss="alert">×</a> <span><b>温馨提示：</b></span>
                    <br />
                    <p>通过ajax的异步技术，完成学生信息的下载！</p>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<script>
    //


    $(function () {

        <%--页面跳转--%>
        $("#btnJump").bind("click", function () {
            var no = $("#jump").val();
            no = no - 1;
            var pageSize = $("#pageSize").val();
            // 往后发送请求。
            var url = "tradePage.action?pageNo=" + no + "&pageSize=" + pageSize;
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
            var url = "tradePage.action?pageNo=" + pageNo + "&pageSize=" + pageSize;
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
    })
</script>