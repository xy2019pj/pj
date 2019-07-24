<%@ page import="entity.User" %>
<%@ page import="java.util.ArrayList" %><%--
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
                leftControl(isAdmin,6);
            </script>

        </div>

        <!--右侧-->
        <div class="col-sm-9 right">
            <br>
            <!--表格-->
            <div class="table-responsive">
                <table class="table table-striped" id="table">
                    <%
                        ArrayList<User> allUsers=(ArrayList<User>)request.getAttribute("users") ;
                    %>
                    <thead>
                    <!--表头-->
                    <tr>
                        <th>ID</th>
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
                    <%for(int i=0;i<allUsers.size();i++){%>
                    <tr>
                        <td><%=allUsers.get(i).getId()%></td>
                        <td><%=allUsers.get(i).getUsername()%></td>
                        <td><%=allUsers.get(i).getEmail()%></td>
                        <td><%=allUsers.get(i).getRecent_login_time()%></td>
                        <td><%=allUsers.get(i).getAuth()%></td>
                        <td>
                            <form action="usermanage" method="post">
                            <!--按钮-->
                            <div class="row clearfix">
                                <div class="col-md-12 column addText">
                                    <%if(allUsers.get(i).getAuth()=='n'){%>
                                    <button class="glyphicon glyphicon-arrow-up addForm" type="submit" name="changeAuth" value="<%=allUsers.get(i).getUsername()%>" title="升级为管理员"> </button>
                                    <%}else{%>
                                    <button class="glyphicon glyphicon-arrow-down addForm" type="submit" name="changeAuth" value="<%=allUsers.get(i).getUsername()%>" title="降级为普通用户"> </button>
                                    <%}%>
                                </div>
                            </div>
                            </form>
                        </td>
                        <td><!--按钮-->
                            <div class="row clearfix" >
                                <div class="col-md-12 column addText">
                                    <button class="glyphicon glyphicon-remove addForm" type="submit" name="deleteUser" value="<%=allUsers.get(i).getUsername()%>" title="删除用户"> </button>
                                </div>
                            </div>
                        </td>
                        </form>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
