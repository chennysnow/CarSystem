<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="AddCar.aspx.cs" Inherits="WebInfo.AddCar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/static/css/dealer_user.css" rel="stylesheet" />
    <script src="static/js/common.js"></script>
    <script src="static/js/ajax.js"></script>
    <script src="static/js/ajaxfileupload.js"></script>
<style type="text/css" media="screen">#file_uploadUploader {visibility:hidden}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main clearfix" style="padding-top:10px ;padding-bottom:10px ">
    <div class="userleft">
		        <div class="usermenu">
            <h3>我的车源管理 &gt;</h3>
            <ul class="clearfix">
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=addcar" class="orange01 f14">添加车源</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=carlist&amp;s_type=1" class="orange01">管理车源</a></li>
            </ul>
        </div>
		        <div class="usermenu">
            <h3>车商资料查询 &gt;</h3>
            <ul class="clearfix">
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=dealerlist" class="orange01 f12">车商列表</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=about&amp;id=36" target="_blank" class="blue f12">联系卡下载</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=index&amp;ac=about&amp;id=42" target="_blank" class="red f12">网费付款方式</a></li>
            </ul>
        </div>

		<div class="leftsearch">
			<form method="get" action="http://www.nb77.cn/dealer/index.php">
			<input type="hidden" name="mod" value="user">
			<input type="hidden" name="ac" value="dealerlist">	<select name="searchsort">
				<option value="">请选择</option><option value="1">车商</option><option value="2">编号</option><option value="3">虚拟号</option>
				</select>
			<input type="text" name="keywords" class="input01"> <input type="image" src="static/img/search05.gif">
			</form>
		</div>
        <div class="usermenu">
            <h3>帖子管理 &gt;</h3>
            <ul class="clearfix">
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=messagealllist">帖子信息</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=addmessage">发布帖子</a></li>
            </ul>
        </div>
        <div class="usermenu">
            <h3>帐号管理 &gt;</h3>
            <ul class="clearfix">
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=upinfo">修改资料</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=uppwd">修改密码</a></li>
                <li><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcertimg" class="red">认证资料上传</a></li>
            </ul>
        </div>
		
    </div>
    <div class="userright">
	


		        			<script type="text/javascript">

		        			    $(function () {
		        			        $("#upimgfile").click(function () {
		        			            ajaxFileUpload();
		        			        })
		        			    });
		        			    function ajaxFileUpload() {
		        			        $.ajaxFileUpload
                                    (
                                        {
                                            url: '/WebApi.ashx', //用于文件上传的服务器端请求地址
                                            secureuri: false, //一般设置为false
                                            fileElementId: 'file1', //文件上传空间的id属性  <input type="file" id="file" name="file" />
                                            dataType: 'json', //返回值类型 一般设置为json
                                            success: function (data, status)  //服务器成功响应处理函数
                                            {
                                                var tempid = data.img.substring(data.img.lastIndexOf('/')+1, data.img.indexOf('.'));
                                                var li = "<li id='" + tempid + "'><img src='" + data.img + "' /><p><a href=\"javascript:delimg('" + tempid + "')\" > 删除</a></p></li>";
                                                $("#piclist").append(li);
                                           
                                            },
                                            error: function (data, status, e)//服务器响应失败处理函数
                                            {
                                                alert(e);
                                            }
                                        }
                                    )
		        			        return false;
		        			    }

		        			    function delimg(tempid) {
		        			        debugger;
		        			        $.post("/WebApi.ashx", { id: tempid, method: 'delimg' });
		        			        $("#" + tempid).hide();
		        			    }


$(document).ready(function() {

   


});

function checknull()
{
	if(document.form1.p_sort.value=='0')
		{
		alert("请选择 车型");
		document.form1.p_sort.focus();
		return false;
		}
	else if(document.form1.p_brand.value=='' && document.form1.p_name.value=='')
		{
		alert("请选择或填写 品牌型号");
		document.form1.p_name.focus();
		return false;
		}
	else if(document.form1.p_price.value=='')
		{
		alert("请填写 车主报价");
		document.form1.p_price.focus();
		return false;
		}
	else if(document.form1.p_year.value=='')
		{
		alert("请选择 年份");
		document.form1.p_year.focus();
		return false;
		}
	else if(document.form1.p_month.value=='')
		{
		alert("请选择 月份");
		document.form1.p_month.focus();
		return false;
		}
	else if(document.form1.p_details.value=='')
		{
		alert("请填写 说明");
		document.form1.p_details.focus();
		return false;
		}
	else{
		window.document.form1.submit();
		document.getElementById("submittingb").style.display = '';
		document.getElementById("submitb").style.display = 'none';
		}

}
function onkeypressed()
{
	if(event.keyCode==13) 
	{
		checknull();
	}
}

function isSubmit()
{
	if(document.getElementById("submittingb").checked==true) //正在提交
	{
		document.getElementById("submitb").style.display = 'block';
		document.getElementById("submitb").type = 'image';
		document.getElementById("unreg").style.display = 'none';
	}else{
		document.getElementById("submitb").style.display = 'none';
		document.getElementById("submitb").type = 'image';
		document.getElementById("unreg").style.display = 'block';
	}
	return true;
}
</script>
<div class="commonbox">
	<h3>编辑车源</h3>
	<div class="p10" style=" display:block;  margin-bottom :10px;  ">
		<form name="form1" id="carform" enctype="multipart/form-data" method="post" action="AddCar.aspx"  >
			<table cellspacing="0" cellpadding="0" width="100%" class="maintable">
				<tbody><tr>
					<th>车型选择：</th>
					<td>
						<select name="p_sort">
							<option value="4">轿车</option><option value="28">跑车</option><option value="29">越野车</option><option value="31" selected="">商务车</option><option value="32">皮卡</option><option value="33">面包车</option><option value="34">客车</option><option value="37">货车</option><option value="36">其他</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>品牌型号：<span class="red">*</span></th>
					<td>
						<p><select name="p_brand" id="brand2">
							<option value="">请选择品牌</option><option value="1">A-奥迪</option><option value="19777">A-奥驰</option><option value="19780">A-奥玲</option><option value="957">A-阿斯顿·马丁</option><option value="771">B-奔驰Smart</option><option value="190">B-保时捷</option><option value="469">B-宾利</option><option value="144">B-标致</option><option value="302">B-宝骏</option><option value="462">B-北汽</option><option value="105">B-比亚迪</option><option value="99">B-奔驰</option><option value="773">B-奔腾</option><option value="78">B-本田</option><option value="5">B-宝马</option><option value="779">B-宝马MINI</option><option value="34">B-别克</option><option value="186">C-长安</option><option value="258">C-昌河</option><option value="254">C-长丰</option><option value="116">C-长城</option><option value="310">D-大迪</option><option value="424">D-道奇</option><option value="19782">D-大运</option><option value="658">D-大发</option><option value="669">D-东南</option><option value="224">D-东风</option><option value="192">D-大宇</option><option value="15">D-大众</option><option value="53">F-福特</option><option value="64">F-丰田</option><option value="360">F-福迪</option><option value="484">F-法拉利</option><option value="244">F-福田</option><option value="160">F-菲亚特</option><option value="769" selected="">G-GMC</option><option value="329">G-广汽</option><option value="170">H-华普</option><option value="443">H-汇众</option><option value="485">H-悍马</option><option value="363">H-海马</option><option value="147">H-哈飞</option><option value="685">H-华泰</option><option value="385">H-黑豹</option><option value="645">H-红旗</option><option value="691">J-金龙</option><option value="153">J-吉利</option><option value="19769">J-解放</option><option value="289">J-江淮</option><option value="194">J-吉普</option><option value="535">J-捷豹</option><option value="841">J-吉利帝豪</option><option value="723">J-吉利上海英伦</option><option value="654">J-金杯</option><option value="233">J-江铃</option><option value="393">J-吉奥</option><option value="175">J-吉利全球鹰</option><option value="774">K-开瑞</option><option value="632">K-凯迪拉克</option><option value="196">K-克莱斯勒</option><option value="19778">K-凯马</option><option value="547">L-路虎</option><option value="543">L-林肯</option><option value="554">L-兰博基尼</option><option value="405">L-力帆</option><option value="724">L-铃木</option><option value="648">L-陆风</option><option value="374">L-莲花</option><option value="770">L-劳斯莱斯</option><option value="213">L-雷诺</option><option value="198">L-雷克萨斯</option><option value="776">M-迈巴赫</option><option value="572">M-玛莎拉蒂</option><option value="355">M-名爵</option><option value="57">M-马自达</option><option value="85">N-尼桑</option><option value="111">N-南汽</option><option value="408">N-纳智捷</option><option value="576">O-讴歌</option><option value="580">O-欧宝</option><option value="165">Q-奇瑞</option><option value="131">Q-起亚</option><option value="978">Q-启辰</option><option value="216">R-荣威</option><option value="863">R-瑞麒</option><option value="206">S-斯巴鲁</option><option value="203">S-萨博</option><option value="19771">S-时代</option><option value="217">S-斯柯达</option><option value="19754">S-上汽大通</option><option value="376">S-曙光</option><option value="597">S-双龙</option><option value="665">S-双环</option><option value="138">S-三菱</option><option value="19781">T-唐骏</option><option value="19731">T-特斯拉</option><option value="209">W-沃尔沃</option><option value="615">W-五十铃</option><option value="370">W-威麟</option><option value="182">W-五菱</option><option value="341">W-万丰</option><option value="454">X-夏利</option><option value="47">X-现代</option><option value="123">X-雪铁龙</option><option value="501">X-雪佛兰</option><option value="389">y-依维柯</option><option value="346">y-一汽</option><option value="19773">Y-跃进</option><option value="452">y-永源</option><option value="19779">Y-跃进</option><option value="607">y-英菲尼迪</option><option value="325">Z-中顺</option><option value="327">Z-众泰</option><option value="19776">Z-重汽</option><option value="331">Z-中兴</option><option value="226">Z-中华</option>
						</select>
						<select id="subbrand2" name="p_subbrand">
							<option value="">请选择子品牌</option><option value="409">大7 SUV</option><option value="987">323</option><option value="456">2000</option><option value="796">优翼</option><option value="799">62</option><option value="812">57</option><option value="813">面包车</option><option value="457">N5</option><option value="814">勤务兵</option><option value="815">快运</option><option value="816">金典</option><option value="696">大型客车</option><option value="822">宝威</option><option value="824">SUV</option><option value="463">骑士</option><option value="988">极光</option><option value="455">N3</option><option value="783" selected="">商务之星</option><option value="763">法萨特</option><option value="764">娇子</option><option value="303">630</option><option value="854">SUV</option><option value="853">皮卡</option><option value="855">MPV</option><option value="846">夏利</option><option value="445">宝典</option><option value="446">轻卡</option><option value="698">海狮</option><option value="697">中型客车</option><option value="453">A380</option><option value="439">美鹿</option><option value="438">飓风</option><option value="712">朗风</option><option value="690">熊猫</option><option value="689">格林伯德</option><option value="659">森雅</option><option value="204">9-3</option><option value="653">GX2</option><option value="652">X6</option><option value="868">兴旺</option><option value="197">300C</option><option value="651">X9</option><option value="650">风尚</option><option value="508">翼龙</option><option value="509">F360</option><option value="878">酷搏</option><option value="660">GC7</option><option value="174">海锋</option><option value="173">海尚</option><option value="862">新雅途</option><option value="784">古思特</option><option value="668">SCEO</option><option value="243">铂锐 </option><option value="836">GT</option><option value="688">康迪</option><option value="842">EC7-RV</option><option value="687">圣达菲</option><option value="234">陆风</option><option value="232">之光</option><option value="686">特拉卡</option><option value="845">H1</option><option value="683">锐驰</option><option value="489">公羊</option><option value="219">梅甘娜</option><option value="215">拉古娜</option><option value="214">风景</option><option value="172">海迅</option><option value="404">科雷傲</option><option value="383">旗胜</option><option value="382">领航者</option><option value="381">大柴神</option><option value="380">挑战者</option><option value="379">傲龙</option><option value="378">翱龙</option><option value="377">傲羚</option><option value="942">域胜</option><option value="371">V5</option><option value="368">普力马</option><option value="367">海马3</option><option value="366">海福星</option><option value="365">福美来</option><option value="661">欢动</option><option value="384">征服者</option><option value="386">轿卡</option><option value="387">旅行家</option><option value="403">伊美</option><option value="402">凯旋</option><option value="401">帅威</option><option value="400">帅驰</option><option value="399">猛将旅</option><option value="398">凯睿</option><option value="397">GX6</option><option value="396">GS50</option><option value="395">财运</option><option value="394">奥腾</option><option value="392">得意</option><option value="391">都灵</option><option value="390">宝迪</option><option value="388">货车</option><option value="362">卡车</option><option value="361">UFO</option><option value="655">海狮</option><option value="752">海悦</option><option value="699">城市客车</option><option value="918">UFO</option><option value="330">传祺GA5</option><option value="441">M203</option><option value="326">世纪</option><option value="442">海炫</option><option value="937">远景</option><option value="444">伊思坦纳</option><option value="850">优雅</option><option value="851">优派</option><option value="314">皮卡</option><option value="313">霸道</option><option value="312">都市骏马</option><option value="751">明仕</option><option value="750">世纪星</option><option value="749">旗舰</option><option value="656">阁瑞斯</option><option value="423">大捷龙</option><option value="939">卫士</option><option value="666">小贵族</option><option value="667">来宝SRV</option><option value="425">凯领</option><option value="938">自由舰</option><option value="848">EC7</option><option value="849">幻影</option><option value="345">皮卡</option><option value="344">泰威</option><option value="343">速威</option><option value="342">多功能商务车</option><option value="701">全顺</option><option value="311">都市威菱</option><option value="171">海域</option><option value="923">H5</option><option value="556">Murcielago Coupe</option><option value="617">皮卡</option><option value="616">货车</option><option value="968">传祺GS5</option><option value="969">C20R</option><option value="970">C30</option><option value="971">C50</option><option value="972">V80</option><option value="974">GX7</option><option value="512">599GTB</option><option value="976">720</option><option value="977">MASTER CEO</option><option value="979">D50</option><option value="980">R50</option><option value="555">Gallardo</option><option value="955">骑士</option><option value="618">铁金刚</option><option value="924">X5</option><option value="925">宏光</option><option value="541">PT漫步者</option><option value="542">太阳舞</option><option value="545">领航员</option><option value="940">X8</option><option value="546">城市</option><option value="548">发现</option><option value="17013">CABRIO</option><option value="943">战旗</option><option value="947">EC8</option><option value="948">EV8</option><option value="550">揽胜</option><option value="951">CX-5</option><option value="981">E30</option><option value="982">E50</option><option value="17080">PACEMAN</option><option value="19744">缤智</option><option value="573">Coupe</option><option value="574">GranSport</option><option value="19739">荣光</option><option value="19737">熊猫</option><option value="19733">迈锐宝</option><option value="19732">MODEL S</option><option value="19759">凌渡</option><option value="19757">D90</option><option value="19756">V80</option><option value="19755">G10</option><option value="575">总裁</option><option value="577">MDX</option><option value="17057">ROADSTER</option><option value="17038">COUPE</option><option value="440">飚风</option><option value="983">江南TT</option><option value="995">H7</option><option value="19775">货车</option><option value="19774">货车</option><option value="19772">货车</option><option value="19767">杰德</option><option value="19766">CS35</option><option value="579">TL</option><option value="19764">昕锐</option><option value="19765">CS15</option><option value="19762">DS</option><option value="19761">218i</option><option value="19760">昕动</option><option value="578">RL</option><option value="549">神行者</option><option value="649">风华</option><option value="885">丘比特</option><option value="513">612</option><option value="152">民意</option><option value="151">中意</option><option value="19768">阿特兹</option><option value="150">路宝</option><option value="511">F430</option><option value="149">赛马</option><option value="148">赛豹</option><option value="892">Reventon</option><option value="887">优劲</option><option value="515">H2</option><option value="646">盛世</option><option value="514">H3</option><option value="647">概念SUV</option><option value="889">优胜</option><option value="888">优优</option><option value="884">ENZO</option><option value="510">575</option><option value="540">XF</option><option value="883">California</option><option value="537">X型</option><option value="539">XK</option><option value="880">锋哲</option><option value="109">F0</option><option value="538">XJL</option><option value="879">酷威</option><option value="164">派朗</option><option value="626">9-5</option><option value="536">S型</option><option value="927">来旺</option><option value="161">西耶那</option><option value="163">派力奥</option><option value="162">周末风</option><option value="487">典雅</option><option value="356">3</option><option value="882">迷迪</option><option value="41">GL8</option><option value="760">晶锐</option><option value="709">G系</option><option value="19738">菱致V5</option><option value="677">A1</option><option value="207">森林人</option><option value="199">ES</option><option value="19665">116i</option><option value="129">C2</option><option value="188">奔奔</option><option value="19669">K3</option><option value="19670">A160</option><option value="180">B50</option><option value="146">206</option><option value="886">和悦</option><option value="586">GT</option><option value="481">Boxster</option><option value="728">奥拓</option><option value="917">M300</option><option value="964">One-77</option><option value="747">菱悦V3</option><option value="471">雅骏</option><option value="79">CR-V</option><option value="827">C30</option><option value="260">爱迪尔</option><option value="897">CC</option><option value="630">科迈罗</option><option value="902">中国龙</option><option value="460">A1</option><option value="120">精灵</option><option value="275">飞铃</option><option value="934">K2</option><option value="930">G3</option><option value="767">威乐</option><option value="928">350</option><option value="633">CTS</option><option value="598">爱腾</option><option value="891">L3</option><option value="62">CX-7</option><option value="614">i30</option><option value="340">无限</option><option value="564">350Z</option><option value="54">蒙迪欧</option><option value="229">骏捷</option><option value="225">风行</option><option value="65">凯美瑞</option><option value="757">320</option><option value="240">帕杰罗</option><option value="893">SC5</option><option value="241">2500</option><option value="476">206CC</option><option value="426">景逸</option><option value="558">GS</option><option value="470">雅致</option><option value="717">Z200</option><option value="663">同悦</option><option value="553">L5</option><option value="681">路帝</option><option value="641">M系</option><option value="154">美人豹</option><option value="246">传奇</option><option value="832">C70</option><option value="919">C3</option><option value="259">福瑞达</option><option value="825">卡曼</option><option value="72">卡罗拉 </option><option value="265">风骏</option><option value="935">K5</option><option value="89">D22</option><option value="63">CX-9</option><option value="914">EOS</option><option value="903">ix35</option><option value="670">菱帅</option><option value="193">蓝龙</option><option value="141">蓝瑟</option><option value="867">驰鹏</option><option value="866">G5</option><option value="861">SC7</option><option value="679">安德拉</option><option value="218">明锐</option><option value="221">550</option><option value="859">B70</option><option value="231">酷宝</option><option value="82">飞度</option><option value="730">雨燕</option><option value="55">福克斯</option><option value="870">A3</option><option value="949">5</option><option value="19671">A180</option><option value="36">凯越</option><option value="19663">118i</option><option value="19750">ix25</option><option value="333">海豹</option><option value="406">520</option><option value="758">A3</option><option value="276">飞扬</option><option value="963">Rapide</option><option value="766">威姿</option><option value="293">2700</option><option value="736">CX20</option><option value="135">狮跑</option><option value="2">A4</option><option value="517">指南者</option><option value="140">戈蓝</option><option value="19664">120i</option><option value="210">S40</option><option value="956">朗动</option><option value="585">赛飞利</option><option value="90">GT-R</option><option value="557">IS</option><option value="967">B90</option><option value="107">F3</option><option value="73">汉兰达</option><option value="931">G6</option><option value="117">哈弗</option><option value="915">H530</option><option value="562">MX-5</option><option value="984">Z300</option><option value="39">凯越HRV</option><option value="895">傲虎</option><option value="159">美日</option><option value="375">竞速</option><option value="262">海豚</option><option value="817">SLS</option><option value="904">EX</option><option value="270">星光</option><option value="290">宾悦</option><option value="765">威志</option><option value="319">蒙派克</option><option value="328">2008</option><option value="334">皮卡</option><option value="748">锋范</option><option value="737">CX30</option><option value="604">C4</option><option value="731">天语SX4</option><option value="358">6</option><option value="673">得利卡</option><option value="719">嘉年华</option><option value="720">伊兰特悦动</option><option value="256">猎豹</option><option value="472">欧陆</option><option value="831">昊锐</option><option value="220">750</option><option value="680">享御</option><option value="860">TX4</option><option value="488">旅行家</option><option value="407">620</option><option value="835">207</option><option value="191">卡宴</option><option value="877">风神</option><option value="169">A5</option><option value="890">竞悦</option><option value="741">帕杰罗</option><option value="975">SUV</option><option value="599">主席</option><option value="727">利亚纳</option><option value="584">威达</option><option value="865">M1</option><option value="639">FX</option><option value="920">金鹰</option><option value="715">5008</option><option value="926">速派</option><option value="623">力狮</option><option value="840">F3R</option><option value="629">斯帕可</option><option value="708">逍客</option><option value="950">950</option><option value="619">S60</option><option value="898">207CC</option><option value="941">X60</option><option value="961">V12 Vantage</option><option value="856">福瑞迪</option><option value="635">SRX</option><option value="19751">名图</option><option value="427">小康</option><option value="274">S460</option><option value="49">伊兰特</option><option value="77">雅力士</option><option value="357">7</option><option value="605">C5</option><option value="56">S-MAX</option><option value="202">RX-8</option><option value="201">LS</option><option value="516">指挥官</option><option value="187">之星</option><option value="81">雅阁</option><option value="337">田野SUV</option><option value="230">尊驰</option><option value="705">E5</option><option value="20">波罗</option><option value="321">风景冲浪</option><option value="451">瑞鹰</option><option value="261">骏马</option><option value="350">森雅</option><option value="674">富利卡</option><option value="242">欧蓝德</option><option value="155">自由舰</option><option value="268">嘉誉</option><option value="505">凯越旅行车</option><option value="960">V8 Vantage</option><option value="638">XLR</option><option value="332">驰野</option><option value="518">牧马人</option><option value="255">骐菱</option><option value="70">锐志</option><option value="134">赛拉图</option><option value="932">M5</option><option value="430">帅客</option><option value="929">W5</option><option value="716">梦迪博朗</option><option value="916">V5</option><option value="672">菱利</option><option value="93">天籁</option><option value="725">北斗星</option><option value="359">TF</option><option value="921">金刚</option><option value="84">奥德赛</option><option value="348">特锐</option><option value="707">豪情</option><option value="145">307</option><option value="281">君阁</option><option value="662">瑞风</option><option value="19672">B180</option><option value="38">君威</option><option value="245">爱尔法</option><option value="844">酷熊</option><option value="606">C6</option><option value="603">欧雅</option><option value="946">A4L</option><option value="19716">欧洲之星</option><option value="600">柯兰多</option><option value="881">途观</option><option value="642">QX</option><option value="721">F3DM</option><option value="6">318</option><option value="524">GT</option><option value="60">M2</option><option value="823">沃蓝达</option><option value="833">劳恩斯</option><option value="622">翼豹</option><option value="582">雅特</option><option value="166">QQ</option><option value="263">面包车</option><option value="620">S70</option><option value="269">杰勋</option><option value="714">金牛星</option><option value="136">RIO锐欧</option><option value="671">菱动</option><option value="211">S80</option><option value="320">奥铃</option><option value="156">优利欧</option><option value="168">瑞虎</option><option value="335">福星</option><option value="657">夏利</option><option value="876">凌傲</option><option value="740">奇兵</option><option value="130">世嘉</option><option value="864">X1</option><option value="208">酷派</option><option value="726">浪迪</option><option value="761">科鲁兹</option><option value="59">M3</option><option value="684">花冠</option><option value="594">翼神</option><option value="944">SX6</option><option value="601">雷斯特</option><option value="602">法比亚</option><option value="664">帅铃</option><option value="19673">B200</option><option value="80">思域</option><option value="37">君越</option><option value="519">自由人</option><option value="637">凯雷德</option><option value="523">锐界</option><option value="480">911</option><option value="19717">320</option><option value="106">F6</option><option value="583">欧美佳</option><option value="200">LX</option><option value="746">汗马</option><option value="985">V10</option><option value="94">骐达</option><option value="477">307CC</option><option value="16">速腾</option><option value="8">A5</option><option value="167">东方之子</option><option value="74">皇冠</option><option value="581">欧捷利</option><option value="51">途胜</option><option value="1002">A6</option><option value="295">自由客</option><option value="559">RX</option><option value="502">赛欧</option><option value="756">豹风</option><option value="19674">B260</option><option value="19749">凌仕V6</option><option value="593">格蓝迪</option><option value="17">迈腾</option><option value="19745">翼博</option><option value="19718">320i</option><option value="247">风景海狮</option><option value="349">佳宝</option><option value="953">V60</option><option value="126">爱丽舍</option><option value="83">思迪</option><option value="901">英朗GT</option><option value="945">SX5</option><option value="734">悦翔</option><option value="482">918</option><option value="936">智跑</option><option value="958">DB9</option><option value="95">颐达</option><option value="413">308</option><option value="729">羚羊</option><option value="61">M5</option><option value="933">2</option><option value="636">帝威</option><option value="521">翼虎</option><option value="336">威虎</option><option value="428">小王子</option><option value="118">赛弗</option><option value="125">赛纳</option><option value="97">骊威</option><option value="19719">320敞篷</option><option value="108">E6</option><option value="58">M6</option><option value="875">英朗XT</option><option value="31">捷达</option><option value="189">志翔</option><option value="959">DBS</option><option value="267">赛影</option><option value="837">思铂睿</option><option value="338">金狮</option><option value="718">逸致</option><option value="429">桑蒂雅</option><option value="307">大切诺基</option><option value="676">旗云</option><option value="610">瑞纳</option><option value="347">自由风</option><option value="621">V70</option><option value="634">赛威</option><option value="525">野马</option><option value="552">吉姆尼</option><option value="631">爱唯欧</option><option value="257">黑金刚</option><option value="560">SC</option><option value="828">XC60</option><option value="121">腾翼</option><option value="98">轩逸</option><option value="283">菱绅</option><option value="3">A6L</option><option value="40">荣御</option><option value="702">风云</option><option value="195">切诺基</option><option value="339">万禧龙</option><option value="137">千里马</option><option value="19720">325</option><option value="23">帕萨特</option><option value="19752">索纳塔九</option><option value="71">兰德酷路泽</option><option value="50">索纳塔</option><option value="272">镭蒙</option><option value="522">福莱克斯</option><option value="504">乐风</option><option value="952">M8</option><option value="19736">索纳塔八</option><option value="127">凯旋</option><option value="551">凯泽西</option><option value="52">雅绅特</option><option value="96">骏逸</option><option value="19721">330</option><option value="76">威驰</option><option value="700">赛欧</option><option value="119">炫丽</option><option value="643">A7</option><option value="294">城市猎人</option><option value="954">尚酷</option><option value="922">XC70</option><option value="768">睿翼</option><option value="675">朗逸</option><option value="762">乐驰</option><option value="589">普莱特</option><option value="732">超级维特拉</option><option value="527">商务车</option><option value="128">毕加索</option><option value="273">CM8</option><option value="587">佳乐</option><option value="92">奇骏</option><option value="266">赛骏</option><option value="503">景程</option><option value="474">里程</option><option value="271">星卡</option><option value="212">XC90</option><option value="611">胜达</option><option value="19758">凌度</option><option value="4">A8L</option><option value="124">富康</option><option value="35">林荫大道</option><option value="19746">格锐</option><option value="530">FJ酷路泽</option><option value="19741">420i</option><option value="19742">428i</option><option value="19675">C180</option><option value="19735">朗行</option><option value="834">昂科雷</option><option value="966">昂科拉</option><option value="264">赛酷</option><option value="994">GT320</option><option value="26">桑塔纳</option><option value="68">霸道</option><option value="87">御轩</option><option value="973">欧诺</option><option value="627">科帕奇</option><option value="475">歌诗图</option><option value="309">雅科仕</option><option value="588">欧菲莱斯</option><option value="19676">C200</option><option value="590">索兰托</option><option value="237">金迪尔</option><option value="810">新世纪</option><option value="19679">C230</option><option value="839">G3</option><option value="722">乐骋 </option><option value="69">RAV4</option><option value="88">奥丁</option><option value="30">宝来</option><option value="905">Q3</option><option value="609">美佳</option><option value="906">G3R</option><option value="222">阳光</option><option value="478">406</option><option value="32">高尔夫</option><option value="75">普锐斯</option><option value="19677">C260</option><option value="628">子弹头</option><option value="133">嘉华</option><option value="122">赛铃</option><option value="531">大霸王</option><option value="7">520</option><option value="27">高尔</option><option value="790">Q5</option><option value="21">途安</option><option value="592">秀尔</option><option value="608">世纪</option><option value="19680">C280</option><option value="223">蓝鸟</option><option value="907">G6</option><option value="18">途锐</option><option value="132">远舰</option><option value="19722">523i</option><option value="990">途威</option><option value="613">君爵</option><option value="19678">C300</option><option value="66">佳美</option><option value="86">帕拉丁</option><option value="414">407</option><option value="612">维拉克斯</option><option value="19723">523Li</option><option value="19">甲壳虫</option><option value="10">Q7 </option><option value="899">霸锐</option><option value="19704">C63 AMG</option><option value="682">辉腾</option><option value="308">雅尊</option><option value="807">陆地巡洋舰</option><option value="205">风度</option><option value="874">408</option><option value="19724">525Li</option><option value="436">柯斯达</option><option value="19726">530Li</option><option value="566">风雅</option><option value="591">威客</option><option value="33">开迪</option><option value="48">SONATA御翔</option><option value="908">L3</option><option value="911">508</option><option value="19725">528Li</option><option value="909">M6</option><option value="568">贵士</option><option value="520">夏朗</option><option value="965">S4</option><option value="820">CL600</option><option value="986">新胜达</option><option value="67">海狮</option><option value="479">607</option><option value="19747">领翔</option><option value="19734">535</option><option value="567">途乐</option><option value="789">S5</option><option value="818">特锐</option><option value="565">西玛</option><option value="912">3008</option><option value="991">S6</option><option value="19715">GT535</option><option value="19681">CLS300</option><option value="788">S8</option><option value="913">RCZ</option><option value="91">ZN649</option><option value="19682">CLS350</option><option value="570">楼兰</option><option value="9">TT </option><option value="19683">CLS500</option><option value="19707">CLS63 AMG</option><option value="571">nv200</option><option value="678">6系</option><option value="569">公爵王</option><option value="910">S6</option><option value="838">S8</option><option value="19753">速锐</option><option value="110">福莱尔</option><option value="459">R8</option><option value="11">730Li</option><option value="19684">CLK200</option><option value="19727">740</option><option value="19729">745</option><option value="19685">CLK280</option><option value="19728">750</option><option value="19686">CLK350</option><option value="19700">E200</option><option value="19730">760</option><option value="993">Allroad quattro</option><option value="873">X1</option><option value="19701">E260</option><option value="19702">E300</option><option value="19703">E350</option><option value="19713">E63 AMG</option><option value="497">G500</option><option value="12">X3</option><option value="19709">G55 AMG</option><option value="19740">GL350</option><option value="19687">GL450</option><option value="19688">GL550</option><option value="19714">GL63 AMG</option><option value="13">X5</option><option value="19743">GLA200</option><option value="19689">GLK300</option><option value="467">X6</option><option value="19690">GLK350</option><option value="14">Z4</option><option value="465">M</option><option value="19691">ML300</option><option value="19692">ML350</option><option value="19693">ML400</option><option value="19748">ML500</option><option value="19705">ML63 AMG</option><option value="19694">R300</option><option value="19695">R350</option><option value="19696">R500</option><option value="19659">S300L</option><option value="100">S350L</option><option value="19660">S400L</option><option value="19661">S500L</option><option value="19662">S600L</option><option value="19711">S63 AMG</option><option value="19712">S65 AMG</option><option value="19697">SL300</option><option value="19698">SL350</option><option value="19699">SL500</option><option value="19710">SL63 AMG</option><option value="19666">SLK200</option><option value="19667">SLK300</option><option value="19668">SLK350</option><option value="19708">SLK55 AMG</option><option value="19706">SLS</option><option value="872">唯雅诺</option><option value="809">中誉房车</option>
						</select>
						<!-- <span id="models">
																							</span> -->
						<input type="text" name="p_name" size="25" value="蓝牌 C1可开"> <span class="gray">其他参数</span></p>
					</td>
				</tr>
				<tr>
					<th>车源图例：</th>
					<td>
						<div class="uploadbox">
				
                            
                           
				
						<ul id="piclist" class="clearfix" >
													<li id="e0b9da58e42bf9ef76a3db4e91476b9c"><img src="http://www.nb77.cn/static/css/dealer/e0b9da58e42bf9ef76a3db4e91476b9c.jpg"><p><a href="http://www.nb77.cn/dealer/index.php?mod=user&amp;ac=editcar&amp;id=415104&amp;page=1#" onclick="ajaxGet(&#39;index.php?mod=user&amp;ac=ajax&amp;p_id=415104&amp;p_pic=/upload/201605/e0b9da58e42bf9ef76a3db4e91476b9c.jpg&#39;,&#39;delPic&#39;);">删除</a></p><input type="hidden" name="p_pics[]" value="/upload/201605/e0b9da58e42bf9ef76a3db4e91476b9c.jpg">	</li>
												
													</ul>
                            	
						
                            
						</div>
                     
                        	<div  style=" height:20px; clear:both">
                        
                  <input type="file" id="file1" name="file" />                
    <input type="button" id="upimgfile" value="上传图片" />

                       </div>


					</td>
				</tr>
				<tr>
					<th>设置主图：</th>
					<td>
						<div class="td03">第 <input type="text" name="p_mainpic" size="2" value="1"> 张 <span class="gray01">默认第一张为主图，可换数字选择主图。</span></div>
					</td>
				</tr>
				<tr>
					<th>车体颜色：</th>
					<td>
						<div class="td03">
							<input type="text" name="p_color" value="黑色" size="8">
							<span class="gray01">如：黑色、白色、香槟色</span>
						</div>	
					</td>
				</tr>
				<tr>
					<th>车主报价：<span class="red">*</span></th>
					<td>
						<div class="td03"><input type="text" name="p_price" size="5" value="45.80">（万元）</div>
						<div class="td01">还价不多：</div><div class="td02"><input type="radio" name="isfixprice" value="1" checked=""> 是 <input type="radio" name="isfixprice" value="0"> 否
						</div>
					</td>
				</tr>
				<tr>
					<th>上牌日期：<span class="red">*</span></th>
					<td>
						<select name="p_year" id="p_year"><option value="">请选择年份</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011" selected="">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option></select>(年) <select name="p_month" id="p_month"><option value="">请选择月份</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05" selected="">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>(月) 
					</td>
				</tr>
				<tr>
					<th>表显里程：</th>
					<td>
						<div class="td02"><input name="p_kilometre" type="text" id="p_kilometre" size="5" value="8.00">&nbsp;(万公里)</div>
					</td>
				</tr>
				<tr>
					<th>排 气 量：</th>
					<td>
						<div class="td02"><input name="p_gas" type="text" id="p_gas" size="5" value="6.0">
						&nbsp;(升)</div>
					</td>
				</tr>
				<tr>
					<th>国产进口：</th>
					<td>
						<input type="radio" name="p_country" value="国产" checked="">国产 <input type="radio" name="p_country" value="进口" checked="">进口
					</td>
				</tr>
				<tr>
					<th>变 速 器：</th>
					<td>
						<input type="radio" name="p_transmission" value="手动档" checked="">手动档 <input type="radio" name="p_transmission" value="自动档" checked="">自动档 <input type="radio" name="p_transmission" value="手自一体">手自一体 
					</td>
				</tr>
				<tr>
					<th>排放标准：</th>
					<td>
						<select name="p_emissionstandards" id="p_emissionstandards"><option value="">请选择排放标准</option><option value="国一">国一</option><option value="国二">国二</option><option value="国三">国三</option><option value="国三+OBD">国三+OBD</option><option value="国四">国四</option><option value="国五" selected="">国五</option></select>
					</td>
				</tr>
				<tr>
					<th>燃料：</th>
					<td>
						<select name="p_fuel" id="p_fuel"><option value="">请选择燃料</option><option value="汽油" selected="">汽油</option><option value="柴油">柴油</option><option value="混动">混动</option><option value="电动">电动</option></select>
					</td>
				</tr>
				<tr>
					<th>具体说明：<span class="red">*</span></th>
					<td>
						<textarea name="p_details" rows="3" cols="60" class="textarea01">七座蓝牌房车，可以租车，全家出门旅游 公司活动必备之选。6.0排量可上蓝牌，蓝牌，蓝牌，重要的事情说三遍</textarea>
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<div class="gray01 lh150"><span class="red fb">注意：</span>发布的车源须做到图片无水印、无车商名，说明中无店铺名、网址、电话。<span><a href="http://www.nb77.cn/dealer/index.php?mod=news&amp;ac=view&amp;id=1" class="orange01 unl" target="_blank">发布规范 &gt;&gt;</a></span></div><div class="ml30 pl10">打<span class="red">*</span>号的为必填。</div>
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<div class="buttons"><input type="button" name="Submit" id="submitb" value="编辑车源" class="submit" onclick="checknull()"><div class="submit" id="submittingb" style="display:none;padding:3px 10px;background:#ccc;color:#666;width:100px;">正在提交。。。</div>
							<input type="hidden" name="ac" value="editcar">
							<input type="hidden" name="id" value="415104">
                            <input type="hidden" name="method" value="add">
							<input type="hidden" name="pstate" value="">
							<input type="hidden" name="page" value="1">
						</div>
					</td>
				</tr>
			</tbody></table>
			
		</form>
	</div>
</div>        				        														    </div>
</div>
    </asp:Content>
