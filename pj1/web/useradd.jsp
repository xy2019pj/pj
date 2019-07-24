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
    <script src="./js/all.js"></script>
    <script src="./js/center.js"></script>
    <script src="./js/useradd.js"></script>

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
            <script>nowLocation(0)</script>
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
<div class="jumbotron" style=" text-align:center; background:url(images/museum.jpg) " >
    <h1 style="color: #000000;" id="userNameShow">
        ${sessionScope.user.username}
    </h1>
    <p style="color: #000000;" id="userSignNS">
        ${sessionScope.user.intro}
    </p>
</div>
<!--正文-->
<div class="container">
    <div class="row ">
        <!--左侧-->
        <div class="col-sm-3 col-md-2 sidebar" id="leftSide">
            <script>
                var isAdmin;
                var s='${sessionScope.user.auth}';
                if(s == 'n' || s==""){
                    isAdmin=false;
                }else {
                    isAdmin = true;
                }
                leftControl(isAdmin,7);
            </script>

        </div>

        <!--右侧-->
        <div class="col-sm-9 right">
            <br><br>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="row clearfix">
                        <div class="col-md-1 column">
                        </div>
                        <!--表单-->
                        <div class="col-md-11 column">
                            <form class="form-horizontal" role="form" action="useradd" method="post" name="myForm" onsubmit="return false;">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="inputUserName">用户名</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" id="inputUserName" type="text" name="username" onkeyup="checkName()"  onclick="checkName()"/>
                                    </div>
                                    <div class="col-sm-4" >
                                        <p style="color: #c12e2a"><span id="nametxtHint" class="col-sm-offset-4 col-sm-10"></span></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="inputPassword">密码</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" id="inputPassword" type="password" name="password" onkeyup="checkPassword()" onclick="checkPassword()"/>
                                    </div>
                                    <div class="col-sm-4" >
                                        <p style="color: #c12e2a"><span id="passwordtxtHint" class="col-sm-offset-4 col-sm-10"></span></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="inputPassword">确认密码</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" id="inputPassword2" type="password" name="password2" onkeyup="checkPassword2()" onclick="checkPassword2()"/>
                                    </div>
                                    <div class="col-sm-4" >
                                        <p style="color: #c12e2a"><span id="passwordtxtHint2" class="col-sm-offset-4 col-sm-10"></span></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="inputEmail">邮箱</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" id="inputEmail" type="email" name="email" onkeyup="checkEmail()" onclick="checkEmail()"/>
                                    </div>
                                    <div class="col-sm-4" >
                                        <p style="color: #c12e2a"><span id="emailtxtHint" class="col-sm-offset-4 col-sm-10"></span></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox col-sm-offset-1 col-sm-4" >
                                        <label><input type="checkbox" name="admin" checked />赋予新用户管理员权限</label>
                                        <br>
                                    </div>
                                </div>
                                <div class="form-group" >
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button class="btn btn-default" type="submit" onclick="return isSignSuc()">创建用户</button>
                                    </div>
                                </div>
                                <br>
                                <p><span id="txtHint" class="col-sm-offset-2 col-sm-10" style="color: #419641"></span></p>
                                <br>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>



    </div>
</div>

</body>
</html>
