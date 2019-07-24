function f() {
    console.log("into f()");//
    $.ajax({
        url: "friend",
        type: "post",
        success: function (res) {
            friends=JSON.parse(res);
            friend(0);
        },
        error:function () {
            window.alert("????");
        }
    });
}

//好友列表+刷新当前右侧
function friend(i) {
    console.log("into friend(i);i="+i);//
    var form;
    if(friends.length==0) {
        form = "您暂时没有好友";
        return;
    }
    else form="";
    console.log("length"+friends.length);//
    var forms=new Array();
    for(var j=0;j<friends.length;j++)
        forms[j]="<li><a onclick=\"fchange("+j+")\">"+friends[j].username+"</a></li>\n";

    forms[i]="<li><a onclick=\"fchange("+i+")\" class=\"active\">"+friends[i].username+"</a></li>\n";

    for(var j=0;j<friends.length;j++)
        form+=forms[j];

    document.getElementById("friends").innerHTML=form;

    friendRight(friends[i].username);
}

//右侧函数
function friendRight(friendName) {
    console.log("friendRight(friendName);name="+friendName+";");//
    var right="<form action='friendchange' method='post'><a class=\"glyphicon glyphicon-home addForm\" href=\"" +
        "profile?destUser="+friendName+
        "\" title=\"访问好友主页\"> </a>\n" +
        "                                <button class=\"glyphicon glyphicon-remove addForm\" name=\"friendName\" value=\""+
        friendName+
        "\"title=\"删除好友\"> </button></form> "  //...
    document.getElementById("friendGo").innerHTML=right;
}

//点击好友刷新右侧和当前好友位置
function fchange(i) {
    friend(i);
}