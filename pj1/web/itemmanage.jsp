<%--
  Created by IntelliJ IDEA.
  User: hexi4
  Date: 2019/7/20
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>作品管理</title>

    <meta charset="utf-8">

    <!-- Bootstrap -->
    <link href="./js/bootstrap.min.js" rel="stylesheet">
    <link href="./css/bootstrap.min.css" rel="stylesheet">

    <!-- 自定义的格式css -->
    <link href="css/all.css" rel="stylesheet">
    <link href="css/favorite.css" rel="stylesheet">

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
<!--大字报-->
<div class="jumbotron" style=" text-align:center; background:url(images/museum.jpg) " >
    <h1 style="color: #000000;">
        用户名
    </h1>
    <p style="color: #000000;">
        个人简介签名
    </p>
    <!--添加好友按钮
    <div class="row clearfix" style="text-align:center">
        <div class="col-md-12 column addText">
            添加好友 <a class="glyphicon glyphicon-user addForm" href="#" title="点击添加"> </a>
        </div>
    </div>
    -->
</div>
<!--正文-->
<div class="container">
    <div class="row ">
        <!--左侧-->
        <div class="col-sm-3 col-md-2 sidebar">

            <ul class="nav nav-sidebar ">
                <li class="notActive"><a href="#">个人首页</a></li>
                <li class="notActive"><a href="#">修改信息</a></li>
                <li class="notActive"><a href="#">收藏夹</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li class="notActive"><a href="">好友列表</a></li>
                <li class="notActive"><a href="">添加好友</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li class="notActive"><a href="">人员管理</a></li>
                <li class="notActive"><a href="">创建用户</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="#" class="active">作品管理</a></li>
                <li class="notActive"><a href="">上传作品</a></li>
            </ul>



        </div>

        <!--右侧-->
        <div class="col-sm-9 right">
            <br><br>
            <!--第一行-->
            <div class="row placeholders">
                <!--藏品1-->
                <div class="col-xs-6 col-sm-3 placeholder" style="text-align:center">
                    <!--按钮-->
                    <div class="row clearfix" >
                        <div class="col-md-12 column addText" style="text-align:right">
                            <a class="glyphicon glyphicon-pencil addForm" href="#" title="点击修改"> </a>
                            <a class="glyphicon glyphicon-remove addForm" href="#" title="点击删除"> </a>
                        </div>
                    </div>
                    <a href="#"><img width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail" src="images/1.jpg"></a>
                    <h4>展品名称</h4>
                    <span class="text-muted">展品简介</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder" style="text-align:center">
                    <!--按钮-->
                    <div class="row clearfix" >
                        <div class="col-md-12 column addText" style="text-align:right">
                            <a class="glyphicon glyphicon-pencil addForm" href="#" title="点击修改"> </a>
                            <a class="glyphicon glyphicon-remove addForm" href="#" title="点击删除"> </a>
                        </div>
                    </div>
                    <a href="#"><img width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail" src="images/1.jpg"></a>
                    <h4>展品名称</h4>
                    <span class="text-muted">展品简介</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder" style="text-align:center">
                    <!--按钮-->
                    <div class="row clearfix" >
                        <div class="col-md-12 column addText" style="text-align:right">
                            <a class="glyphicon glyphicon-pencil addForm" href="#" title="点击修改"> </a>
                            <a class="glyphicon glyphicon-remove addForm" href="#" title="点击删除"> </a>
                        </div>
                    </div>
                    <a href="#"><img width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail" src="images/1.jpg"></a>
                    <h4>展品名称</h4>
                    <span class="text-muted">展品简介</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder" style="text-align:center">
                    <!--按钮-->
                    <div class="row clearfix" >
                        <div class="col-md-12 column addText" style="text-align:right">
                            <a class="glyphicon glyphicon-pencil addForm" href="#" title="点击修改"> </a>
                            <a class="glyphicon glyphicon-remove addForm" href="#" title="点击删除"> </a>
                        </div>
                    </div>
                    <a href="#"><img width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail" src="images/1.jpg"></a>
                    <h4>展品名称</h4>
                    <span class="text-muted">展品简介</span>
                </div>
            </div>
            <br> <br>
            <!--第二行-->
            <div class="row placeholders">
                <!--藏品1-->
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==">
                    <h4>Label</h4>
                    <span class="text-muted">Something else</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==">
                    <h4>Label</h4>
                    <span class="text-muted">Something else</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==">
                    <h4>Label</h4>
                    <span class="text-muted">Something else</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==">
                    <h4>Label</h4>
                    <span class="text-muted">Something else</span>
                </div>
            </div>


        </div>


    </div>
</div>

</body>
</html>
