//������������
var Browser = new Object();
Browser.isIE = window.ActiveXObject ? true : false;
Browser.isIE7 = Browser.isIE && window.XMLHttpRequest;
Browser.isMozilla = Browser.isIE ? false : (typeof document.implementation != 'undefined') && (typeof document.implementation.createDocument != 'undefined') && (typeof HTMLDocument != 'undefined');
Browser.isFF = Browser.isIE ? false : (navigator.userAgent.toLowerCase().indexOf("firefox") != -1);
Browser.isSafari = Browser.isIE ? false : (navigator.userAgent.toLowerCase().indexOf("safari") != -1);
Browser.isOpera = Browser.isIE ? false : (navigator.userAgent.toLowerCase().indexOf("opera") != -1);

//����ַ������󷽷�
//�ַ�����������
String.prototype.realLength = function(len)
{
    var str = (len == 3) ? 'aaa' : 'aa';
    return this.replace(/[^\x00-\xff]/g, str).length;
}
//���˿ո�
String.prototype.lTrim = function()
{
    return this.replace(/^\s*/, "");
}
String.prototype.rTrim = function()
{
    return this.replace(/\s*$/, "");
}
String.prototype.trim = function()
{
    return this.replace(/^\s+|\s+$/g,"");
}

//�жϱ����Ƿ��ֵ
function empty(v)
{
    switch (typeof v)
    {
        case 'undefined' : return true;
        case 'string'    : if(trim(v).length == 0) return true; break;
        case 'boolean'   : if(!v) return true; break;
        case 'number'    : if(0 === v) return true; break;
        case 'object'    :
        if(null === v) return true;
        if(undefined !== v.length && v.length==0) return true;
        for(var k in v){return false;} return true;
        break;
    }
    return false;
}

function getElementsByClassName(class_name, node, tag)
{
    var classElements = new Array();

    if (node == null) {
        node = document;
    }
    if (tag == null) {
        tag = '*';
    }

    var j = 0, teststr;
    var els = node.getElementsByTagName(tag);
    var elsLen = els.length;

    for (i = 0; i < elsLen; i++) {
        if (els[i].className.indexOf(class_name) != -1) {
            teststr = "," + els[i].className.split(" ").join(",") + ",";
            if (teststr.indexOf("," + class_name + ",") != -1) {
                classElements[j] = els[i];
                j++;
            }
        }
    }
    return classElements;
}

//����ID��NAME�õ�����
function $i(objName)
{
    if(document.getElementById){return document.getElementById(objName)}
    else{return document.getElementsByName(objName)}
}

//����¼�
function addEvent(obj,eventType,func)
{
    if(obj.attachEvent){obj.attachEvent("on" + eventType,func);}
    else{obj.addEventListener(eventType,func,false)}
}

//ɾ���¼�
function delEvent(obj,eventType,func)
{
    if(obj.detachEvent){obj.detachEvent("on" + eventType,func)}
    else{obj.removeEventListener(eventType,func,false)}
}

//���cookie
function getCookie(c_name)
{
    if(document.cookie.length<0) return '';
    var offset = document.cookie.indexOf(c_name + '=');
    if(offset == -1) return '';
    offset += c_name.length+1;
    var end = document.cookie.indexOf(";",offset);
    if(end == -1){end = document.cookie.length;}
    return unescape(document.cookie.substring(offset,end))
}

//����cookie
function setCookie(c_name,value,expiredays,domain)
{
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + expiredays);
    var days = (expiredays == null) ? '' : ';expires=' + exdate.toGMTString();
    domain = (domain == null) ? '' : ';domain=' + domain
    document.cookie = c_name + '=' + escape(value) + days + domain;
}

//���ض���
function hide(param)
{
    var type = typeof(param);
    if (type == 'object') {param.style.display = 'none'}
    else if(type == 'string') {$i(param).style.display = 'none'}
}

//��ʾ����
function show(param)
{
    var type = typeof(param);
    if (type == 'object') {param.style.display = ''}
    else if(type == 'string') {$i(param).style.display = ''}
}

//��ʾ�����ض���
function toggle(param)
{
    var type = typeof(param);
    if (type == 'object') {var dis = param.style.display;}
    else if(type == 'string') {var dis = $i(param).style.display}
    if (dis != 'none') {hide(param)}
    else {show(param)}
}

//ʹ����ʽ
function addClass(ObjId,className)
{
    $i(ObjId).className = className;
}

//�������
function getDate(str)
{
    var date = new Date();
    if (str == undefined) str = '-';
    return date.getFullYear() + str + (date.getMonth()+1) + str + date.getDate();
}

//���ʱ��
function getTime()
{
    var date = new Date();
    return date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
}

//�������ַ���
function onlyChinese(str)
{
    return /^[\u0391-\uFFE5]+$/g.test(str);
}

//�ַ�����ȡ
function _substr(str, num, subfix)
{
    if (subfix == undefined) subfix = '...';
    if (str && str.length > num){str = str.substring(0, num) + subfix;}
    return str;
}

//��URL
function isURL(str)
{
    var RegExps = /^(?:ht|f)tp(?:s)?\:\/\/(?:[\w\-\.]+)\.\w+/i;
    return RegExps.test(str);
}

//���URL�еĲ���
function get(key)
{
    var val = '';
    var url = self.location.href;
    var offset = url.indexOf(key + '=');
    if (offset >= 0)
    {
        var str = url.substr(offset);
        var end = str.indexOf('&');
        if (end == -1) val = str.substr(key.length+1);
        else {val = str.slice(key.length+1,end);}
    }
    return val;
}

//��������
function copy(text)
{
    window.clipboardData.setData("Text",text);
    alert("���Ƴɹ���");
}

//ȫѡ
function selectAll()
{
    var a = document.form.getElementsByTagName("input");
    if(a[0].checked == true)
    {
        for (var i=0; i<a.length; i++)
        if (a[i].type == "checkbox") a[i].checked = false;
    }
    else
    {
        for (var i=0; i<a.length; i++)
        if (a[i].type == "checkbox") a[i].checked = true;
    }
}

//�ύ��
function submitForm(action,do_what)
{
    var a = document.form.getElementsByTagName("input");
    var n = 0;
    for (var i=0; i<a.length; i++)
    {
        if (a[i].type == 'checkbox' && a[i].checked == true) n ++;
    }
    if (n == 0)
    {
        alert('û��ѡ���κ���');
    }
    if (n > 0 && confirm('ȷ��Ҫ' + do_what + '�� '+ n +' ����?'))
    {
        document.form.action = action;
        document.form.submit();
    }
}

//Ϊ��
function isNull(val)
{
    if(val.replace(/\s/g,'') == '') return true;
    return false;
}

//alert����
function errAlert(id,msg)
{
    alert(msg);$i(id).focus();return false;
}

//���ò�Ϊ��
function arr_not_empty(arr)
{
	
    for(id in arr)
    {	
		if($i(id).type == "radio"){
			if($i(id).checked == false){return errAlert(id,arr[id]);}	
		}
		else{
			if(isNull($i(id).value)) return errAlert(id,arr[id]);
		}
    }
    return true;
}

//������֤
function isEmail(mail)
{
    return(new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(mail));
}