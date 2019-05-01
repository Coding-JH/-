<%--
  Created by IntelliJ IDEA.
  User: 侯景瀚
  Date: 2018/11/6
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<h1 align="center">欢迎登录</h1>
<form id="form1">
    <table border="1" bordercolor="#3333FF" width="25%" align="center" height="10%" cellpadding="5" cellpacing="0">
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="username" >${msg_username}</td>
        </tr>
        <tr>
            <td>密  码:</td>
            <td><input type="password" >${msg_password}</td>
        </tr>
        <tr>
            <input type="button" value="登录" onclick="sub()"/>&nbsp;<input type="reset" value="重置"></p>
        </tr>
    </table>
</form>
<script type="text/javascript">
    function sub(){
        $.ajax({
            url:'${pageContext.request.contextPath}/user/login',
            data:$('form1').serialize(),
            type:'POST',
            dataType:'json',
            success:function(result){
                console.log(result.getMsg());
                alert("SUCCESS");
            },
            error:function () {
                alert("Fail");
            }
        });
    }
</script>
</body>
</html>
