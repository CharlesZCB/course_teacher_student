/**
 * Created by xul on 2016/11/21.
 */

//日历显示几周日期
var _weeks = 6;

// 每周几天
var _WEEK = 7;

// 日历的周标记，两种顺序：由【Calendar._FD】决定
var week_CN = [
    ['日','一','二','三','四','五','六'],
    ['一','二','三','四','五','六','日']
]

/**
 * 属性定义
 * -------------------------------------
 * _DF:
 *  日期显示格式
 *  yyyy/MM/dd HH:mm:ss
 *
 * -------------------------------------
 * _CD:
 *  日历当前日期 currentDate
 *
 * ----------------------------------
 * _FD:
 *  firstDayOfWeek 每周第一天
 *  1:星期一；0：星期天
 *
 * ----------------------------------
 * _ST:
 *  showTime标识【是否显示小时和分钟】
 *  0：不显示；非0：显示
 *
 * y:年
 * M:月
 * d:天
 *
 * W:周
 *
 * H:小时(24小时制)
 * m:分钟
 * s:秒
 *
 * @param inputID 时间控件对应的元素ID
 * @constructor
 */

Calendar = function (obj) {
    this._currentNode = obj;

    //获取当前的日期格式
    var current = obj.getAttribute('format');
    this._DF = (undefined == current || '' == current) ? "yyyy/MM/dd HH:mm:ss" : current;
    //根据inputID获取当前要显示的时间；
    this._CD = obj.value.parseDate(this._DF);
    //获取当一周的第一天。0：星期天；1：星期一
    current = obj.getAttribute('firstDayOfWeek');
    this._FD = (undefined == current || '' == current || '1' != current) ? '0' : '1';

    // 是否显示时间time
    current = obj.getAttribute('showTime');
    this._ST = (undefined == current || '' == current || '0' != current) ? '1' : '0';

}

/**
 * 日期变更重新加载日历界面
 * @param num
 * @param fmt
 */
Calendar.prototype.changeDate = function (num, fmt) {
    this._CD = this._CD.setDateBefore(num, fmt);
    this._init();
}

/**
 * 将当前输入框中的value根据日期格式专程date类型数据；
 * @param str
 * @param fmt
 * @returns {Date}
 */
String.prototype.parseDate = function (format) {
    if ('' == this) {
        return new Date();
    }

    var a = this.split(/\D+/g);
    var b = format.match(/[a-zA-Z]+/g);
    var i = 0, j = 0;
    for (i = 0; i < a.length; ++i) {
        switch (b[i]) {
            case "yy":
            case "yyyy":
                var year = parseInt(a[i], 10);
                //当前年份小于100时，认为当前年份为简写；年份大于70时，认为为20世纪，否则为21世纪
                (year < 100) && (year += (year > 70) ? 1900 : 2000);
                break;

            case "M":
            case "MM":
                var mon = parseInt(a[i], 10) - 1;
                break;

            case "dd":
            case "d":
                var day = parseInt(a[i], 10);
                break;

            case "HH":
            case "H":
                var hour = parseInt(a[i], 10);
                break;

            case "mm":
            case "m":
                var min = parseInt(a[i], 10);
                break;

            case "ss":
            case "s":
                var sec = parseInt(a[i], 10);
                break;
        }
    }
    var today = new Date();
    if (isNaN(year)) year = today.getFullYear();
    if (isNaN(mon)) mon = today.getMonth();
    if (isNaN(day)) day = today.getDate();
    if (isNaN(hour)) hour = today.getHours();
    if (isNaN(min)) min = today.getMinutes();

    return new Date(year, mon, day, hour, min, 0);
};

/*
 * 获取某时间前N天
 * string date 时间
 * int num 差值num>0 前，num<0 当前日期之后
 * string differFmt 相差日期格式(1:日； 2：周； 3：月； 4：季； 5：年)
 * @return date
 */
Date.prototype.setDateBefore = function (num, differFmt) {
    switch (Number(differFmt)) {
        case 1://计算相差天数
            return new Date(this.getFullYear(), this.getMonth(), this.getDate() - num,
                this.getHours(), this.getMinutes(), this.getSeconds());
            break;
        case 2://计算相差周数
            return new Date(this.getFullYear(), this.getMonth(), this.getDate() - num * 7,
                this.getHours(), this.getMinutes(), this.getSeconds());
            break;
        case 3://计算相差月数
            return new Date(this.getFullYear(), this.getMonth() - num, this.getDate(),
                this.getHours(), this.getMinutes(), this.getSeconds());
            break;
        case 4://计算相差季度
            return new Date(this.getFullYear(), this.getMonth() - num * 3, this.getDate(),
                this.getHours(), this.getMinutes(), this.getSeconds());
            break;
        case 5://计算相差年数
            return new Date(this.getFullYear() - num, this.getMonth(), this.getDate(),
                this.getHours(), this.getMinutes(), this.getSeconds());
            break;
        default:
            return new Date();
            break;
    }
}

/**
 *设置当前显示的月份列表
 */
Calendar.prototype.setDayList = function () {

    var year = this._CD.getFullYear();
    var mon = this._CD.getMonth();

    var dayList = [];
    var nowDate = new Date(year, mon);
    var currentWeekday = nowDate.getDay();

    var i = 0;
    for (; i < _WEEK * _weeks; i++) {
        dayList[i] = [];
        // 当前日期的date；
        dayList[i]['date'] = nowDate.setDateBefore((Number(currentWeekday) - Number(this._FD) - i), 1);
        // 控件展示的内容：日期day
        dayList[i]['day'] = dayList[i]['date'].getDate();
        // 是否为当前月份日期，根据标识变更字体颜色和样式
        dayList[i]['curMonFlag'] = dayList[i]['date'].getMonth() == mon ? true : false;
        dayList[i]['currentDay'] = this._CD.getDate() == dayList[i]['date'].getDate() ? true : false;
    }
    return dayList;
}

/**
 * 判断是否是闰年
 * @returns {boolean}
 */
Date.prototype.isLeap = function () {
    var year = this.getFullYear();
    return ((0 == year % 4 && 0 != year % 100) || "0" == year % 400);
}

/**
 * 根据当前格式格式化日期
 * @param format
 * @returns {*}
 */
Date.prototype.format = function (format) {
    var date = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "H+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S+": this.getMilliseconds()
    };
    if (/(y+)/i.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in date) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
        }
    }
    return format;
}

/**
 * 获取某日期所属的周在一年所有周中的位数
 * @returns {number}
 */
Date.prototype.getWeekNumber = function () {
    var d = new Date(this.getFullYear(), this.getMonth(), this.getDate(), 0, 0, 0);
    var DoW = d.getDay();
    d.setDate(d.getDate() - (DoW + 6) % 7 + 3); // Nearest Thu
    var ms = d.valueOf(); // GMT
    d.setMonth(0);
    d.setDate(4); // Thu in Week 1
    return Math.round((ms - d.valueOf()) / (7 * 864e5)) + 1;
};

/**
 * 初始化显示日历选择页面
 * @private
 */
Calendar.prototype._init = function () {
    var calShow = document.createElement('div');
    calShow.className = 'calendarShow';
    var calendarHtml = '<div class="calendarWrap"><div class="calendarTop"><a class="prevYear" href="javascript:void(0);">&lt;&lt;</a><a class="prevMon" href="javascript:void(0);">&lt;</a>'
        + '<label><span class="month">'
        + (this._CD.getMonth() + 1)
        + '月</span><span class="year">'
        + this._CD.getFullYear()
        + '</span></label><a class="nextMon" href="javascript:void(0);">&gt;</a><a class="nextYear" href="javascript:void(0);">&gt;&gt;</a>'
        + '</div><table class="dayList"><thead><tr>';

    var i = 0;
    var w = week_CN[this._FD];
    while (i < w.length) {
        calendarHtml += '<td>' + w[i] + '</td>';
        ++i;
    }
    calendarHtml += '</tr></thead><tbody>';
    var d = this.setDayList();

    i = 0;
    while (i < d.length) {
        if (0 == i % 7) {
            calendarHtml += "<tr>";
        }
        calendarHtml += '<td class="calDay ';
        if (d[i]['curMonFlag']) {
            calendarHtml += 'curMonFlag';
            if (d[i]['currentDay']) {
                calendarHtml += ' currentDay';
            }
        }
        calendarHtml += '" date="' + d[i]['date'] + '">' + d[i]['day'] + '</td>';
        if (6 == i % 7) {
            calendarHtml += "</tr>";
        }
        ++i;
    }
    calendarHtml += '</tbody></table>';

    // 是否需要加载time部分['hour', 'minute']
    if ("0" != this._ST) {
        var min = this._CD.getMinutes();
        var hour = this._CD.getHours();
        calendarHtml += '<div class="timeWrap">'
            + '<input class="timeInput" maxlength="2" value="'
            + ("00" + hour).substr(("" + hour).length) + '" id="hour" type="text"/>'
            + '<label>:</label>'
            + '<input class="timeInput" maxlength="2" value="'
            + ("00" + min).substr(("" + min).length) + '" id="minute" type="text"/>'
            + '<input type="button" class="calendarSure" value="确定"/></div>';
    }

    UtilElement.removeElementByClassName('calendarShow');
    calShow.innerHTML = calendarHtml;
    calShow.style.left = Number(this._currentNode.offsetLeft)+"px";
    calShow.style.top = (Number(this._currentNode.offsetTop)+Number(this._currentNode.offsetHeight))+"px";
    this._currentNode.parentNode.appendChild(calShow);

    var cal = this;

    if ('0' != cal._ST) {
        var sureButton = UtilElement.myGetElementsByClassName('calendarSure');
        UtilEvent.addEvent(sureButton[0], 'click', function () {
            var event = UtilEvent.getEvent();
            var obj = event.srcElement || event.target;

            var date = new Date(UtilElement.myGetElementsByClassName('currentDay')[0].getAttribute('date'));
            if (timeCheck('hour', 24) && timeCheck('minute', 59)) {
                date.setHours(document.getElementById('hour').value);
                date.setMinutes(document.getElementById('minute').value);
            } else {
                return false;
            }

            cal._currentNode.value = date.format(cal._DF);
            // 可在此处调用校验时间的方法

            UtilElement.removeElementByClassName('calendarShow');
            return false;
        });
    }

    var tdList = UtilElement.myGetElementsByClassName('calDay');
    var len = tdList.length;
    for (var i = 0; i < len; i++) {
        UtilEvent.addEvent(tdList[i], 'click', function () {
            var event = UtilEvent.getEvent();
            var obj = event.srcElement || event.target;

            var date = new Date(obj.getAttribute('date'));
            if ('0' != cal._ST) {
                if (timeCheck('hour', 24) && timeCheck('minute', 59)) {
                    date.setHours(document.getElementById('hour').value);
                    date.setMinutes(document.getElementById('minute').value);
                } else {
                    return false;
                }
            }

            cal._currentNode.value = date.format(cal._DF);
            // 可在此处调用校验时间的方法

            UtilElement.removeElementByClassName('calendarShow');
            return false;
        });
    }

    // 下个月
    var nextMon = UtilElement.myGetElementsByClassName('nextMon')[0];
    UtilEvent.addEvent(nextMon, 'click', function () {
        cal.changeDate(-1, 3);
        return false;
    });

    // 下一年
    var nextYear = UtilElement.myGetElementsByClassName('nextYear')[0];
    UtilEvent.addEvent(nextYear, 'click', function () {
        cal.changeDate(-1, 5);
        return false;
    })

    // 上个月
    var prevMon = UtilElement.myGetElementsByClassName('prevMon')[0];
    UtilEvent.addEvent(prevMon, 'click', function () {
        cal.changeDate(1, 3);
        return false;
    })

    // 上一年
    var prevYear = UtilElement.myGetElementsByClassName('prevYear')[0];
    UtilEvent.addEvent(prevYear, 'click', function () {
        cal.changeDate(1, 5);
        return false;
    })

    UtilEvent.stopEvent();

    var calendarWrap = UtilElement.myGetElementsByClassName('calendarWrap')[0];
    UtilEvent.addEvent(calendarWrap, 'click', function () {
        UtilEvent.stopEvent();
    })

    UtilEvent.addEvent(document, 'click', function () {
        UtilElement.removeElementByClassName('calendarShow');
    })
    return false;
}

/**
 * 校验是否为数字
 * @param s
 * @returns {boolean}
 */
function checkTimeIsNumber(s) {
    var reg = /^\d+$/;
    return reg.test(s);
}

/**
 * 校验时间值是否合法
 * @param ID 要检测的ID
 * @param max 最大值
 * @param min 最小值
 * @returns {boolean}
 */
function timeCheck(ID, max, min) {
    if (undefined === max || '' == max) {
        max = 'hour' == ID ? 24 : 59;
    }
    if (undefined === min || '' == min) {
        min = 0;
    }
    var val = document.getElementById(ID).value;
    return (checkTimeIsNumber(val) && Number(val) < Number(max) && Number(val) >= Number(min));
}

//事件工具集合
UtilEvent = {
    /**
     * 添加事件监听兼容性处理
     *
     * @param tag 监听对象
     * @param event 监听事件
     * @param func 事件处理函数
     */
    addEvent: function (tag, event, func) {
        if (undefined != tag.addEventListener) {
            tag.addEventListener(event, func, false);
        } else if (undefined != tag.attachEvent) {
            tag.attachEvent('on' + event, func);
        } else {
            tag['on' + event] = func;
        }
    },

    /**
     * 移除事件监听兼容性统一处理
     *
     * @param tag 监听对象
     * @param event 监听事件
     * @param func 事件处理函数
     */
    removeEvent: function (tag, event, func) {
        if (tag.removeEventListener) {
            tag.removeEventListener(event, func, false);
        } else if (tag.detachEvent) {
            tag.detachEvent('on' + event, func);
        } else {
            tag['on' + event] = null;
        }
    },
    /**
     * 获取事件对象的兼容性统一处理
     *
     * @returns {*}
     */
    getEvent: function () {
        if (document.all)  return window.event;
        var func = UtilEvent.getEvent.caller;
        while (func != null) {
            var arg0 = func.arguments[0];
            if (arg0) {
                if ((arg0.constructor == Event || arg0.constructor == MouseEvent) ||
                    (typeof(arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
                    return arg0;
                }
            }
            func = func.caller;
        }
        return null;
    },
    /**
     * 移除事件冒泡；
     * @param event
     */
    stopEvent: function () {
        var event = UtilEvent.getEvent();
        // stopPropagation() IE8 不识别
        if (document.all) {//判断是否为IE
            event.cancelBubble = true;
        } else {
            event.stopPropagation();
        }
    }
}

// element工具类
UtilElement = {
    /**
     * 根据classname获取dom节点，ie8不支持默认的函数
     * @param searchClass
     * @param node
     * @param tag
     * @returns {Array}
     */
    myGetElementsByClassName: function (searchClass, node, tag) {
        node = node || document;
        tag = tag || "*";
        var result = [];
        if (document.getElementsByClassName) {
            var nodes = node.getElementsByClassName(searchClass);
            if (tag !== "*") {
                for (var i = 0; node = nodes[i++];) {
                    if (node.tagName === tag.toUpperCase()) {
                        result.push(node);
                    }
                }
            } else {
                result = nodes;
            }
        } else {
            var classes = searchClass.split(" "),
                elements = (tag === "*" && node.all) ? node.all : node.getElementsByTagName(tag),
                patterns = [],
                current,
                match;
            var i = classes.length;
            while (--i >= 0) {
                patterns.push(new RegExp("(^|\\s)" + classes[i] + "(\\s|$)"));
            }
            var j = elements.length;
            while (--j >= 0) {
                current = elements[j];
                match = false;
                for (var k = 0, kl = patterns.length; k < kl; k++) {
                    match = patterns[k].test(current.className);
                    if (!match)  break;
                }
                if (match)  result.push(current);
            }
        }
        return result
    },
    /**
     * 根据classname移除元素节点
     *
     * @param className
     */
    removeElementByClassName: function (className) {
        var dom = UtilElement.myGetElementsByClassName(className);
        while (dom.length > 0) {
            dom[0].parentNode.removeChild(dom[0]);
            //兼容ie8，防止死循环
            dom = UtilElement.myGetElementsByClassName(className);
        }
    }

}

/**
 * 监听时间空间的点击事件
 */
var cal = UtilElement.myGetElementsByClassName('calendar');
var len = cal.length;
for (var i = 0; i < len; i++) {
    UtilEvent.addEvent(cal[i], 'click', function () {
        var event = UtilEvent.getEvent();
        var obj = event.srcElement || event.target;
        var cal = new Calendar(obj);
        cal._init();
        return false;
    });
}


