function favChange(itemName) {
    $.ajax({
        url:'favoritechange',
        type:'post',
        data:{itemName:itemName},
        success:function () {
            window.alert("成功");
        },
        error:function () {
            window.alert("失败");
        }
    })
}

function favOpen(itemName) {
    $.ajax({
        url:'favoriteopen',
        type:'post',
        data:{itemName:itemName}
    })
}
<!--通过ajax获取收藏列表-->
function collection() {
    $.ajax({
        url: "favorite",
        type: "POST",
        success: function (res) {
            favItems =JSON.parse(res);
            var form="";
            for(var i=0;i<favItems.length;i+=4){
                for(var j=0;j<favItems.length-i&&j<4;j++) {
                    form += " <div class=\"col-xs-6 col-sm-3 placeholder\" style=\"text-align:center\">" +
                        "<div class=\"row clearfix\" >" +
                        "<div class=\"col-md-12 column addText\" style=\"text-align:right\">" +
                        "<form action=\"favoriteopen\" method=\"post\" ><button class=\"glyphicon glyphicon-eye-open addForm\" type=\"submit\" name=\"itemOpenName\" value=\""+
                        favItems[i + j].name+
                        "\" title=\"更改权限\"> </button></from>"+
                        "<button class=\"glyphicon glyphicon-remove addForm\"  type=\"submit\"  name=\"itemChangeName\" value=\"" +
                        favItems[i + j].name+
                        "\" title=\"取消收藏\"> </button>"+
                        "</div>" +
                        "</div>" +
                        "<a href=\"#\"><img width=\"200\" height=\"200\" class=\"img-responsive\" alt=\"Generic placeholder thumbnail\" src=\"" +
                        favItems[i + j].picture +
                        "\"></a>" +
                        "<h4>" +
                        favItems[i + j].name +
                        "</h4>" +
                        "<span class=\"text-muted\">+" +
                        favItems[i + j].intro +
                        "</span>" +
                        "</div>";
                }
                form+="<br> <br>";
            }
            document.getElementById("fav").innerHTML=form;
        },
        error:function () {
            window.alert("????");
        }
    });
}
