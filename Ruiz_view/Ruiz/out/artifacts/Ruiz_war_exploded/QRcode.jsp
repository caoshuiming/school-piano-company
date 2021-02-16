<%@page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>首页</title>
        <link rel="stylesheet" href="css/index.css">
        <script type="text/javascript" src="jquery/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="jquery/jquery.qrcode.min.js"></script>
        <script type="text/javascript">
            $(function () {
                // 二维码。
                $("#qrcodeCanvas").qrcode( {
                    render : "canvas",
                    width : 160, // 宽度
                    height : 160, // 高度
                    text : "http://192.168.20.32/Ruiz_war_exploded/phonecheckout.jsp" // 要生成二维码的数据
                });
            })
        </script>
    </head>
    <body>
        <!-- 要生成二维码的地方-->
        <div id="qrcodeCanvas" style="width: 100px; height: 100px;"></div>
    </body>
</html>