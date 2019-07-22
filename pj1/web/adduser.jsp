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
    <title>创建用户</title>

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

    <!-- 自定义的js -->
    <script src="./js/center.js"></script>

    <!-- 导航栏用户个人中心 -->
    <script>
        var user='${sessionScope.user.name}';
        var userInfo='${sessionScope.user.intro}';
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
        </button> <a class="navbar-brand" href="#">博物馆logo</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li class="active">
                <a href="#">首页</a>
            </li>
            <li>
                <a href="#">所有展品</a>
            </li>
            <!--下拉展品分类菜单-->
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
        <!--搜索-->
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input class="form-control" type="text" />
            </div> <button class="btn btn-default" type="submit">搜索</button>
        </form>
        <!--右侧用户操作-->
        <ul class="nav navbar-nav navbar-right">
            <!--管理栏-->
            <li class="dropdown">
                <a class="dropdown-toggle" href="#" data-toggle="dropdown">管理中心<strong class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">人员管理</a>
                    </li>
                    <li>
                        <a href="#">创建用户</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#">作品管理</a>
                    </li>
                    <li>
                        <a href="#">上传作品</a>
                    </li>
                </ul>
            </li>
            <!--用户栏-->
            <li class="dropdown">
                <a class="dropdown-toggle" href="#" data-toggle="dropdown">个人中心<strong class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">个人首页</a>
                    </li>
                    <li>
                        <a href="#">收藏夹</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#">退出登录</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>

</nav>
<!--大字报-->
<div class="jumbotron" style=" text-align:center; background:url(images/museum.jpg) " >
    <h1 style="color: #000000;" id="userNameShow">
        <script>
            name(user,userInfo)
        </script>
        用户名
    </h1>
    <p style="color: #000000;" id="userSignNS">
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
                <li><a href="#" class="active">创建用户</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li class="notActive"><a href="">作品管理</a></li>
                <li class="notActive"><a href="">上传作品</a></li>
            </ul>



        </div>

        <!--右侧-->
        <div class="col-sm-9 right">
            <br><br>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="row clearfix">
                        <div class="col-md-3 column">
                        </div>
                        <!--表单-->
                        <div class="col-md-6 column">
                            <form class="form-horizontal" role="form">
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
                                <div class="form-group">
                                    <div class="checkbox" style="text-align: center">
                                        <label><input type="checkbox" />赋予新用户管理员权限</label>
                                        <br>
                                    </div>
                                </div>
                                <div class="form-group" style="text-align: center">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <button class="btn btn-default" type="submit">创建用户</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-3 column">
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </div>
</div>

</body>
</html>
