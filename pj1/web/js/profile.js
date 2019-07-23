function f() {
    $.ajax({
        url:"profile",    //请求的url地址
        dataType:"json",   //返回格式为json
        async:true,//请求是否异步，默认为异步，这也是ajax重要特性
        type:"POST",   //请求方式
        success:function(req){
            var out="";
            for (var i=0;i<req.length;i++) {
                out+=creatForm(req[i].name,req[i].picture,req[i].intro);
            }
            document.getElementById("collections").innerHTML=out;
        },
        error:function(){
            window.alert("???");
        }
    });
}


function leftControl(isSelf,isAdmin) {
    var form='';
    if(isSelf==true){
        if(isAdmin){
            form=adminLeft(1);
        }else {
            form=normalLeft(1);
        }

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
    sessionStorage.setItem("user","notnull")

    $.ajax({
        url:"getfav",    //请求的url地址
        dataType:"json",   //返回格式为json
        async:true,//请求是否异步，默认为异步，这也是ajax重要特性
        // data:{"destUser":visitName},    //参数值
        data:{"destUser":"yy"},    //参数值
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

function adminLeft(line) {
    var forms=new Array();
    var form="<ul class=\"nav nav-sidebar \">\n" ;
    forms[0]="<li class=\"notActive\"><a href=\"profile\">个人首页</a></li>\n";
    forms[1]="<li class=\"notActive\"><a href=\"profilechange.jsp\">修改信息</a></li>\n";
    forms[2]="<li class=\"notActive\"><a href=\"favorite\">收藏夹</a></li>\n";
    lineB1="</ul>\n"+"<ul class=\"nav nav-sidebar\">\n";
    forms[3]="<li class=\"notActive\"><a href=\"friend\">好友列表</a></li>\n";
    forms[4]="<li class=\"notActive\"><a href=\"friendrequest\">添加好友</a></li>\n";
    lineB2="</ul>\n" +"<ul class=\"nav nav-sidebar\">\n"
    forms[5]="                <li class=\"notActive\"><a href=\"usermanage\">人员管理</a></li>\n";
    forms[6]="                <li class=\"notActive\"><a href=\"useradd\">创建用户</a></li>\n";
    lineB3="            </ul>\n" +"            <ul class=\"nav nav-sidebar\">\n";
    forms[7]="                <li class=\"notActive\"><a href=\"itemmanage\">作品管理</a></li>\n";
    forms[8]="                <li class=\"notActive\"><a href=\"itemadd\">上传作品</a></li>\n";
    lineB4="            </ul>";

    switch (line) {
        case 1:forms[line-1]="<li><a href=\"profile\" class=\"active\">个人首页</a></li>\n";
            break;
        case 2:forms[line-1]="<li><a href=\"profilechange.jsp\" class=\"active\">修改信息</a></li>\n";
            break;
        case 3:forms[line-1]="<li><a href=\"favorite\" class=\"active\">收藏夹</a></li>\n";
            break;
        case 4:forms[line-1]="<li><a href=\"friend\" class=\"active\">好友列表</a></li>\n";
            break;
        case 5:forms[line-1]="<li><a href=\"friendrequest\" class=\"active\">添加好友</a></li>\n";
            break;
        case 6:forms[line-1]="<li><a href=\"usermanage\" class=\"active\">人员管理</a></li>\n";
            break;
        case 7:forms[line-1]="<li><a href=\"useradd\" class=\"active\">创建用户</a></li>\n";
            break;
        case 8:forms[line-1]="<li><a href=\"itemmanage\" class=\"active\">作品管理</a></li>\n";
            break;
        case 9:forms[line-1]="<li><a href=\"itemadd\" class=\"active\">上传作品</a></li>\n";
            break;
    }

    form+=forms[0]+forms[1]+forms[2]+lineB1+forms[3]+forms[4]+lineB2+forms[5]+forms[6]+lineB3+forms[7]+forms[8]+lineB4;

    return form;
}

function normalLeft(line) {
    var forms=new Array();
    var form="<ul class=\"nav nav-sidebar \">\n" ;
    forms[0]="<li class=\"notActive\"><a href=\"profile\">个人首页</a></li>\n";
    forms[1]="<li class=\"notActive\"><a href=\"profilechange.jsp\">修改信息</a></li>\n";
    forms[2]="<li class=\"notActive\"><a href=\"favorite\">收藏夹</a></li>\n";
    lineB1="</ul>\n"+"<ul class=\"nav nav-sidebar\">\n";
    forms[3]="<li class=\"notActive\"><a href=\"friend\">好友列表</a></li>\n";
    forms[4]="<li class=\"notActive\"><a href=\"friendrequest\">添加好友</a></li>\n";
    lineB2="</ul>\n" ;

    switch (line) {
        case 1:forms[line-1]="<li><a href=\"profile\" class=\"active\">个人首页</a></li>\n";
            break;
        case 2:forms[line-1]="<li><a href=\"profilechange.jsp\" class=\"active\">修改信息</a></li>\n";
            break;
        case 3:forms[line-1]="<li><a href=\"favorite\" class=\"active\">收藏夹</a></li>\n";
            break;
        case 4:forms[line-1]="<li><a href=\"friend\" class=\"active\">好友列表</a></li>\n";
            break;
        case 5:forms[line-1]="<li><a href=\"friendrequest\" class=\"active\">添加好友</a></li>\n";
            break;
    }

    form+=forms[0]+forms[1]+forms[2]+lineB1+forms[3]+forms[4]+lineB2;

    return form;
}