function friendSearch() {
    $.ajax({
        url:'friendsearch',
        asayn:true,
        type:'POST',
        data:{search:document.forms['searchForm']['search'].value},
        success:function(res) {
            console.log("success");
            var users=JSON.parse(res);
            var form="";
            console.log("users"+users);
            for(var i=0;i<users.length;i+=4){
                form+="<div class=\"row placeholders\">";
                for(var j=0;j<users.length-i&&j<4;j++){
                    form+="<div class=\"col-xs-6 col-sm-3 placeholder\" style=\"text-align:center\">\n" +
                        "                    <div class=\"col-xs-12 col-sm-12 placeholder outline\">\n" +
                        "                        <!--按钮-->\n" +
                        "                        <div class=\"row clearfix\" >\n" +
                        "                            <div class=\"col-md-12 column addText\" style=\"text-align:right\">\n" +
                        "<form action='friendrequest' method='post' onsubmit='window.alert(\"请求发送成功！\");'><button class=\"glyphicon glyphicon-plus addForm\" type='submit' name='friendName' value='"
                        + users[i+j].username+
                        "' title=\"添加好友\" > </button></form>"+
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                        <a href=\"profile?destUser="+
                        users[i+j].username+
                        "\" >"
                        + users[i+j].username+
                        "</a>" +
                        "                        <br><br>\n" +
                        "                        <span class=\"text-muted\">"+
                        users[i+j].intro+
                        "</span>\n" +
                        "                        <br><br>\n" +
                        "                    </div>\n" +
                        "                </div>"
                }
                form+="\n" +
                    "            </div>\n" +
                    "            <br> <br>";
            }
            document.getElementById("searchuser").innerHTML=form;
        },
        error:function () {
            window.alert("error");
        }
    });

}