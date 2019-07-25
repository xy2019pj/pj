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
            document.getElementById("allpage").innerHTML=""+pagen;
            document.getElementById("showGround").innerHTML=form;
        },
        error:function () {
            window.alert("????");
        }
    });
    return false;
}
function getItems(category,search) {
    console.log("category="+category+";search="+search);
    $.ajax({
        url:'show',
        type:'post',
        data:{category:category,search:search},
        success: function (res) {
            items=JSON.parse(res);
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
            var allpageN=pagen+1;
            document.getElementById("allpage").innerHTML=""+allpageN;
            document.getElementById('showGround').innerHTML=form;
            changeBtnLessthan5();
        },
        error:function () {
            window.alert('????');
        }
    })
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
        if(pagen+1<5){
            changeBtnLessthan5()
        }else{
            changeBtn();
        }

    }
}

function nextEvent() {
    if(nowN<pagen){
        nowN++;
        changePage(nowN);
        if(pagen+1<5){
            changeBtnLessthan5()
        }else{
            changeBtn();
        }
    }
}

function btnEvent(i) {
    nowN=i;
    changePage(nowN);
    if(pagen+1<5){
        changeBtnLessthan5()
    }else{
        changeBtn();
    }
}

function changeBtn() {
    console.log("into changeBtn,nowN="+nowN);
    var forms=new Array();
    var pageNs=new Array();
    var nowPI;

    if(nowN>1 && nowN<pagen-1){
        pageNs[0]=nowN-2;
        pageNs[1]=nowN-1;
        pageNs[2]=nowN;
        pageNs[3]=nowN+1;
        pageNs[4]=nowN+2;
        nowPI=2;
    }else{
        if(nowN<=1){
            nowPI=nowN;
            pageNs[0]=0;
            pageNs[1]=1;
            pageNs[2]=2;
            pageNs[3]=3;
            pageNs[4]=4;
        }else {
            nowPI=4-pagen+nowN;
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

    console.log("nowPI="+nowPI+";总页数="+pagen);//
    var t=pageNs[0];
    var m=t+1;
    switch (nowPI) {
        case 0:forms[0]="<a onclick=\"btnEvent(" +t+")\" style=\"background-color: #0c3347;color: #e2e2e2\">" +m+ "</a>"
        break;
        case 1:t++; m++;forms[1]="<a onclick=\"btnEvent(" +t+")\" style=\"background-color: #0c3347;color: #e2e2e2\">" +m+ "</a>"
        break;
        case 2:t++; m++;forms[2]="<a onclick=\"btnEvent(" +t+")\" style=\"background-color: #0c3347;color: #e2e2e2\">" +m+ "</a>"
        break;
        case 3:t++; m++;forms[3]="<a onclick=\"btnEvent(" +t+")\" style=\"background-color: #0c3347;color: #e2e2e2\">" +m+ "</a>"
        break;
        case 4:t++; m++;forms[4]="<a onclick=\"btnEvent(" +t+")\" style=\"background-color: #0c3347;color: #e2e2e2\">" +m+ "</a>"
    }

    document.getElementById("now0Btn").innerHTML=forms[0];
    document.getElementById("now1Btn").innerHTML=forms[1];
    document.getElementById("now2Btn").innerHTML=forms[2];
    document.getElementById("now3Btn").innerHTML=forms[3];
    document.getElementById("now4Btn").innerHTML=forms[4];

}

function changeBtnLessthan5() {
    console.log("into changeBtnLessthan5,nowN="+nowN);

    var forms=new Array();
    for(var i=0;i<=pagen;i++){
        var t=i+1;
        forms[i]="<a onclick=\"btnEvent(" +i + ")\" >" + t + "</a>";
        console.log("forms[i]="+forms[i]);
    }
    var t=nowN+1;
    forms[nowN]="<a onclick=\"btnEvent(" + nowN + ")\" style=\"background-color: #0c3347;color: #e2e2e2\">" + t + "</a>";

    switch (pagen+1) {
        case 1:
            console.log("case1:pagen="+pagen+";nowN="+nowN+"\nform1="+forms[0]);
            document.getElementById("now0Btn").innerHTML=forms[0];
            document.getElementById("now1Btn").style="display:none";
            document.getElementById("now2Btn").style="display:none";
            document.getElementById("now3Btn").style="display:none";
            document.getElementById("now4Btn").style="display:none";
            break;
        case 2:
            console.log("case2:pagen="+pagen+";nowN="+nowN+"\nform1="+forms[0]+"\nform2="+forms[1]);
            document.getElementById("now0Btn").innerHTML=forms[0];
            document.getElementById("now1Btn").innerHTML=forms[1];
            document.getElementById("now2Btn").style="display:none";
            document.getElementById("now3Btn").style="display:none";
            document.getElementById("now4Btn").style="display:none";
            break;
        case 3:
            console.log("case3:pagen="+pagen+";nowN="+nowN);
            document.getElementById("now0Btn").innerHTML=forms[0];
            document.getElementById("now1Btn").innerHTML=forms[1];
            document.getElementById("now2Btn").innerHTML=forms[2];
            document.getElementById("now3Btn").style="display:none";
            document.getElementById("now4Btn").style="display:none";
            break;
        case 4:
            console.log("case4:pagen="+pagen+";nowN="+nowN);
            document.getElementById("now0Btn").innerHTML=forms[0];
            document.getElementById("now1Btn").innerHTML=forms[1];
            document.getElementById("now2Btn").innerHTML=forms[2];
            document.getElementById("now2Btn").innerHTML=forms[3];
            document.getElementById("now4Btn").style="display:none";
            break;
    }

}