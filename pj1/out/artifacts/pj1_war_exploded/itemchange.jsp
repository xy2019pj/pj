<%@ page import="entity.Item" %><%--
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
    <title>作品修改</title>

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
    <script src="./js/itemchange.js"></script>
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
            <!--<script>
                var isAdmin;
                var s='${sessionScope.user.auth}';
                if(s == 'n' || s==""){
                    isAdmin=false;
                }else {
                    isAdmin = true;
                }
                leftControl(isAdmin,8);
            </script>-->
            <script>leftControl(true,8);</script>

        </div>

        <!--右侧-->
        <div class="col-sm-9 right">
            <br><br>

            <%
                String name=request.getParameter("item");
                 request.setAttribute("oldName",name);
                 Item item=(Item)request.getAttribute("item");

            %>
            <script>console.log("item="+"<%=item%>")</script>
            <form role="form" action="itemchange" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="exampleInputEmail1">展品名称</label><input class="form-control" id="exampleInputEmail1" type="text" name="name" value="<%=item.getName()%>"/>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">展品简介</label><input class="form-control" id="exampleInputPassword1" type="text" name="intro" value="<%=item.getIntro()%>"/>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">馆藏地点</label><input class="form-control" id="exampleInputPassword2" type="text" name="place" value="<%=item.getPlace()%>"/>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">出土年份或作品完成时间</label><input class="form-control" id="exampleInputPassword3" type="text" name="time" value="<%=item.getTime()%>"/>
                </div>
                <div class="form-group">
                    <label for="exampleInputFile">上传图片</label><input id="exampleInputFile" type="file" name="picture"/>
                </div>
                <div class="form-group">
                    <label for="exampleInputFile">上传视频</label><input id="exampleInputFile2" type="file" name="video"/>
                </div>
                <input type="hidden" name="oldName" value="<%=request.getParameter("item")%>"></input>
                <button class="btn btn-default" type="submit" >确认上传</button>
            </form>
            </div>


        </div>


    </div>
</div>

</body>
</html>
