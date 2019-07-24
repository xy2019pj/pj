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
    <script src="js/showTry.js"></script>
<script>

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
            <script>
                var categoryS="<%=request.getParameter("category")%>";
                console.log("categoryS="+categoryS);
                if(categoryS=="null"||categoryS==""||categoryS=="全部"){
                    nowLocation(2);
                }else {
                    nowLocation(3);
                }
            </script>
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
        <%
            if(request.getParameter("category")!=null&&(!request.getParameter("category").equals("全部"))){
        %>
        <%=request.getParameter("category")+"类展品"%>
        <%
        }else {
        %>
        <%="所有展品"%>
        <%
        }
        %>
    </h1>
</div>
<!--搜索表单-->
<div class="container ">
    <div class="row clearfix">
        <div class="col-md-12 column"  style="text-align:center" >
            <form class="navbar-form" role="search"  id="searchForm">
                <div class="form-group">
                    <input class="form-control" type="text" id="inputS" />
                </div> <button class="btn btn-default" type="button" onclick="f()">搜索</button>
            </form>
        </div>
    </div>
</div>
<!--分页-->
<div class="container writeColorText bottomThings clearfix">
    <div class="row clearfix" id="showGround">
        <!--初始化第一页-->
        <script>
            var requestS="<%=request.getParameter("search")%>";
            /*if(requestS=="null"||requestS==""){
                f();
            }else{
                f2(requestS);
            }*/
            var categoryS="<%=request.getParameter("category")%>";
            f3(requestS,categoryS);
        </script>
    </div>
</div>

<br><br><br>
<div class="container " style="text-align:center" >
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li id="preBtn">
                <a onclick="preEvent()" aria-label="Previous" >
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li id="now0Btn"><a onclick="btnEvent(0)" >1</a></li>
            <li id="now1Btn"><a onclick="btnEvent(1)" >2</a></li>
            <li id="now2Btn"><a onclick="btnEvent(2)" >3</a></li>
            <li id="now3Btn"><a onclick="btnEvent(3)" >4</a></li>
            <li id="now4Btn"><a onclick="btnEvent(4)" >5</a></li>
            <li id="nextBtn">
                <a  onclick="nextEvent()" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>

<script>
    var url=window.location.href;
    sessionStorage.setItem("loginBeforeUrl",url);
    console.log(sessionStorage.getItem("loginBeforeUrl"));
</script>

</body>
</html>