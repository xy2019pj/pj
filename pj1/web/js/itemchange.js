function checkName() {
    console.log(">into checkName ");
    var name = document.forms["myForm"]["username"].value;
    console.log("name=" + name);
    if (name != "" && name != null) {
        if (name.length >= 4 && name.length <= 15) {
            $.ajax({
                url: "register?mode=checkName&username=" + name + "&password=password&email=email",    //请求的url地址
                async: true,//请求是否异步，默认为异步，这也是ajax重要特性
                type: "POST",   //请求方式
                data: "text",
                success: function (req) {
                    console.log("checkName success! req:\n" + req);
                    if (req == "2") {
                        console.log("可以使用");
                        document.getElementById("nametxtHint").innerHTML = "";
                        console.log("<checkName true");
                        return true;
                    } else {
                        console.log("用户名已存在");
                        document.getElementById("nametxtHint").innerHTML = "用户名已存在";
                        console.log("<checkName false");
                        return false;
                    }
                },
                error: function () {
                    console.log("checkName error fail!");
                    console.log("<checkName false");
                    return false;
                }
            });
        }else {
            document.getElementById("nametxtHint").innerHTML = "用户名长度需要4~15位";
            console.log("<checkName false");
            return false;
        }
    }
    console.log("<checkName");
}

function checkPassword() {
    console.log(">into checkPassword");
    var password=document.forms["myForm"]["password"].value;
    console.log("password:"+password);
    if(password!=""&&password!=null){
        if(password.length>=6&&password.length<=10){
            var p1=new RegExp("[0-9]");
            var p2=new RegExp("[a-z]");
            var p3=new RegExp("[A-Z]");
            if(p1.test(password)&&p2.test(password)&&p3.test(password)){
                console.log("1");
                document.getElementById("passwordtxtHint").innerHTML="";
                console.log("<checkPassword true");
                return true;
            }else{
                console.log("2");
                document.getElementById("passwordtxtHint").innerHTML="密码格式必须包含数字和大小写字母";
                console.log("<checkPassword false");
                return false;
            }

        }else {
            console.log("3");
            document.getElementById("passwordtxtHint").innerHTML="密码长度需要6~10位";
            console.log("<checkPassword false");
            return false;
        }
    }
}

function checkPassword2() {
    console.log(">into checkPassword2");
    var password=document.forms["myForm"]["password"].value;
    var password2=document.forms["myForm"]["password2"].value;
    console.log("password2:"+password2);
    if(password2!=password){
        document.getElementById("passwordtxtHint2").innerHTML="密码需保持一致";
        console.log("<checkPassword2 false");
        return false;
    }else {
        document.getElementById("passwordtxtHint2").innerHTML="";
        console.log("<checkPassword2 true");
        return true;
    }
}

function checkEmail(){
    console.log(">into checkEmail");
    var email=document.forms["myForm"]["email"].value;
    console.log("email:"+email);
    if(email!=null&&email!=""){
        var reg=/^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
        if(reg.test(email)){
            document.getElementById("emailtxtHint").innerHTML="";
            console.log("<checkEmail true");
            return true;
        }else {
            document.getElementById("emailtxtHint").innerHTML="邮箱格式错误";
            console.log("<checkEmail false");
            return false;
        }
    }
    console.log("<checkEmail false");
    return false;
}

function checkNumb() {
    console.log(">into checkNumb");
    var checkNumb=document.forms["myForm"]["numb"].value;
    console.log("checkNumb:"+checkNumb);
    if(checkNumb!=code){
        document.getElementById("checkNumbtxtHint").innerHTML="请输入正确的验证码";
        console.log("<checkNumb false");
        return false;
    }else {
        document.getElementById("checkNumbtxtHint").innerHTML=" ";
        console.log("<checkNumb true");
        return true;
    }
}

function creatCheckNumb() {
    code = "";
    var codeLength = 4; //验证码的长度
    ////所有候选组成验证码的字符
    var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
    //循环组成验证码的字符串
    for (var i = 0; i < codeLength; i++)
    {
        //获取随机验证码下标
        var charNum = Math.floor(Math.random() * 9);
        //组合成指定字符验证码
        code += codeChars[charNum];
    }
    document.getElementById("showCheckNumb").innerHTML=code;
    return code;
}

function isfilled() {
    console.log(">into isfilled()");
    var name=document.forms["myForm"]["username"].value;
    var password=document.forms["myForm"]["password"].value;
    var password2=document.forms["myForm"]["password2"].value;
    var email=document.forms["myForm"]["email"].value;
    var checkNumb=document.forms["myForm"]["numb"].value;
    var flag=0;

    if (name==null || name==""){
        document.getElementById("nametxtHint").innerHTML="请输入用户名";
    }else {
        document.getElementById("nametxtHint").innerHTML="";
        flag++;
    }

    if (password==null || password==""){
        document.getElementById("passwordtxtHint").innerHTML="请输入密码";
    }else {
        document.getElementById("passwordtxtHint").innerHTML="";
        flag++;
    }

    if (password2==null || password2==""){
        document.getElementById("passwordtxtHint2").innerHTML="请确认密码";
    }else {
        document.getElementById("passwordtxtHint2").innerHTML="";
        flag++;
    }

    if (email==null || email==""){
        document.getElementById("emailtxtHint").innerHTML="请输入邮箱";
    }else {
        document.getElementById("emailtxtHint").innerHTML="";
        flag++;
    }

    if (checkNumb==null || checkNumb==""){
        document.getElementById("checkNumbtxtHint").innerHTML="请输入验证码";
    }else {
        document.getElementById("checkNumbtxtHint").innerHTML="";
        flag++;
    }

    if(flag==5){
        console.log("flag="+flag);
        console.log("<isfilled true");
        return true;
    }else {
        console.log("flag="+flag);
        console.log("<isfilled false");
        return false;
    }
}

function checkName2() {
    console.log(">into checkName2 ");
    var name=document.forms["myForm"]["username"].value;
    if(name.length<4||name.length>15){
        document.getElementById("nametxtHint").innerHTML="用户名长度需要4~15位";
        console.log("<checkName2 false");
        return false;
    }
    var result=false;
    $.ajax({
        url:"register?mode=checkName&username="+name+"&password=password&email=email",    //请求的url地址
        async:false,//请求是否异步，默认为异步，这也是ajax重要特性
        type:"POST",   //请求方式
        data:"text",
        success:function(req){
            console.log("checkName success! req:\n"+req);
            if(req=="2"){
                console.log("可以使用");
                document.getElementById("nametxtHint").innerHTML="";
                console.log("<checkName true");
                result= true;
            }else {
                console.log("用户名已存在");
                document.getElementById("nametxtHint").innerHTML="用户名已存在";
                console.log("<checkName false");
                result= false;
            }
        },
        error:function(){
            console.log("checkName error fail!");
            console.log("<checkName false");
            result= false;
        }
    });
    console.log("<checkName");
    return result;
}

function isSignSuc() {
    console.log("into isSignSuc()");
    var name=document.forms["myForm"]["username"].value;
    var passwordPre=document.forms["myForm"]["password"].value;
    var password=md5(passwordPre);
    console.log("password="+passwordPre);
    console.log("passwordmd5="+password);
    var email=document.forms["myForm"]["email"].value;
    var result=false;
    if(isfilled()&&checkName2() &&checkEmail()&&checkPassword()&&checkPassword2()&&checkNumb()){
        console.log("intoAJAX");
        $.ajax({
            url:"register?mode=signUp&username="+name+"&password="+password+"&email="+email,    //请求的url地址
            async:false,//请求是否异步，默认为异步，这也是ajax重要特性
            type:"POST",   //请求方式
            data:"text",
            success:function(req){
                console.log("login success! req:\n"+req);
                if(req=="1"){
                    document.getElementById("txtHint").innerHTML="注册成功！";
                    console.log("isLoginSuc()-beforeUrl="+beforeUrl);
                    window.location.href=beforeUrl;
                    result=true;
                }else {
                    console.log("login fail!");
                    document.getElementById("txtHint").innerHTML="错误";
                    result=false;
                }
            },
            error:function(){
                console.log("login error fail!");
                result=false;
            }
        });
        return result;
    }else {
        console.log("NOT intoAJAX");
        return false;
    }

}