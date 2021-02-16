<%@ page import="com.test.pojo.Province" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.pojo.Province" %>

<%
    // 从application里面获取省份信息
    List<Province> provinces = (List<Province>)application.getAttribute("provinces");
%>

<html>
    <head>
        <title>省-地市-区县的三级级联之使用jQuery实现</title>
        <script type="text/javascript" src="jquery/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="js/cascade.js"></script>
    </head>
    <body>
        <select id="province" name="province">
            <%
                for(Province province : provinces) {
            %>
                <option value="<%=province.getProvinceId()%>"><%=province.getProvinceName()%></option>
            <% } %>
        </select>省
        <select id="city" name="city">

        </select>地市
        <select id="area" name="area">

        </select>区县
    </body>
</html>