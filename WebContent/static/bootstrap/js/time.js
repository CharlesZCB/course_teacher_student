function start() {        
var today = new Date();     
var y = today.getFullYear();    
var M = today.getMonth() + 1;    
var d = today.getDate();    
var h = today.getHours();    
var m = today.getMinutes();    
var s = today.getSeconds();    
var w = today.getDay();    
var weekday = new Array(7);    
weekday[0] = "星期日";    
weekday[1] = "星期一";    
weekday[2] = "星期二";    
weekday[3] = "星期三";    
weekday[4] = "星期四";    
weekday[5] = "星期五";    
weekday[6] = "星期六";    
// 当分钟和秒为个位数时前面补0    
if (m < 10) {    
m = "0" + m;    
}    
if (s < 10) {    
s = "0" + s;    
}    
document.getElementById('time').innerHTML = y + "-" + M + "-" + d + " " + h    
+ ":" + m + ":" + s + " " + weekday[w];    
var t = setTimeout(function() {    
start()    
}, 500); /* 每500毫秒执行一次，实现动态显示时间效果 */    
}  



