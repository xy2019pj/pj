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

function showOpenItems() {
    if (window.XMLHttpRequest) { //判断当前使用浏览器的类型
        xmlHttp = new XMLHttpRequest(); //所有现代浏览器（IE7+、Firefox、Chrome、Safari 以及 Opera）均内建 XMLHttpRequest 对象。
    } else {
        xmlHttp = new ActiveXObject("MicroSoft.XMLHTTP"); //老版本的 Internet Explorer （IE5 和 IE6）使用 ActiveX 对象
    }

    var url="profile";
    xmlHttp.open("get", url, true);
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
            //获取后台传递过来的字符串并转换为json
            var responseJson=JSON.parse(xmlHttp.responseText);
            var out="";
            // JSONArray jsonArray = JSONArray.fromObject(responseJson);
            // Object[] strs = jsonArray.toArray();
            for (item in responseJson) {
                out+=creatForm(item.name,item.src,item.intro);
            }
            document.getElementById("collections").innerHTML=out;
        }
    };
    xmlHttp.send(null);
}

function  tryi() {

}

function creatForm(name,src,intro){
    var form=" <div class=\"col-xs-6 col-sm-3 placeholder\" style=\"text-align:center\">\n" +
        "                    <a href=\"" +
        src +
        "\"><img width=\"200\" height=\"200\" class=\"img-responsive\" alt=\"Generic placeholder thumbnail\" src=\"images/1.jpg\"></a>\n" +
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

