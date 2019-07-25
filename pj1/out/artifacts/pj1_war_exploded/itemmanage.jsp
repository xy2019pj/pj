<%@ page import="java.util.ArrayList" %>
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

    <!-- 自定义的js -->
    <script src="./js/all.js"></script>
    <script src="./js/center.js"></script>
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
            </div> <button class="btn btn-default" >搜索</button>
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
        <%
            ArrayList<Item> items=(ArrayList<Item>)request.getAttribute("items");
        %>
        <div class="col-sm-9 right">
            <br><br>
            <!--第一行-->
            <%for(int i=0;i<items.size();i+=4){%>
                <div class="row placeholders">
                    <%for(int j=0;j<items.size()-i&&j<4;j++){%>
                        <!--藏品1-->
                        <div class="col-xs-6 col-sm-3 placeholder" style="text-align:center">
                            <!--按钮-->
                            <div class="row clearfix" >
                                <div class="col-md-12 column addText" style="text-align:right">
                                    <form action="itemmanage" method="post">
                                    <a class="glyphicon glyphicon-pencil addForm" href="itemchange?item=<%=items.get(i+j).getName()%>" title="点击修改"> </a>
                                    <button class="glyphicon glyphicon-remove addForm" name="deleteItem" value="<%=items.get(i+j).getName()%>" type="submit" title="点击删除"> </button>
                                    </form>
                                </div>
                            </div>
                            <a href="itemdetail?itemName=<%=items.get(i+j).getName()%>"><img width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail" src="<%=items.get(i+j).getPicture()%>"></a>
                            <h4><%=items.get(i+j).getName()%></h4>
                            <span class="text-muted"><%=items.get(i+j).getIntro()%></span>
                        </div>
                    <%}%>
                </div>
                <br> <br>
            <%}%>

        </div>


    </div>
</div>

</body>
</html>
