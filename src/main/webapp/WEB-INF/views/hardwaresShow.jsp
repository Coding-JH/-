<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>硬件展示-电力通信的“全科医生”</title>
  <link href="/static/css/init.css" rel="stylesheet">
  <link href="/static/css/bootstrap.min.css" rel="stylesheet">
  <link href="/static/Font-Awesome-3.2.1/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet"/>
  <!-- 导航和底部样式-->
  <link href="/static/css/headerAndFooter.css" rel="stylesheet">
  <style>
    .main{
      width:80%;
      margin:0 auto;
      margin-top: 50px;
    }
    .main .mainShow{
      margin-bottom: 30px;
    }
    .thumbnail:hover{
      border-color: #2A9F96;
    }
    .thumbnail .intro{
      overflow:hidden;
      white-space:nowrap;
      text-overflow:ellipsis;
    }
    .row{
      display: flex;
      flex-wrap: wrap;
    }
    .row .imgHere{width:242px;height:200px;}
    .row .imgHere img{width:238px;height:200px;}
    .row .btn-color{
      background-color: #2A9F96;
      color: #fff;
    }
    .page{
      width:100%;
      height:40px;
      position: relative;
      margin-top: 50px;
    }
    .page .pagination{
      position: absolute;
      width:300px;
      margin: 0 auto;
      left:0;
      right:0;
    }
    .page .pagination li a{
      color:#2A9F96;
    }
    .page .pagination .active a{
      background-color: #2A9F96;
    }
    .pagination .active a:link{
      color:#fff;
    }
  </style>
  <script src="/static/js/jquery.min.js"></script>
  <script src="/static/js/bootstrap.min.js"></script>
  <!--jqPaginator jquery分页插件-->
  <script src="/static/js/jqPaginator.js"></script>
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
        <span class="glyphicon glyphicon-stop" aria-hidden="true"></span>
        <span>硬件设备展示</span>
      </div>
      <div class="row">
          <table border='1' width='98%' cellpadding='3' cellspacing='0'>
              <tr height='45'bgcolor="#dfdfdf">
                  <td >设备名称</td>
                  <td>传感器名称</td>
                  <td>最新数据</td>
                  <td>创建时间</td>
                  <td>类型</td>
                  <td>操作</td>
              </tr>
              <c:forEach items="${hardList}" var="sensor">
                  <tr height='35'>
                      <td>智能机房巡检系统</td>
                      <td>${sensor.name}</td>
                      <td class="ddt"></td>
                      <td>${sensor.created}</td>
                      <td>${sensor.type}</td>
                      <td><a href=""/>删除|编辑</td>
                  </tr>
              </c:forEach>
          </table>

      </div>
    </div>





<!--分页-->
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
        <img src="/images/homePage-2DCode.png" style="width: 150px; height: 150px"/>
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
<script src="../common.js"></script>
<script>
  var userId = getCookie("userId");
  if(userId){
    $('.logined').css('display','inline-block');
    $('.unlogin').css('display','none');
  }else{
    $('.unlogin').css('display','inline-block');
    $('.logined').css('display','none');
  }
  var hardwares = {
    "hardwaresList": [
      {
        "name":"STM32",
        "id":"H001",
        "imgUrl":"../images/STM32.png",
        "intro":"微处理器选用STM32F103，STM32F103使用高性能的ARMCortex-M3 32位内核，内部有高速存储器，有很多引脚，包括多个I/O引脚和12位ADC转换引脚，有三个通用的定时器和一个PWM定时器，还包括多种标准的通信接口."
      },
      {
        "name":"温湿度传感器",
        "id":"H002",
        "imgUrl":"../images/DHT11.png",
        "intro":"DHT11数字温湿度传感器，可以进行温度和湿度的检测，并且对输出的数字信号进行了校准。检测湿度部分是通过电阻式感湿元件来进行检测，温度是通过NTC 测温元件进行检测。由于两个元件和8位单片机连接，正因为如此该模块有着快速的响应、优秀的抗干扰能力、性价高等特点"
      },
      {
        "name":"电流传感器",
        "id":"H003",
        "imgUrl":"../images/ASC712.png",
        "intro":"该传感器原理使用的是霍尔感应，该传感器具有高精确度的线性霍尔元件。通过将电流转化的成比例电压的磁场靠近霍尔元件，霍尔元件进行感应，从而测得电流大小，通过采用霍尔感应的原理实现了器件的精确度"
      },
      {
        "name":"电压传感器",
        "id":"H004",
        "imgUrl":"../images/dianya.png",
        "intro":"该传感器是基于电阻分压原理设计，基于这种设计可以使输入的电压减小5倍"
      },
      {
        "name":"液位传感器",
        "id":"H005",
        "imgUrl":"../images/yewei.png",
        "intro":"该传感器是通过裸露在外面的多条平行导线测量，根据浸没导线的多少，从而判断水位的高低，这是一款原理简单、易用、性价高的传感器"
      },
      {
        "name":"WIFI模块",
        "id":"H006",
        "imgUrl":"../images/wifi.png",
        "intro":"WIFI作为一种网络传输标准。相较于传统使用线路来进行通信连接和网络传输的方式，这种方式的优点是使用方便，节约成本等特点，这样可以灵活的添加或者减少网络设备。和蓝牙相比的话，WIFI的辐射范围更广、数据传输速度更高。本设计WIFI模块选用ESP8266，是一款集成度高，性能优越，低功耗的WIFI模块"
      }
    ]
  };
    $(function(){
      var showlist = everyHardware(hardwares.hardwaresList);
      for(var i=0;i<hardwares.hardwaresList.length;i++){
        $(".row").append(showlist[i]);
      }

      // 创建分页
      //将num值传给后台
      $("#Pagination").jqPaginator( {
        totalPages: 1,
        visiblePages: 5,
        currentPage: 1,
        onPageChange: function (num, type) {
          //alert(num);
        },
        first: '<li class="first"><a href="javascript:void(0);">首页<\/a><\/li>',
        prev: '<li class="prev"><a href="javascript:void(0);"><i class="arrow arrow2"><\/i>上一页<\/a><\/li>',
        next: '<li class="next"><a href="javascript:void(0);">下一页<i class="arrow arrow3"><\/i><\/a><\/li>',
        last: '<li class="last"><a href="javascript:void(0);">末页<\/a><\/li>',
        page: '<li class="page"><a href="javascript:void(0);">{{page}}<\/a><\/li>'
      });
    });

    function everyHardware(data){
      var list=[];
      for(var i=0;i<data.length;i++){
         list[i]='<div class="col-sm-6 col-md-3">'
         +'<div class="thumbnail">'
         +'<div class="imgHere">'
         +'<img src="'+data[i].imgUrl+'" alt="...">'+'</div>'
         +'<div class="caption">'
         +'<h3>'+data[i].name+'</h3>'
         +'<p class="intro">'+data[i].intro+'</p>'
         +'<p>'+'<button type="button" class="btn btn-color" data-toggle="modal" data-target="#'+data[i].id+'">'
         +"了解详情"+"</button>"
         +'<div class="modal fade" tabindex="-1" role="dialog" id="'+data[i].id+'" aria-labelledby="'+data[i].id+"label"+'">'
         +'<div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header">'
         +'<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">'
         +"&times;"+'</span></button>'+'<h4 class="modal-title" id="'+data[i].id+"label"+'">'+data[i].name+'</h4></div>'
         +'<div class="modal-body">'+data[i].intro+'</div></div></div></div></p></div></div></div>';
      }
      return list;
    }
</script>
</body>
</html>