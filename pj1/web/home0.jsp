<%--
  Created by IntelliJ IDEA.
  User: hexi4
  Date: 2019/7/15
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <title>博物馆首页</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="./js/bootstrap.min.js" rel="stylesheet">
    <link href="./css/bootstrap.min.css" rel="stylesheet">


    <link href="css/cover.css" rel="stylesheet">

       <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="./js/html5shiv.min.js"></script>
    <script src="./js/respond.min.js"></script>
    <![endif]-->

    <style>
        .mycolor{
            color: #165f84;
        }
        .mycolor:hover{
            color: #ffffff;
        }
    </style>

</head>

<body>
<div class="jumbotron jumbotron-fluid " >
    <!--顶层-->
    <div class="row clearfix">
            <!--导航条-->
            <nav class="navbar navbar-default navbar-inverse navbar-static-top navbar-fixed-top" role="navigation" >
                <div class="navbar-header" >
                    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" >
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button> <a class="navbar-brand" href="home0.jsp">博物馆logo</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="#">首页</a>
                        </li>
                        <li>
                            <a href="#">所有展品</a>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" href="#" data-toggle="dropdown">展品分类<strong class="caret"></strong></a>
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
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input class="form-control" type="text" />
                        </div> <button class="btn btn-default" type="submit">搜索</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <!--
                        <li>
                            <a href="#">帮助</a>
                        </li>
                        -->
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
    </div>
<div class="container">
    <!--博物馆-->
    <div class="jumbotron" style=" text-align:center; background:url(/images/1.jpg) " >
        <h1 style="color: #000;">
            某某博物馆
        </h1>
        <p style="color: #000;">
            博物馆详情介绍，藏品1000xx+
        </p>
    </div>

</div>
    <!--下层 幻灯片-->
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
                    <div class="item active">
                        <img alt="图片无法显示" src="images/1.jpg" />
                        <div class="carousel-caption">
                            <h4>
                                First Thumbnail label
                            </h4>
                            <p>
                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                            </p>
                        </div>
                    </div>
                    <!--图片2-->
                    <div class="item">
                        <img alt="图片无法显示" src="images/2.jpg" />
                        <div class="carousel-caption">
                            <h4>
                                Second Thumbnail label
                            </h4>
                            <p>
                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                            </p>
                        </div>
                    </div>
                    <!--图片3-->
                    <div class="item">
                        <img alt="图片无法显示" src="images/3.jpg" />
                        <div class="carousel-caption">
                            <h4>
                                Third Thumbnail label
                            </h4>
                            <p>
                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                            </p>
                        </div>
                    </div>
                </div> <a class="left carousel-control" href="#carousel-368079" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-368079" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
        </div>
    </div>
</div>

<!--中层-->
<div class="container">
<div class="row clearfix">
    <!--小1-->
    <div class="col-md-4 column">
        <h2>
            Heading
        </h2>
        <p>
            Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
        </p>
        <p>
            <a class="btn mycolor" href="#" >View details »</a>
        </p>
    </div>
    <!--小2-->
    <div class="col-md-4 column">
        <h2>
            Heading
        </h2>
        <p>
            Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
        </p>
        <p>
            <a class="btn mycolor" href="#">View details »</a>
        </p>
    </div>
    <!--小3-->
    <div class="col-md-4 column">
        <h2>
            Heading
        </h2>
        <p>
            Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
        </p>
        <p>
            <a class="btn mycolor" href="#">View details »</a>
        </p>
    </div>
</div>
</div>


<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="./styles/jquery-3.4.1.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="./js/bootstrap.min.js"></script>

</body>
</html>
