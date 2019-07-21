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
    <title>人员管理</title>

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
                <li><a href="#" class="active">人员管理</a></li>
                <li class="notActive"><a href="">创建用户</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li class="notActive"><a href="">作品管理</a></li>
                <li class="notActive"><a href="">上传作品</a></li>
            </ul>



        </div>

        <!--右侧-->
        <div class="col-sm-9 right">
            <br>
            <!--表格-->
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <!--表头-->
                    <tr>
                        <th>用户ID</th>
                        <th>用户名</th>
                        <th>邮箱</th>
                        <th>最近登录</th>
                        <th>用户权限</th>
                        <th>更改权限</th>
                        <th>删除用户</th>
                    </tr>
                    </thead>
                    <!--表内容-->
                    <tbody>
                    <tr>
                        <td>1,001</td>
                        <td>Lorem</td>
                        <td>ipsum</td>
                        <td>dolor</td>
                        <td>normal</td>
                        <td>
                            <!--按钮-->
                            <div class="row clearfix" >
                                <div class="col-md-12 column addText">
                                    <a class="glyphicon glyphicon-arrow-up addForm" href="#" title="升级为管理员"> </a>
                                </div>
                            </div>
                        </td>
                        <td><!--按钮-->
                            <div class="row clearfix" >
                                <div class="col-md-12 column addText">
                                    <a class="glyphicon glyphicon-remove addForm" href="#" title="删除用户"> </a>
                                </div>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td>1,002</td>
                        <td>amet</td>
                        <td>consectetur</td>
                        <td>adipiscing</td>
                        <td>admin</td>
                        <td>
                            <!--按钮-->
                            <div class="row clearfix" >
                                <div class="col-md-12 column addText">
                                    <a class="glyphicon glyphicon-arrow-down addForm" href="#" title="降为普通用户"> </a>
                                </div>
                            </div>
                        </td>
                        <td><!--按钮-->
                            <div class="row clearfix" >
                                <div class="col-md-12 column addText">
                                    <a class="glyphicon glyphicon-remove addForm" href="#" title="删除用户"> </a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>1,003</td>
                        <td>Integer</td>
                        <td>nec</td>
                        <td>odio</td>
                        <td>Praesent</td>
                    </tr>
                    <tr>
                        <td>1,003</td>
                        <td>libero</td>
                        <td>Sed</td>
                        <td>cursus</td>
                        <td>ante</td>
                    </tr>
                    <tr>
                        <td>1,004</td>
                        <td>dapibus</td>
                        <td>diam</td>
                        <td>Sed</td>
                        <td>nisi</td>
                    </tr>
                    <tr>
                        <td>1,005</td>
                        <td>Nulla</td>
                        <td>quis</td>
                        <td>sem</td>
                        <td>at</td>
                    </tr>
                    <tr>
                        <td>1,006</td>
                        <td>nibh</td>
                        <td>elementum</td>
                        <td>imperdiet</td>
                        <td>Duis</td>
                    </tr>
                    <tr>
                        <td>1,007</td>
                        <td>sagittis</td>
                        <td>ipsum</td>
                        <td>Praesent</td>
                        <td>mauris</td>
                    </tr>
                    <tr>
                        <td>1,008</td>
                        <td>Fusce</td>
                        <td>nec</td>
                        <td>tellus</td>
                        <td>sed</td>
                    </tr>
                    <tr>
                        <td>1,009</td>
                        <td>augue</td>
                        <td>semper</td>
                        <td>porta</td>
                        <td>Mauris</td>
                    </tr>
                    <tr>
                        <td>1,010</td>
                        <td>massa</td>
                        <td>Vestibulum</td>
                        <td>lacinia</td>
                        <td>arcu</td>
                    </tr>
                    <tr>
                        <td>1,011</td>
                        <td>eget</td>
                        <td>nulla</td>
                        <td>Class</td>
                        <td>aptent</td>
                    </tr>
                    <tr>
                        <td>1,012</td>
                        <td>taciti</td>
                        <td>sociosqu</td>
                        <td>ad</td>
                        <td>litora</td>
                    </tr>
                    <tr>
                        <td>1,013</td>
                        <td>torquent</td>
                        <td>per</td>
                        <td>conubia</td>
                        <td>nostra</td>
                    </tr>
                    <tr>
                        <td>1,014</td>
                        <td>per</td>
                        <td>inceptos</td>
                        <td>himenaeos</td>
                        <td>Curabitur</td>
                    </tr>
                    <tr>
                        <td>1,015</td>
                        <td>sodales</td>
                        <td>ligula</td>
                        <td>in</td>
                        <td>libero</td>
                    </tr>
                    </tbody>
                </table>
            </div>


        </div>


    </div>
</div>

</body>
</html>
