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
            <li class="active">
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
<!--幻灯片 热门作品-->
<div class="row clearfix">
    <div class="col-md-12 column">
        <div class="carousel slide" id="carousel-368079">
            <ol class="carousel-indicators">
                <li class="active" data-target="#carousel-368079" data-slide-to="0">
                </li>
                <li data-target="#carousel-368079" data-slide-to="1">
                </li>
                <li data-target="#carousel-368079" data-slide-to="2">
                </li>
            </ol>
            <div class="carousel-inner">
                <!--图片1-->
                <div class="item active ">
                    <a href="#"><img alt="图片无法显示" src="images/1.jpg" align="center" /></a>
                    <div class="carousel-caption">
                        <h4>
                            第一件热门展品名称
                        </h4>
                        <p>
                            第一件热门展品的描述详情，第一件热门展品的描述详情，第一件热门展品的描述详情，第一件热门展品的描述详情，第一件热门展品的描述详情，第一件热门展品的描述详情
                        </p>
                    </div>
                </div>
                <!--图片2-->
                <div class="item">
                    <a href="#"><img alt="图片无法显示" src="images/2.jpg" align="center" /></a>
                    <div class="carousel-caption">
                        <h4>
                            第二件热门展品名称
                        </h4>
                        <p>
                            第二件热门展品的描述详情，第二件热门展品的描述详情，第二件热门展品的描述详情，第二件热门展品的描述详情，第二件热门展品的描述详情，第二件热门展品的描述详情
                        </p>
                    </div>
                </div>
                <!--图片3-->
                <div class="item">
                    <a href="#"><img alt="图片无法显示" src="images/3.jpg" align="center" /></a>
                    <div class="carousel-caption">
                        <h4>
                            第三件热门展品名称
                        </h4>
                        <p>
                            第三件热门展品的描述详情，第三件热门展品的描述详情，第三件热门展品的描述详情，第三件热门展品的描述详情，第三件热门展品的描述详情，第三件热门展品的描述详情
                        </p>
                    </div>
                </div>
            </div> <a class="left carousel-control" href="#carousel-368079" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-368079" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
        </div>
    </div>
</div>
<!--最新展品-->
<div class="container writeColorText bottomThings clearfix">
    <h1>
        最新展品<br>
        ▽<br><br>
    </h1>
    <!--第一行-->
    <div class="row clearfix">
        <!--第一件-->
        <div class="col-md-4 column">
            <div class="imgcontrol">
                <img src="images/1.jpg" align="center">
            </div>
            <h2>
                第一件最新展品
            </h2>
            <p>
                第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。
            </p>
            <p>
                <a class="btn mycolor" href="#" >点击详情 »</a>
            </p>
        </div>
        <!--第二件-->
        <div class="col-md-4 column">
            <div class="imgcontrol">
                <img src="images/2.jpg" align="center">
            </div>
            <h2>
                第二件最新展品
            </h2>
            <p>
                第二件最新展品的各种详情。第二件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。
            </p>
            <p>
                <a class="btn mycolor" href="#">点击详情 »</a>
            </p>
        </div>
        <!--第三件-->
        <div class="col-md-4 column">
            <div class="imgcontrol">
                <img src="images/3.jpg" align="center">
            </div>
            <h2>
                第三件最新展品
            </h2>
            <p>
                第三件最新展品的各种详情。第二件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。
            </p>
            <p>
                <a class="btn mycolor" href="#">点击详情 »</a>
            </p>
        </div>
    </div>
    <br><br>
    <!--第二行-->
    <div class="row clearfix">
        <!--第一件-->
        <div class="col-md-4 column">
            <div class="imgcontrol">
                <img src="images/1.jpg" align="center">
            </div>
            <h2>
                第一件最新展品
            </h2>
            <p>
                第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。
            </p>
            <p>
                <a class="btn mycolor" href="#" >点击详情 »</a>
            </p>
        </div>
        <!--第二件-->
        <div class="col-md-4 column">
            <div class="imgcontrol">
                <img src="images/2.jpg" align="center">
            </div>
            <h2>
                第二件最新展品
            </h2>
            <p>
                第二件最新展品的各种详情。第二件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。
            </p>
            <p>
                <a class="btn mycolor" href="#">点击详情 »</a>
            </p>
        </div>
        <!--第三件-->
        <div class="col-md-4 column">
            <div class="imgcontrol">
                <img src="images/3.jpg" align="center">
            </div>
            <h2>
                第三件最新展品
            </h2>
            <p>
                第三件最新展品的各种详情。第二件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。第一件最新展品的各种详情。
            </p>
            <p>
                <a class="btn mycolor" href="#">点击详情 »</a>
            </p>
        </div>
    </div>

</div>

</body>
</html>
