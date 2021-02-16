
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.test.pojo.TradeItemsResult" %>
<%@ page import="java.util.List" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="<%=path%>/bootstrap/js/jquery.min.js"></script>
    <script src="<%=path%>/bootstrap/js/bootstrap.js"></script>

    <title>详细信息</title>
</head>
<body>
<div class="container " id="Trade_details_table">
    <table class="table table-hover table-bordered table-striped" style="text-align: center">
        <thead>
        <tr>
            <th >序号</th>
            <th >订单id</th>
            <th >商品id</th>
            <th >商品名</th>
            <th >商品图样</th>
            <th >商品价格</th>
            <th>商品数量</th>
            <th>价格小计</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<TradeItemsResult> results = (List<TradeItemsResult>) session.getAttribute("TradeItemsResults");
            //System.out.println("xxxxxxxxxxxxx"+results);
            if (results != null){
                for (int i = 0; i < results.size(); i++) {
                    TradeItemsResult itemsResult = results.get(i);%>

        <tr>
            <td><%=i+1%></td>
            <td><%=itemsResult.getTrade_id()%></td>
            <td><%=itemsResult.getGoods_id()%></td>
            <td><%=itemsResult.getGoods_name()%></td>
            <td>
                <img src="<%=itemsResult.getImg_url()%>" style="width: 50px;height: 50px;">
            </td>
            <td><%=itemsResult.getPrice()%></td>
            <td><%=itemsResult.getNum()%></td>
            <td><%=itemsResult.getCount()%></td>
        </tr>

        <%       }
        } else {  %>
        <tr>
            <td colspan="9">没有数据！</td>
        </tr>

        <%   }  %>
        <tr>
            <td colspan="8">
                <button class="btn btn-default" id="return_trade_table" >返回</button>
            </td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>
<script>
    $(function () {
        //返回按钮点击，返回上一页
        $("#return_trade_table").on("click",function () {
            //window.parent.location.href= "index-1.jsp";
            history.go(-1);
        });
    })
</script>