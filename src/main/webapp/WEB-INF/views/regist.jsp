<%--
  Created by IntelliJ IDEA.
  User: 侯景瀚
  Date: 2018/11/6
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<h1 align="center">欢迎注册</h1>
${pageContext.request.contextPath}
<form id="form1">
    <table border="1" bordercolor="#3333FF" width="25%" align="center" height="10%" cellpadding="5" cellpacing="0">
        <tr>
            <td>用户名：</td>
            <td><input type="text" id="user_name"></td>
        </tr>
        <tr>
            <td>密  码:</td>
            <td><input type="password" id="password1" ></td>
        </tr>
        <tr>
            <td>确认密码:</td>
            <td><input type="password" id="password2"></td>
        </tr>
        <tr>
            <td>邮箱:</td>
            <td><input type="email" id="user_email"></td>
        </tr>
        <tr>
            <td><a type="button" class="button" onclick="sub()" name="注册"></a>/td>
        </tr>

    </table>
</form>
</body>
<script type="text/javascript">
    function sub(){
        $.ajax({
            url:'${pageContext.request.contextPath}/user/regist',
            data:$('form1').serialize(),
            type:'POST',
            dataType:'json',
            success:function(result){
                console.log(result);
                alert("SUCCESS");
            },
            error:function () {
                alert("Fail");
            }
        });
    }
</script>
</html>
