function f() {
    console.log("into f()");//
    $.ajax({
        url: "friend",
        type: "post",
        success: function (res) {
            var form = "您暂时无好友";
            var friends=JSON.parse(res);
            if(friends==null||friends.length==0){
                console.log("好友列表为空");//
            }else {
                form="";
                console.log(friends[0].username);
                for (var i = 0; i < friends.length; i++)
                    form += "<li><a href=\"" +
                        "profile?destUser="+
                        friends[i].username +
                        "\" class=\"active\">"+
                        friends[i].username+
                        "</a></li>\n";
            }
            document.getElementById("friends").innerHTML=form;
        },
        error:function () {
            window.alert("????");
        }
    });
}

//好友列表+刷新当前右侧
function friend(i) {
    console.log("into friend(i);i="+i);//
    var form="";

    var forms=new Array();
    for(var j=0;j<friends.length;j++)
        forms[j]="<li><a onclick=\"fchange("+j+")\">"+friends[j].username+"</a></li>\n";

    forms[i]="<li><a onclick=\"fchange("+i+")\" class=\"active\">friends[i].username</a></li>\n";

    for(var j=0;j<friends.length;j++)
        form+=forms[j];

    document.getElementById("friends").innerHTML=form;

    friendRight(friends[i].username);
}

//右侧函数
function friendRight(friendName) {
    console.log("friendRight(friendName);name="+friendName+";");//
    var right="<a class=\"glyphicon glyphicon-home addForm\" href=\"" +
        "profile?destUser="+friendName+
        "\" title=\"访问好友主页\"> </a>\n" +
        "                                <a class=\"glyphicon glyphicon-remove addForm\" href=\"#\" title=\"删除好友\"> </a>"  //...
    document.getElementById("friendGo").innerHTML=right;
}

//点击好友刷新右侧和当前好友位置
function fchange(i) {
    friend(i);
}