

function hotItem(items) {
    var form="";
    for(var i=0;i<3;i++){
        form+="<div class=\"item \" >\n" +
            "                    <a href=\"itemdetail?itemName=" +items[i].name+
            "\"><img alt=\"图片无法显示\" src=\"" +
            items[i].picture +
            "\" align=\"center\" /></a>\n" +
            "                    <div class=\"carousel-caption\">\n" +
            "                        <h4>\n" +
            items[i].name+"\n" +
            "                        </h4>\n" +
            "                        <p>\n" +
            items[i].intro+
            "                        </p>\n" +
            "                    </div>\n" +
            "                </div>";
    }
    document.getElementById("hotItems").innerHTML=form;
}

function newItem(line,items) {
    var form="";

    for(var i=3*(line-1);i<3*line;i++){
        form+="<div class=\"col-md-4 column\">\n" +
            "            <div class=\"imgcontrol\">\n" +
            "                <img src=\"" +
            items[i].picture +
            "\" align=\"center\">\n" +
            "            </div>\n" +
            "            <h2>\n" +
            items[i].name+"\n" +
            "            </h2>\n" +
            "            <p>\n" +
            items[i].intro+
            "            </p>\n" +
            "            <p>\n" +
            "                <a class=\"btn mycolor\" href=\"itemdetail?itemName=" +
            items[i].name +
            "\" >点击详情 »</a>\n" +
            "            </p>\n" +
            "        </div>";
    }
    switch (line) {
        case 1:document.getElementById("newItems1").innerHTML=form;
            break;
        case 2:document.getElementById("newItems2").innerHTML=form;
            break;
    }
}