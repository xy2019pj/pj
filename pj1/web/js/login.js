function checkFilled() {
    var name=document.forms["myForm"]["username"].value;
    var password=document.forms["myForm"]["password"].value;

    if (name==null || name==""||password==null || password==""){
        document.getElementById("txtHint").innerHTML="请输入用户名和密码";
    }else {
        document.getElementById("txtHint").innerHTML="";
    }
}

function isLoginSuc() {
    console.log("into isLoginSuc()");
    var name=document.forms["myForm"]["username"].value;
    var password=document.forms["myForm"]["password"].value;
    var result=false;
    $.ajax({
        url:"login?username="+name+"&password="+password,    //请求的url地址
        async:false,//请求是否异步，默认为异步，这也是ajax重要特性
        type:"POST",   //请求方式
        data:"text",
        success:function(req){
            console.log("login success! req:\n"+req);
            if(req=="1"){
                document.getElementById("txtHint").innerHTML="登录成功";
                console.log("isLoginSuc()-beforeUrl="+beforeUrl);
                window.location.href=beforeUrl;
                result=true;
            }else {
                console.log("login fail!");
                document.getElementById("txtHint").innerHTML="用户名和密码错误";
                result=false;
            }
        },
        error:function(){
            console.log("login error fail!");
            result=false;
        }
    });
    return result;
}

function showHint(str)
{
    var xmlhttp;
    if (str.length==0)
    {
        document.getElementById("txtHint").innerHTML="";
        return;
    }
    if (window.XMLHttpRequest)
    {
        // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
        xmlhttp=new XMLHttpRequest();
    }
    else
    {
        // IE6, IE5 浏览器执行代码
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
            document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET","/try/ajax/gethint.php?q="+str,true);
    xmlhttp.send();
}