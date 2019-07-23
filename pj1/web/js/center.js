function leftControl(isAdmin,line){

    var form='';
    if(isAdmin==true){
        form=adminLeft(line);

    }else {
        form=normalLeft(line);
    }
    document.getElementById("leftSide").innerHTML=form;

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