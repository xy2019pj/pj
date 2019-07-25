<%@ page import="entity.Item" %>
<%@ page import="entity.User" %><%--
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
    <title>展品详情</title>

    <meta charset="utf-8">

    <!-- Bootstrap -->
    <link href="./js/bootstrap.min.js" rel="stylesheet">
    <link href="./css/bootstrap.min.css" rel="stylesheet">

    <!-- 自定义的格式css -->
    <link href="css/mycover.css" rel="stylesheet">
    <link href="css/itemdetail.css" rel="stylesheet">

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

    <%
        Item item=(Item)request.getAttribute("item");
        String fav=(String)request.getAttribute("fav");
    %>
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
    <h1 style="color: #000000;">
        <%=item.getName()%>
    </h1>
    <p style="color: #000000;">
        <%=item.getIntro()%>
    </p>
</div>
<!--展品详情-->
<div class="container">
    <!--图片-->
    <div class="row clearfix " style="text-align:center">
        <div class="col-md-12 column">
            <img alt="图片" src="<%=item.getPicture()%>" />
        </div>
    </div>
    <!--收藏按钮-->
    <br>
    <div class="row clearfix" style="text-align:center">
        <div class="col-md-12 column">
            <a class="glyphicon glyphicon-star-empty collectForm" href="favoritechange?itemChangeName=<%=item.getName()%>" title="收藏\取消收藏"> </a>
            <%
                User user=(User)session.getAttribute("user");
                if(user!=null){
                    char userAuth=user.getAuth();
                    System.out.println("user.getAuth()="+user.getAuth());
                    if(userAuth=='a'){
                        System.out.println("manager:item.getName()="+item.getName());
            %>
            <%="<a class=\"glyphicon glyphicon-pencil collectForm\" href=\"itemchange?item="+item.getName()+"\"title=\"管理作品\"> </a>"%>
            <%
                } }
            %>

        </div>
    </div>

    <div class="row clearfix textForm" style="text-align:center">
        <br><br>
        <!--文字详情-->
        <div class="col-md-12 column">
            <dl>
                <dt>
                    <%=item.getName()%>
                </dt>
                <dd>
                    <%=item.getIntro()%>
                </dd>
                <br>
                馆藏地点：
                <dd>
                    <%=item.getPlace()%>
                </dd>
                <br>
                出土时间/作品完成时间：
                <dd>
                    <%=item.getTime()%>
                </dd>

                <dt>
                    热度<%=item.getClickNum()%>
                </dt>
            </dl>
        </div>
        <!--媒体-->
        <div class="row clearfix topSpace" style="text-align:center" >
            <div class="col-md-12 column">
                <video width="1120" height="630" controls autoplay>
                    <source src="<%=item.getVideo()%>" type="video/mp4">
                </video>
            </div>
        </div>
    </div>
</div>

<script>
    var url=window.location.href;
    sessionStorage.setItem("loginBeforeUrl",url);
    console.log(sessionStorage.getItem("loginBeforeUrl"));
</script>

</body>
</html>
