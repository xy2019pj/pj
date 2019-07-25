
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

