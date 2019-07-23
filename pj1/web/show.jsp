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
    <script>
        $.ajax({
            url: "home",
            type: "get",
            success: function (res) {
                items =JSON.parse(res);
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
        <ul class="nav navbar-nav">
            <li class="active">
                <a href="home">首页</a>
            </li>
            <li>
                <a href="show?category=全部"  >所有展品</a>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" href="" data-toggle="dropdown">展品分类<strong class="caret"></strong></a>
                <!--下拉展品分类菜单-->
                <ul class="dropdown-menu">
                    <li>
                        <a href="show?category=工艺">工艺</a>
                    </li>
                    <li>
                        <a href="show?category=金石">金石</a>
                    </li>
                    <li>
                        <a href="show?category=书画">书画</a>
                    </li>
                    <li>
                        <a href="show?category=陶瓷">陶瓷</a>
                    </li>
                    <li>
                        <a href="show?category=其他">其他</a>
                    </li>
                </ul>
            </li>
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
<!--大字报-->
<div class="jumbotron" style=" text-align:center; background:url(images/museum.jpg) ; margin-bottom:0" >
    <h1 style="color: #000000;">
        所有展品/某某类展品
    </h1>
</div>
<!--搜索表单-->
<div class="container ">
    <div class="row clearfix">
        <div class="col-md-12 column"  style="text-align:center">
            <form class="navbar-form" role="search">
                <div class="form-group">
                    <input class="form-control" type="text" />
                </div> <button class="btn btn-default" type="submit">搜索</button>
            </form>
        </div>
    </div>
</div>
<!--分页待解决-->
<div class="container writeColorText bottomThings clearfix">
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

<br><br><br>
<div class="container " style="text-align:center" >
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>


</body>
</html>