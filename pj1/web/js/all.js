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

function searchI() {
    var x = document.forms["fname"]["search"].value;
    if (x == null || x == "") {
        alert("请输入搜索内容。");
        return false;
    }
}