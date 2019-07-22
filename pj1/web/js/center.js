function leftControl(isAdmin){

    var form='';
    if(isAdmin==true){
        form="<ul class=\"nav nav-sidebar \">\n" +
            "                <li class=\"notActive\"><a href=\"#\">个人首页</a></li>\n" +
            "                <li class=\"notActive\"><a href=\"#\">修改信息</a></li>\n" +
            "                <li class=\"notActive\"><a href=\"#\">收藏夹</a></li>\n" +
            "            </ul>\n" +
            "            <ul class=\"nav nav-sidebar\">\n" +
            "                <li class=\"notActive\"><a href=\"\">好友列表</a></li>\n" +
            "                <li class=\"notActive\"><a href=\"\">添加好友</a></li>\n" +
            "            </ul>\n" +
            "            <ul class=\"nav nav-sidebar\">\n" +
            "                <li class=\"notActive\"><a href=\"\">人员管理</a></li>\n" +
            "                <li class=\"notActive\"><a href=\"\">创建用户</a></li>\n" +
            "            </ul>\n" +
            "            <ul class=\"nav nav-sidebar\">\n" +
            "                <li class=\"notActive\"><a href=\"\">作品管理</a></li>\n" +
            "                <li><a href=\"#\" class=\"active\">上传作品</a></li>\n" +
            "            </ul>";

    }else {
        form="<ul class=\"nav nav-sidebar \">\n" +
            "                <li><a href=\"#\" class=\"active\">个人首页</a></li>\n" +
            "                <li class=\"notActive\"><a href=\"#\">修改信息</a></li>\n" +
            "                <li class=\"notActive\"><a href=\"#\">收藏夹</a></li>\n" +
            "            </ul>\n" +
            "            <ul class=\"nav nav-sidebar\">\n" +
            "                <li class=\"notActive\"><a href=\"\">好友列表</a></li>\n" +
            "                <li class=\"notActive\"><a href=\"\">添加好友</a></li>\n" +
            "            </ul>";
    }
    document.getElementById("leftSide").innerHTML=form;

}