//用户导航条
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

//搜索导航
function searchI() {
    var x = document.forms["fname"]["search"].value;
    if (x == null || x == "") {
        alert("请输入搜索内容。");
        return false;
    }
}

//导航菜单
function nowLocation(numb) {
    var forms=new Array();

    forms[0]="<li>\n";
    forms[1]="<li>\n";
    forms[2]="<li class=\"dropdown\">\n" ;

    switch (numb) {
        case 0:break;
        case 1:forms[0]="<li class=\"active\">";
            break;
        case 2:forms[1]="<li class=\"active\">";
            break;
        case 3: forms[2]="<li class=\"dropdown active\">\n" ;
            break;
    }

    var s1=
        "                <a href=\"home\">首页</a>\n" +
        "            </li>\n";
    var s2=
        "                <a href=\"show?category=全部\"  >所有展品</a>\n" +
        "            </li>\n";
    var s3=
        "                <a class=\"dropdown-toggle\" href=\"\" data-toggle=\"dropdown\">展品分类<strong class=\"caret\"></strong></a>\n" +
        "                <!--下拉展品分类菜单-->\n" +
        "                <ul class=\"dropdown-menu\">\n" +
        "                    <li>\n" +
        "                        <a href=\"show?category=工艺\">工艺</a>\n" +
        "                    </li>\n" +
        "                    <li>\n" +
        "                        <a href=\"show?category=金石\">金石</a>\n" +
        "                    </li>\n" +
        "                    <li>\n" +
        "                        <a href=\"show?category=书画\">书画</a>\n" +
        "                    </li>\n" +
        "                    <li>\n" +
        "                        <a href=\"show?category=陶瓷\">陶瓷</a>\n" +
        "                    </li>\n" +
        "                    <li>\n" +
        "                        <a href=\"show?category=其他\">其他</a>\n" +
        "                    </li>\n" +
        "                </ul>\n" +
        "            </li>";

    var form=forms[0]+s1+forms[1]+s2+forms[2]+s3;
    document.getElementById("location").innerHTML=form;

}