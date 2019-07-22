function leftControl(isSelf) {
    var form='';
    if(isSelf==true){
        form="<ul class=\"nav nav-sidebar \">\n" +
            "                <li><a href=\"#\" class=\"active\">个人首页</a></li>\n" +
            "                <li class=\"notActive\"><a href=\"#\">修改信息</a></li>\n" +
            "                <li class=\"notActive\"><a href=\"#\">收藏夹</a></li>\n" +
            "            </ul>\n" +
            "            <ul class=\"nav nav-sidebar\">\n" +
            "                <li class=\"notActive\"><a href=\"\">好友列表</a></li>\n" +
            "                <li class=\"notActive\"><a href=\"\">添加好友</a></li>\n" +
            "            </ul>";

    }else {
        form="<ul class=\"nav nav-sidebar \">\n" +
            "                <li><a href=\"#\" class=\"active\">个人首页</a></li>\n" +
            "            </ul>"
    }
    document.getElementById("leftSide").innerHTML=form;
}

function creatForm(name,src,intro){
    var form=" <div class=\"col-xs-6 col-sm-3 placeholder\" style=\"text-align:center\">\n" +
        "                    <a href=\"itemdetail?itemName=" +name+
        "\"><img width=\"200\" height=\"200\" class=\"img-responsive\" alt=\"Generic placeholder thumbnail\" src=\""+
        src+
        "\"></a>\n" +
        "                    <h4>" +
        name +
        "</h4>\n" +
        "                    <span class=\"text-muted\">" +
        intro +
        "</span>\n" +
        "                    <br><br><br>\n" +
        "                </div>";
    return form;
}

