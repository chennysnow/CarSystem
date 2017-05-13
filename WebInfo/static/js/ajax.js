/**
 * ajax����
 * @author  �ź�ΰ <mail@zhwphp.com>
 */

//ajax��������ݺ���
function ajaxFunction()
{
    var xmlHttp;
    try
    {
        xmlHttp=new XMLHttpRequest();
    }
    catch (e)
    {
        try
        {
            xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e)
        {
            try
            {
                xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (e)
            {
                alert("�����������֧��AJAX��");
                return false;
            }
        }
    }
    return xmlHttp;
}

//ajax ��������
function ajaxSend(method,url,data)
{
    var xmlHttp = ajaxFunction();
    url += '&ajax=1';
    xmlHttp.open(method,url,true);
    //���ΪPOST����Ҫ��open���������һ��
    if (method == 'POST')
    {
        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        xmlHttp.send(data);
    }
    else xmlHttp.send(null);
    return xmlHttp;
}

//ajax request
function ajaxRequest(method,url,data,callback)
{
    var xmlHttp = ajaxSend(method,url,data);
    xmlHttp.onreadystatechange = function()
    {
        if(xmlHttp.readyState == 4)
        {
            if(xmlHttp.status == 200)
            {
                if (callback != undefined) { eval(callback+'(xmlHttp);'); }
            }
            else if(xmlHttp.status == 404) alert("Requested URL is not found.");
            else if(xmlHttp.status == 403) alert("Access denied.");
        }
    }
}

//ajax post ��ʽ
function ajaxPost(url,data,callback)
{
    ajaxRequest('POST',url,data,callback);
}

//ajax get ��ʽ
function ajaxGet(url,callback)
{
    ajaxRequest('GET',url,'',callback);
}

//�ص�����ʾ��
//function callback(xmlHttp)
//{
//    var text = xmlHttp.responseText;
//}