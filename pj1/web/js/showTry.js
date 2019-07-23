function f() {
    console.log("call f()");
    var input=document.getElementById("inputS").value;
    console.log("input:"+input);
    var u;
    if(input== ""||input==false){
        u="showcutp";
    }else {
        u="showcutp?search="+input;
    }
    $.ajax({
        url: u,
        type: "POST",
        success: function (res) {
            console.log("u="+u);//
            console.log("success!");//
            items =JSON.parse(res)[0];
            // console.log("name0："+items[0].name);
            if(items.length%9!=0){
                pagen=parseInt(items.length/9);//0-9
            }else {
                pagen=items.length/9-1;
            }
            nowN=0;//按钮变量0开始 0-p1
            var form=creatPage(nowN);
             console.log("items.length:"+items.length);//
             console.log("pagen:"+pagen);//
             console.log("nowN="+nowN);//
            document.getElementById("showGround").innerHTML=form;
        },
        error:function () {
            window.alert("????");
        }
    });
return false;
}

function f2(requestS) {
    console.log("call f2(),requestS="+requestS);
    $.ajax({
        url: "showcutp",
        type: "POST",
        data:{search:requestS},
        success: function (res) {
            console.log("success!");//
            items =JSON.parse(res)[0];
            // console.log("name0："+items[0].name);
            if(items.length%9!=0){
                pagen=parseInt(items.length/9);//0-9
            }else {
                pagen=items.length/9-1;
            }
            nowN=0;//按钮变量0开始 0-p1
            var form=creatPage(nowN);
             console.log("items.length:"+items.length);//
             console.log("pagen:"+pagen);//
             console.log("nowN="+nowN);//
            document.getElementById("showGround").innerHTML=form;
        },
        error:function () {
            window.alert("????");
        }
    });
    return false;
}

function f3(requestS,categoryS) {
    console.log("call f3(),requestS="+requestS+";categoryS="+categoryS);
    var d;
    if(categoryS!="null"&&requestS!=""){
        if(requestS!="null"&&requestS!=""){
            d={category:categoryS,search:requestS};
        }else{
            d={category:categoryS};
        }
    }else {
        if(requestS!="null"&&requestS!=""){
            d={search:requestS};
        }else{
            d={};
        }
    }

    $.ajax({
        url: "showcutp",
        type: "POST",
        data:d,
        success: function (res) {
            console.log("success!");//
            items =JSON.parse(res)[0];
            // console.log("name0："+items[0].name);
            if(items.length%9!=0){
                pagen=parseInt(items.length/9);//0-9
            }else {
                pagen=items.length/9-1;
            }
            nowN=0;//按钮变量0开始 0-p1
            var form=creatPage(nowN);
            console.log("items.length:"+items.length);//
            console.log("pagen:"+pagen);//
            console.log("nowN="+nowN);//
            document.getElementById("showGround").innerHTML=form;
        },
        error:function () {
            window.alert("????");
        }
    });
    return false;
}

function creatPage(nowN) {
    var form;
    for(var i=0;(i<9) && ((nowN*9+i)<items.length);i++){
        form+="<div class=\"col-md-4 column\">\n" +
            "            <div class=\"imgcontrol\">\n" +
            "                <img src=\"" +
           items[nowN*9+i].picture +
            "\" align=\"center\">\n" +
            "            </div>\n" +
            "            <h2>\n" +
            items[nowN*9+i].name +
            "            </h2>\n" +
            "            <p>\n" +
            items[nowN*9+i].intro+
            "            </p>\n" +
            "            <p>\n" +
            "                <a class=\"btn mycolor\" href=\"itemdetail?itemName=" +
            items[nowN*9+i].name +
            "\" >点击详情 »</a>\n" +
            "            </p>\n" +
            "        </div>" ;
    }
    return form;
}

function changePage(pageN) {
    console.log("into changePage pageN:"+pageN);//
    var form=creatPage(pageN);
    document.getElementById("showGround").innerHTML=form;
}

function preEvent() {
    if(nowN>0){
        nowN--;
        changePage(nowN);
        changeBtn();
    }
}

function nextEvent() {
    if(nowN<pagen){
        nowN++;
        changePage(nowN);
        changeBtn();
    }
}

function btnEvent(i) {
    nowN=i;
    changePage(nowN);
    changeBtn();
}

function changeBtn() {
    console.log("into changeBtn,nowN="+nowN);
    var forms=new Array();
    var pageNs=new Array();

    if(nowN>1 && nowN<pagen-1){
        pageNs[0]=nowN-2;
        pageNs[1]=nowN-1;
        pageNs[2]=nowN;
        pageNs[3]=nowN+1;
        pageNs[4]=nowN+2;
    }else{
        if(nowN<=1){
            pageNs[0]=0;
            pageNs[1]=1;
            pageNs[2]=2;
            pageNs[3]=3;
            pageNs[4]=4;
        }else {
            pageNs[0]=pagen-4;
            pageNs[1]=pagen-3;
            pageNs[2]=pagen-2;
            pageNs[3]=pagen-1;
            pageNs[4]=pagen;
        }
    }


    for(var i=0;i<5;i++){
        var t=pageNs[i]+1;
        forms[i]="<a onclick=\"btnEvent(" + pageNs[i] + ")\" >" + t + "</a>";
        console.log(forms[i]);
    }

    document.getElementById("now0Btn").innerHTML=forms[0];
    document.getElementById("now1Btn").innerHTML=forms[1];
    document.getElementById("now2Btn").innerHTML=forms[2];
    document.getElementById("now3Btn").innerHTML=forms[3];
    document.getElementById("now4Btn").innerHTML=forms[4];

}