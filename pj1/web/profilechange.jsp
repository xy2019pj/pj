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
    <title>修改个人信息</title>

    <meta charset="utf-8">

    <!-- Bootstrap -->
    <link href="./js/bootstrap.min.js" rel="stylesheet">
    <link href="./css/bootstrap.min.css" rel="stylesheet">

    <!-- 自定义的格式css -->
    <link href="css/all.css" rel="stylesheet">
    <link href="css/profile.css" rel="stylesheet">

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
    <script src="./js/profilechange.js"></script>

    <script>
        nowuserName='${sessionScope.user.username}';
        console.log("nowuserName="+nowuserName);
    </script>
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
                leftControl(isAdmin,2);
            </script>

        </div>

        <!--右侧-->
        <div class="col-sm-9 rightC">
            <br><br>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="row clearfix">
                        <div class="col-md-1 column">
                        </div>
                        <!--表单-->
                        <div class="col-md-11 column">
                            <form class="form-horizontal" role="form" action="profilechange" method="post" name="myForm" onsubmit="return false;">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="inputUserName">用户名</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" id="inputUserName" type="text" name="username" onkeyup="checkName()"  onclick="checkName()" value="${sessionScope.user.username}"/>
                                    </div>
                                    <div class="col-sm-4" >
                                        <p style="color: #c12e2a"><span id="nametxtHint" class="col-sm-offset-4 col-sm-10"></span></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="inputEmail">邮箱</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" id="inputEmail" type="email" name="email" onkeyup="checkEmail()" onclick="checkEmail()" value="${sessionScope.user.email}"/>
                                    </div>
                                    <div class="col-sm-4" >
                                        <p style="color: #c12e2a"><span id="emailtxtHint" class="col-sm-offset-4 col-sm-10"></span></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="inputMessage">签名</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" id="inputMessage" type="text" name="intro" value="${sessionScope.user.intro}"/>
                                    </div>
                                    <div class="col-sm-4" >
                                        <p style="color: #c12e2a"><span id="introtxtHint" class="col-sm-offset-4 col-sm-10"></span></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="inputMessage"></label>
                                    <div class="col-sm-4" >
                                        <h5  style="text-align: center;color: #0f0f0f">请输入您的密码进行身份验证 </h5>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="inputPassword">密码</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" id="inputPassword" type="password" name="password" />
                                    </div>
                                    <div class="col-sm-4" >
                                        <p style="color: #c12e2a"><span id="passwordtxtHint" class="col-sm-offset-4 col-sm-10"></span></p>
                                    </div>
                                </div>
                                <div class="form-group" >
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button class="btn btn-default" type="submit" onclick="return isChangeSuc()">确认更改</button>
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
</div>

</body>
</html>
