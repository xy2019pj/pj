<%--
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
    <title>注册</title>

    <meta charset="utf-8">

    <!-- Bootstrap -->
    <link href="./js/bootstrap.min.js" rel="stylesheet">
    <link href="./css/bootstrap.min.css" rel="stylesheet">

    <!-- 自定义的格式css -->
    <link href="css/mycover.css" rel="stylesheet">
    <link href="css/signup.css" rel="stylesheet">

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
        </button> <a class="navbar-brand" href="#">博物馆logo</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li >
                <a href="#">首页</a>
            </li>
            <li>
                <a href="show.jsp">所有展品</a>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" href="#" data-toggle="dropdown">展品分类<strong class="caret"></strong></a>
                <!--下拉展品分类菜单-->
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">工艺</a>
                    </li>
                    <li>
                        <a href="#">金石</a>
                    </li>
                    <li>
                        <a href="#">书画</a>
                    </li>
                    <li>
                        <a href="#">陶瓷</a>
                    </li>
                    <li>
                        <a href="#">其他</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#">考虑是否拓展朝代分类方式</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#">考虑是否拓展其他分类方式</a>
                    </li>
                </ul>
            </li>
        </ul>
        <!--搜索-->
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input class="form-control" type="text" />
            </div> <button class="btn btn-default" type="submit">搜索</button>
        </form>
        <!--右侧用户操作-->
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" href="#" data-toggle="dropdown">个人中心<strong class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">登录</a>
                    </li>
                    <li>
                        <a href="#">注册</a>
                    </li>
                </ul>
            </li>
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
<!--注册表单-->
<div class="container ">
    <div class="row clearfix ">
        <div class="col-md-12 column mybody">
            <br>
            <h3 style="text-align: center">注册新用户</h3>
            <form class="form-horizontal " role="form">
                <br>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="inputUserName">用户名</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="inputUserName" type="text" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="inputPassword">密码</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="inputPassword" type="password" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="inputEmail3">邮箱</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="inputEmail3" type="email" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="inputMessage">签名</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="inputMessage" type="text" />
                    </div>
                </div>
                <div class="form-group" style="text-align: center">
                    <div class="col-sm-offset-1 col-sm-10">
                        <button class="btn btn-default" type="submit">注册</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>