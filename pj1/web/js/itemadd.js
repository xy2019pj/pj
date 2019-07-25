function click(){
    console.log(">into click");
    sleep(5000)
    document.getElementById("txtHint").innerHTML="上传成功！";
    return true;
}

function sleep(numberMillis) {
    console.log(">into sleep");
    var now = new Date();
    var exitTime = now.getTime() + numberMillis;
    while (true) {
        now = new Date();
        if (now.getTime() > exitTime){
            console.log("< sleep");
            return;
        }
    }
}

