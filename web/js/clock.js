function showTime(){
    var date = new Date();
    var getHours = date.getHours();
    var getMinute = date.getMinutes();
    var getSecond = date.getSeconds();
    document.getElementById('clock').innerHTML = getHours + " : " + getMinute + " : " + getSecond;
}
setInterval('showTime()',10);