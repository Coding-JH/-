<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>电力设备-电力通信的“全科医生”</title>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript"
            src="/static/js/jquery-1.12.4.min.js"></script>
    <script
            src="/static/js/bootstrap.min.js"></script>
  <link href="/static/css/init.css" rel="stylesheet">
  <link href="/static/css/bootstrap.min.css" rel="stylesheet">
  <link href="/static/Font-Awesome-3.2.1/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet"/>
  <!-- 导航和底部样式-->
  <link href="/static/css/headerAndFooter.css" rel="stylesheet">
  <!-- 此页面的样式-->
  <link href="/static/css/equipmentList.css" rel="stylesheet">
</head>
<body>
<!--导航-->
<header>
    <nav class="header">
        <img class="logo" src="<%=request.getContextPath()%>/images/homePage-logo.png" />
        <!--logo-->
        <a class="items" href="<%=request.getContextPath()%>/user/next">首页</a>
        <a class="items" href="<%=request.getContextPath()%>/sensor/equipmentExplore">数据分析</a>
        <a class="items" href="<%=request.getContextPath()%>/sensor/hardwaresShow">设备展示</a>
        <a class="items" href="<%=request.getContextPath()%>/user/userHelp">用户手册</a>

        <div class="unlogin">
            <a id="registerBtn" href="<%=request.getContextPath()%>/user/regist">注册</a>
            <a id="loginBtn" href="<%=request.getContextPath()%>/user/login">登录</a>
        </div>

        <div class="logined">
            <a class="developerBtn" href="<%=request.getContextPath()%>/equipmentList" style="right:200px">我的设备</a>
            <a class="developerBtn" href="<%=request.getContextPath()%>/userManage">开发者中心</a>
            <a class="icon-bell bell" href="<%=request.getContextPath()%>/newMessage"></a>
            <a class="icon-user user" href="<%=request.getContextPath()%>/userDocument"></a>
        </div>
    </nav>
</header>
<!--主要内容-->
  <div class="main">
    <div class="mainShow">
    </div>
    <!-- 设备列表-->
    <div class="row showEveryEquipment">
        <p style="text-align: center;margin:0 auto;">加载中，请稍后</p>
    </div>
    <!-- 每一个设备-->
    <script id="showEveryEquipment" type="text/jsrender">
     </script>
  </div>
<%-------------------------------------------------------------------------------------%>

<!-- 搭建显示页面 -->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>111111</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>

</div>
<script type="text/javascript">

    var totalRecord,currentPage;
    //1、页面加载完成以后，直接去发送ajax请求,要到分页数据
    window.onload=function () {
        to_page(1);
        alert("440")
    };
    $(function(){
        $("body").html("0ee0");

        //去首页
        to_page(1);
    });

    function to_page(pn){
        $.ajax({
            url:"${APP_PATH}/sensor/list",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                alert(result.pageInfo.pages);
                console.log(result);
                //1、解析并显示员工数据
                build_emps_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    function build_emps_table(result){
        //清空table表格
        $("#emps_table tbody").empty();
        var sensorList = result.extend.pageInfo.list;
        $.each(sensorList,function(index,sensor){
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd = $("<td></td>").append(sensor.id);
            var empNameTd = $("<td></td>").append(sensor.empName);
            var genderTd = $("<td></td>").append(sensor.gender=='M'?"男":"女");
            var emailTd = $("<td></td>").append(sensor.email);
            var deptNameTd = $("<td></td>").append(sensor.department.deptName);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-id",item.empId);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }
    //解析显示分页信息
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.pageInfo.pageNum+"页,总"+
            result.pageInfo.pages+"页,总"+
            result.pageInfo.total+"条记录");
        totalRecord = result.pageInfo.total;
        currentPage = result.pageInfo.pageNum;
    }
    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }



        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }



        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
</script>

  <!--分页 -->
  <div class="page">
    <div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
  </div>
  <!--底部-->
  <footer class="footer">
    <div class="link">
      <h2>友情链接</h2>
      <a href="http://iot.10086.cn/cn/">中移物联网</a>
      <a href="http://iot.10086.cn/cn/corp/priv-net">物联网专网</a>
      <a href="https://www.oschina.net/">开源中国</a>
      <a href="http://bbs.elecfans.com/">电子发烧友</a>
    </div>
    <div class="app">
      <h2>APP下载</h2>
      <img src="../images/homePage-2DCode.png" style="width: 150px; height: 150px"/>
    </div>
    <div class="contact">
      <h2>联系方式</h2>
      <a href="javascript: return false;">电话：029-88166000</a>
      <a href="javascript: return false;">传真：029-88166000</a>
      <a href="javascript: return false;">QQ：1234567890</a>
      <a href="javascript: return false;">WeChat: xingongshiyanshi</a>
      <a href="javascript: return false;">邮箱：1234567890@qq.com</a>
      <a href="javascript: return false;">地址：陕西省西安市长安区西安邮电大学信工实验室</a>
    </div>
  </footer>
<%--<script src="../js/jquery.min.js"></script>--%>
<%--<script src="../js/bootstrap.min.js"></script>--%>
<%--<!--使用json数据动态生成结构 ，，html模板引擎-->--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jsrender/0.9.90/jsrender.js"></script>--%>
<%--<!--jqPaginator jquery分页插件-->--%>
<%--<script src="../js/jqPaginator.js"></script>--%>
<%--<script src="../common.js"></script>--%>
<%--<script>--%>
  <%--$(function(){--%>
<%--//    userId = '4657c0733c5048a79e7555574a1dc564';--%>
    <%--var userId = getCookie("userId");--%>
    <%--if(userId){--%>
      <%--$('.logined').css('display','inline-block');--%>
      <%--$('.unlogin').css('display','none');--%>
    <%--}else{--%>
      <%--$('.unlogin').css('display','inline-block');--%>
      <%--$('.logined').css('display','none');--%>
    <%--}--%>

    <%--var params = {};--%>
    <%--params.userId = userId;--%>
    <%--params.pageNo = 1 || pageIndex;--%>
    <%--$.post(ip+'/equipment/find',params,function(json){--%>
        <%--if(json.type === "COMMON_SUC"){--%>
          <%--var equipment = json.data;--%>
          <%--var template1 = $.templates("#showEveryEquipment");--%>
          <%--var htmlOutput1 = template1.render(equipment);--%>
          <%--$(".showEveryEquipment").html(htmlOutput1);--%>

          <%--// 创建分页--%>
          <%--//将num值传给后台--%>
          <%--$("#Pagination").jqPaginator({--%>
            <%--totalPages: equipment.pageNum,--%>
            <%--visiblePages: 5,--%>
            <%--currentPage: 1,--%>
            <%--onPageChange: function (num, type) {--%>
              <%--pageIndex = num;--%>
              <%--return pageIndex;--%>
            <%--},--%>
            <%--first: '<li class="first"><a href="javascript:void(0);">首页<\/a><\/li>',--%>
            <%--prev: '<li class="prev"><a href="javascript:void(0);"><i class="arrow arrow2"><\/i>上一页<\/a><\/li>',--%>
            <%--next: '<li class="next"><a href="javascript:void(0);">下一页<i class="arrow arrow3"><\/i><\/a><\/li>',--%>
            <%--last: '<li class="last"><a href="javascript:void(0);">末页<\/a><\/li>',--%>
            <%--page: '<li class="page"><a href="javascript:void(0);">{{page}}<\/a><\/li>'--%>
          <%--});--%>

        <%--}else if(json.type === "Equipment_REQ_ERROR"){--%>
          <%--alert("设备请求参数错误！")--%>
        <%--}else if(json.type === "Equipment_FIND_ERROR"){--%>
          <%--alert("设备信息查询失败！")--%>
        <%--}--%>
    <%--},'json').fail(function(json){--%>
      <%--alert("请求失败，请稍后再试")--%>
    <%--});--%>
  <%--});--%>
<%--</script>--%>
</body>
</html>