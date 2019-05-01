<%--
  Created by IntelliJ IDEA.
  User: 侯景瀚
  Date: 2019/4/27
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2><%=basePath%></h2>
<a href="<%=basePath%>/admin/outLogin.do"/>退出登录
系统时间：<%=nowDate%>
</body>
</html>
