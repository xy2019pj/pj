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

    var url="getfav";
    xmlHttp.open("get", url, true);
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
            //获取后台传递过来的字符串并转换为json
            window.alert(xmlHttp.responseText);
            var responseJson=JSON.parse(xmlHttp.responseText);
            var out="";
            alert(responseJson[0].name);
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

function  tryi(visitName) {

    $.ajax({
        url:"fetfav",    //请求的url地址
        dataType:"json",   //返回格式为json
        async:true,//请求是否异步，默认为异步，这也是ajax重要特性
        // data:{"destUser":visitName},    //参数值
        data:{"destUser":visitName},    //参数值
        type:"GET",   //请求方式
        success:function(req){
            //alert(req[0].name);
            var out="";
            for (item in req) {
                out+=creatForm(item.name,item.src,item.intro);
            }
            document.getElementById("collections").innerHTML=out;
        },
        error:function(){
            //请求出错处理
            alert("请求出错，visitname："+visitName);
        }
    });

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

