<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Item" %><%--
  Created by IntelliJ IDEA.
  User: hexi4
  Date: 2019/7/20
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>博物馆首页</title>

    <meta charset="utf-8">

    <!-- Bootstrap -->
    <link href="./js/bootstrap.min.js" rel="stylesheet">
    <link href="./css/bootstrap.min.css" rel="stylesheet">

    <!-- 自定义的格式css -->
    <link href="css/mycover.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="./js/html5shiv.min.js"></script>
    <script src="./js/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="./styles/jquery-3.4.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="./js/bootstrap.min.js"></script>

    <!-- 自定义的js -->
    <script src="./js/home.js"></script>
    <script src="./js/all.js"></script>

    <%
        ArrayList<Item> hotItems=(ArrayList<Item>)request.getAttribute("hotItems");
        ArrayList<Item> recentItems=(ArrayList<Item>)request.getAttribute("recentItems");
    %>
    <script>
        <!-- 导航栏用户个人中心 -->
        var user='${sessionScope.user.username}';
        var userAuth;
        if(user!=""){
            userAuth='${sessionScope.user.auth}';
        }else {
            user=null;
            userAuth=null;
        }
        <!-- ajax请求热门、最新商品数据-->
        var hotItems=new Array();
        var recentItems=new Array();
        $.ajax({
            url: "home",
            type: "POST",
            success: function (res) {
                console.log("success!");
                hotItems =JSON.parse(res)[0];
                recentItems = JSON.parse(res)[1];
                hotItem(hotItems);
                newItem(1,recentItems);
                newItem(2,recentItems);
            },
            error:function () {
                window.alert("????");
            }
        });
    </script>
</head>
<body>

<!--导航条-->
<nav class="navbar navbar-default navbar-inverse navbar-static-top" role="navigation"  style="margin-bottom:0">
    <div class="navbar-header" >
        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" >
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button> <a class="navbar-brand" >博物馆logo</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav" id="location">
            <script>nowLocation(1)</script>
        </ul>
        <!--搜索-->
        <form class="navbar-form navbar-left" role="search" action="show">
            <div class="form-group">
                <input class="form-control" type="text" name="search"/>
            </div> <button class="btn btn-default" type="submit">搜索</button>
        </form>
        <!--右侧用户操作-->
        <ul class="nav navbar-nav navbar-right" id="userManage">
            <script>myFunction(user,userAuth)</script>
        </ul>
    </div>
</nav>

<!--博物馆大字报-->
<div class="jumbotron" style=" text-align:center; background:url(images/museum.jpg) " >
    <h1 style="color: #000000;">
        九州博物馆
    </h1>
    <p style="color: #000000;">
        博物馆详情介绍，藏品1000xx+
    </p>
</div>
<!--幻灯片 热门作品-->
<div id="hotItems">
</div>

<!--最新展品-->
<div class="container writeColorText bottomThings clearfix">
    <h1>
        最新展品<br>
        ▽<br><br>
    </h1>
    <!--第一行-->
    <div class="row clearfix" id="newItems1">
    </div>
    <br><br>
    <!--第二行-->
    <div class="row clearfix" id="newItems2">
    </div>

</div>
<script>
    var url=window.location.href;
    sessionStorage.setItem("loginBeforeUrl",url);
    console.log(sessionStorage.getItem("loginBeforeUrl"));
</script>
</body>
</html>
