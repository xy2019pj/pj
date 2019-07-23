function myFunction(user,userAuth)
{

    var manager="<li class=\"dropdown\">\n" +
        "                <a class=\"dropdown-toggle\" href=\"#\" data-toggle=\"dropdown\">管理中心<strong class=\"caret\"></strong></a>\n" +
        "                <ul class=\"dropdown-menu\">\n" +
        "                    <li>\n" +
        "                        <a href=\"usermanage\">人员管理</a>\n" +
        "                    </li>\n" +
        "                    <li>\n" +
        "                        <a href=\"useradd\">创建用户</a>\n" +
        "                    </li>\n" +
        "                    <li class=\"divider\">\n" +
        "                    </li>\n" +
        "                    <li>\n" +
        "                        <a href=\"itemmanage\">作品管理</a>\n" +
        "                    </li>\n" +
        "                    <li>\n" +
        "                        <a href=\"itemadd\">上传作品</a>\n" +
        "                    </li>\n" +
        "                </ul>\n" +
        "            </li>\n" +
        "            <!--用户栏-->\n" +
        "            <li class=\"dropdown\">\n" +
        "                <a class=\"dropdown-toggle\" href=\"#\" data-toggle=\"dropdown\">个人中心<strong class=\"caret\"></strong></a>\n" +
        "                <ul class=\"dropdown-menu\">\n" +
        "                    <li>\n" +
        "                        <a href=\"profile\">个人首页</a>\n" +
        "                    </li>\n" +
        "                    <li>\n" +
        "                        <a href=\"favorite\">收藏夹</a>\n" +
        "                    </li>\n" +
        "                    <li class=\"divider\">\n" +
        "                    </li>\n" +
        "                    <li>\n" +
        "                        <a href=\"logout\">退出登录</a>\n" +
        "                    </li>\n" +
        "                </ul>\n" +
        "            </li>";


        var normalUser=" <li class=\"dropdown\">\n" +
            "                <a class=\"dropdown-toggle\" href=\"#\" data-toggle=\"dropdown\">个人中心<strong class=\"caret\"></strong></a>\n" +
            "                <ul class=\"dropdown-menu\">\n" +
            "                    <li>\n" +
            "                        <a href=\"profile\">个人首页</a>\n" +
            "                    </li>\n" +
            "                    <li>\n" +
            "                        <a href=\"favorite\">收藏夹</a>\n" +
            "                    </li>\n" +
            "                    <li class=\"divider\">\n" +
            "                    </li>\n" +
            "                    <li>\n" +
            "                        <a href=\"logout\">退出登录</a>\n" +
            "                    </li>\n" +
            "                </ul>\n" +
            "            </li>";

    var visitor="<li class=\"dropdown\">\n" +
        "                <a class=\"dropdown-toggle\" href=\"#\" data-toggle=\"dropdown\">个人中心<strong class=\"caret\"></strong></a>\n" +
        "                <ul class=\"dropdown-menu\">\n" +
        "                    <li>\n" +
        "                        <a href=\"login\">登录</a>\n" +
        "                    </li>\n" +
        "                    <li>\n" +
        "                        <a href=\"register\">注册</a>\n" +
        "                    </li>\n" +
        "                </ul>\n" +
        "            </li>";

    if(user==null){
        document.getElementById("userManage").innerHTML=visitor;
    }else {
        if(userAuth == 'n'){
            document.getElementById("userManage").innerHTML=normalUser;
        }else {
            document.getElementById("userManage").innerHTML=manager;
        }
    }
    console.log("进入了function,user="+user+";userAuth="+userAuth);
}

function hotItem(items) {
    var form="";
    for(var i=0;i<3;i++){
        form+="<div class=\"item \" >\n" +
            "                    <a href=\"itemdetail?itemName=" +items[i].name+
            "\"><img alt=\"图片无法显示\" src=\"" +
            items[i].picture +
            "\" align=\"center\" /></a>\n" +
            "                    <div class=\"carousel-caption\">\n" +
            "                        <h4>\n" +
            items[i].name+"\n" +
            "                        </h4>\n" +
            "                        <p>\n" +
            items[i].intro+
            "                        </p>\n" +
            "                    </div>\n" +
            "                </div>";
    }
    document.getElementById("hotItems").innerHTML=form;
}

function newItem(line,items) {
    var form="";

    for(var i=3*(line-1);i<3*line;i++){
        form+="<div class=\"col-md-4 column\">\n" +
            "            <div class=\"imgcontrol\">\n" +
            "                <img src=\"" +
            items[i].picture +
            "\" align=\"center\">\n" +
            "            </div>\n" +
            "            <h2>\n" +
            items[i].name+"\n" +
            "            </h2>\n" +
            "            <p>\n" +
            items[i].intro+
            "            </p>\n" +
            "            <p>\n" +
            "                <a class=\"btn mycolor\" href=\"itemdetail?itemName=" +
            items[i].name +
            "\" >点击详情 »</a>\n" +
            "            </p>\n" +
            "        </div>";
    }
    switch (line) {
        case 1:document.getElementById("newItems1").innerHTML=form;
            break;
        case 2:document.getElementById("newItems2").innerHTML=form;
            break;
    }
}