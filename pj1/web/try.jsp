<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: hexi4
  Date: 2019/7/20
  Time: 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>展品搜索</title>

    <meta charset="utf-8">

    <!-- Bootstrap -->
    <link href="./js/bootstrap.min.js" rel="stylesheet">
    <link href="./css/bootstrap.min.css" rel="stylesheet">

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
    <script src="./js/show.js"></script>

    <!-- 自定义的js -->
    <script src="./js/all.js"></script>
    <script src="./js/center.js"></script>
    <!-- 导航栏用户个人中心 -->
    <script>
        var user='${sessionScope.user.username}';
        var userAuth;
        if(user!=""){
            userAuth='${sessionScope.user.auth}';
        }else {
            user=null;
            userAuth=null;
        }
    </script>
    <script src="js/showTry.js"></script>

</head>
<body>

<div class="container writeColorText bottomThings clearfix">
    <div class="row clearfix" id="showGround">
        <div class="col-md-4 column">
            <div class="imgcontrol">
                <img src="./images/1.jpg" align="center">
            </div>
            <h2>name</h2>
            <p>intro</p>
            <a class="btn mycolor" href="#">点击详情 »</a>
        </div>
        <div class="col-md-4 column">
            <div class="imgcontrol">
                <img src="./images/2.jpg" align="center">
            </div>
            <h2>name</h2>
            <p>intro</p>
            <a class="btn mycolor" href="#">点击详情 »</a>
        </div>
        <div class="col-md-4 column">
            <div class="imgcontrol">
                <img src="./images/3.jpg" align="center">
            </div>
            <h2>name</h2>
            <p>intro</p>
            <a class="btn mycolor" href="#">点击详情 »</a>
        </div>
        <div class="col-md-4 column">
            <div class="imgcontrol">
                <img src="./images/4.jpg" align="center">
            </div>
            <h2>name</h2>
            <p>intro</p>
            <a class="btn mycolor" href="#">点击详情 »</a>
        </div>
    </div>
</div>


</body>
</html>