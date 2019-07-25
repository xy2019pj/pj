

function hotItem(items) {
    var form="";
    form+="<div class=\"row clearfix\">\n" +
        "    <div class=\"col-md-12 column\">\n" +
        "        <div class=\"carousel slide\" id=\"carousel-368079\">\n" +
        "            <ol class=\"carousel-indicators\">\n" +
        "                <li class=\"active\" data-target=\"#carousel-368079\" data-slide-to=\"0\">\n" +
        "                </li>\n" +
        "                <li data-target=\"#carousel-368079\" data-slide-to=\"1\">\n" +
        "                </li>\n" +
        "                <li data-target=\"#carousel-368079\" data-slide-to=\"2\">\n" +
        "                </li>\n" +
        "            </ol>\n" +
        "            <div class=\"carousel-inner\" >";
    form+="                <div class=\"item active \">\n" +
        "                    <a href=\"" +
        "itemdetail?itemName="+items[0].name +
        "\"><img class=\"center-block\" alt=\"图片无法显示\"  src=\"" +
        items[0].picture +
        "\"  /></a>\n" +
        "                    <div class=\"carousel-caption\">\n" +
        "                        <h4>\n" +
        items[0].name +
        "                        </h4>\n" +
        "                        <p>\n" +
        items[0].intro +
        "                        </p>\n" +
        "                    </div>\n" +
        "                </div>";
    for(var i=1;i<3;i++){
        form+=
            "                <div class=\"item\">\n" +
            "                    <a href=\"" +
            "itemdetail?itemName="+items[i].name +
            "\"><img class=\"center-block\" alt=\"图片无法显示\"  src=\"" +
            items[i].picture +
            "\"  /></a>\n" +
            "                    <div class=\"carousel-caption\">\n" +
            "                        <h4>\n" +
            items[i].name +
            "                        </h4>\n" +
            "                        <p>\n" +
            items[i].intro +
            "                        </p>\n" +
            "                    </div>\n" +
            "                </div>";
    }
    form+="</div> <a class=\"left carousel-control\" href=\"#carousel-368079\" data-slide=\"prev\"><span class=\"glyphicon glyphicon-chevron-left\"></span></a> <a class=\"right carousel-control\" href=\"#carousel-368079\" data-slide=\"next\"><span class=\"glyphicon glyphicon-chevron-right\"></span></a>\n" +
        "        </div>\n" +
        "    </div>\n" +
        "</div>";
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