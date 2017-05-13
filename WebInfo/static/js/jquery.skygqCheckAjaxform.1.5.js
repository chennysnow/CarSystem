/*
*Jquery ����֤�ͱ�Ajax�ύ������
*��Ҫjquery1.4�������ϰ汾֧��
*By ��ǿ 2011/03/17
*1.0��
*����ٷ���ַ��http://www.skygq.com/2010/12/29/skygq-check-ajax-form-plugins/
*/
var _trackFormMsg;
;(function($){
	$.fn.skygqCheckAjaxForm = function(settings){
		//���ѡ����ѡ��Ĳ���form������ֹ�����������
		if( !this.is("form") ) return;
		var form_id = this.selector.substring(1);
		settings = $.extend({}, $.skygqCheckAjaxForm.defaultSettings, settings || {});
		// ����skygqCheckAjaxForm�ĸ�·��
		if (!settings.root) {
			$('script').each(function(a, tag) {
				miuScript = $(tag).get(0).src.match(/(.*)jquery\.skygqCheckAjaxform\.1\.5(\.mini)?\.js$/);
				if (miuScript !== null) settings.root = miuScript[1];
			});
		}
		//�趨ajax loading��ͼƬ��ַ
		if (!settings.ajaxImage) settings.ajaxImage = settings.root + 'images/loading.gif';

		//����css��ʽ
		if ($("link[href$=skygq_valid.css]").length == 0){
			var css_href = settings.root+'css/skygq_valid.css';
			var styleTag = document.createElement("link");
			styleTag.setAttribute('type', 'text/css');
			styleTag.setAttribute('rel', 'stylesheet');
			styleTag.setAttribute('href', css_href);
			$("head")[0].appendChild(styleTag);
		}

		//װ��ajax loadingͼƬ�����ֲ�
		if ($("#skygqCheckAjaxFormOverlay").length == 0){
			$("body").append('<div id="skygqCheckAjaxFormOverlay" style="display:none;text-align:center;position:absolute;z-index:2000;left:0;top:0;background:black;cursor:hand"><img src="'+settings.ajaxImage+'" id="skygqCheckAjaxForm_image"></div>');
		}
		settings.ajaxImageObj = $("#skygqCheckAjaxForm_image");
		settings.overLayObj	= $("#skygqCheckAjaxFormOverlay");
		var	msg = "",
			formObj = this,
			checkRet = true,
			rule = $.skygqCheckAjaxForm.rule,
			isAll,
			tipname = function(namestr){
				namestr = namestr.replace(/(\.|\[|\])/g,'');
				return form_id + "tip_" + namestr.replace(/([a-zA-Z0-9])/g,"-$1");
			},
			//��������ƥ����
			typeTest = function(){
				var result = true,args = arguments;
				if(rule.hasOwnProperty(args[0])){
					var t = rule[args[0]][0], v = args[1];
					result = args.length>2 ? t.apply(arguments,[].slice.call(args,1)):($.isFunction(t) ? t(v) :t.test(v));
				}
				return result;
			},
			//������Ϣ��ʾ
			showError = function(fieldObj,filedName,warnInfo){
				checkRet = false;
				var tipObj = $("#"+tipname(filedName));
				if(tipObj.length>0) tipObj.remove();
				var tipPosition = fieldObj.next().length>0 ? fieldObj.nextAll(":last"):fieldObj;
				tipPosition.after("<span class='Wrong' id='"+tipname(filedName)+"'> "+warnInfo+" </span>");
				if(settings.isAlert && isAll) msg += "\n" + warnInfo;
			},

			//��ȷ��Ϣ��ʾ
			showRight = function(fieldObj,filedName,SuccessInfo){
				var tipObj = $("#"+tipname(filedName));
				if(tipObj.length>0) tipObj.remove();
				var tipPosition = fieldObj.next().length>0 ? fieldObj.nextAll(":last"):fieldObj;
				if (!SuccessInfo){
					SuccessInfo = '��д��ȷ';
				}
				tipPosition.after("<span class='Correct' id='"+tipname(filedName)+"'> "+ SuccessInfo +" </span>");
				_trackFormMsg = SuccessInfo + "::passed";//��������ֵ��
			},
			//focusʱ��ʾ
			showExp = function(obj){
				var i = obj, fieldObj = $("[name='"+i.name+"']",formObj[0]);
				var tipObj = $("#"+tipname(i.name));
				if(tipObj.length>0) tipObj.remove();
				var tipPosition = fieldObj.next().length>0 ? fieldObj.nextAll(":last"):fieldObj;
				if (i.focusMsg){
					tipPosition.after("<span class='Exp' id='"+tipname(i.name)+"'>"+ i.focusMsg +"</span>");
					_trackFormMsg = i.focusMsg + "::failed";//��������ֵ��
				}
			},
			//ƥ��Ա�ֵ����ʾ��
			findTo = function(objName){
				var find;
				$.each(settings.items, function(){
					if(this.name == objName && this.simple){
						find = this.simple;	return false;
					}
				});
				if(!find) find = $("[name='"+objName+"']")[0].name;
				return find;
			},
			//ajax��֤
			ajax = function (obj,fv,field){
				var i = obj, fieldObj = $("[name='"+i.name+"']",formObj[0]);
				var tipObj = $("#"+tipname(i.name));
				if(tipObj.length>0) tipObj.remove();
				var tipPosition = fieldObj.next().length>0 ? fieldObj.nextAll().eq(this.length):fieldObj.eq(this.length - 1);
				tipPosition.after("<span class='Exp' id='"+tipname(i.name)+"'>�����......</span>");
				fv = encodeURI(fv);
				$.ajax({
			        type	: obj.ajax.method || 'GET',
			        url		: obj.ajax.url,
			        data	: obj.name+"="+fv,
			        cache	: false,
			        async	: !isAll,// falseʹ��ͬ����ʽִ��AJAX��trueʹ���첽��ʽִ��ajax
			        success	: function(data){
						if (data == 1){
							showRight(field,obj.name,obj.ajax.success_msg);
						}
						else if(data == 0){
							showError(field ,obj.name, obj.ajax.failure_msg);
						}else{
							showError(field ,obj.name, data);
						}
			        }
				});
			},
			//��Ԫ����֤
			fieldCheck = function(item){
				var i = item, field = $("[name='"+i.name+"']",formObj[0]),filed_length = field.length;
				if(filed_length == 0) return;
				var warnMsg,
					fv = $.trim(field.val()),
					isRq = typeof i.require ==="boolean" ? i.require : true;
				if (filed_length == 1){
					if( isRq && ((field.is(":radio")|| field.is(":checkbox")) && !field.is(":checked"))){
						warnMsg =  i.message|| "��ѡ��" + i.simple;
						showError(field ,i.name, warnMsg);
					}else if(isRq && fv == "" ){
						warnMsg =  i.message|| ( field.is("select") ? "��ѡ��" :"����д" ) + i.simple;
						showError(field ,i.name, warnMsg);
					}else if(fv != ""){
						if(i.min || i.max){
							var len = fv.length, min = i.min || 0, max = i.max;
							warnMsg =  i.message || (max? i.simple + "���ȷ�ΧӦ��"+min+"~"+max+"֮��":i.simple + "����Ӧ����"+min);
							if( (max && (len>max || len<min)) || (!max && len<min) ){
								showError(field ,i.name, warnMsg);	return;
							}
						}
						if(i.type){
							var matchVal = i.to ? $.trim($("[name='"+i.to+"']",formObj[0]).val()) :i.value;
							var matchRet = matchVal ? typeTest(i.type,fv,matchVal) :typeTest(i.type,fv);
							warnMsg = i.message|| i.simple + rule[i.type][1];
							if(matchVal && i.simple) warnMsg += (i.to ? findTo(i.to) +"��ֵ" :i.value);
							if(!matchRet){
								showError(field ,i.name, warnMsg);return;
							}else{
								showRight(field,i.name);
							}
						}
						if (i.between){
							var from = i.between[0],to = i.between[1];
							warnMsg = i.message || i.simple + "��ֵ������" + from + "��" + to + "֮��";
							if (fv >= +from && fv <= +to){
								showRight(field,i.name);
							}else{
								showError(field ,i.name, warnMsg);return;
							}
						}
						if (i.ajax){
							ajax(i,fv,field);
						}else{
							showRight(field,i.name);
						}
					}
				}else{
					if (field.is("input:checkbox")){
						var checked_count = 0;
						field.each(function(){
							if (this.checked == true){
								checked_count ++;
							}
						});
						if(i.checked_limit){
							var min = i.checked_limit[0] || 1, max = i.checked_limit[1] || null;
							warnMsg = i.message || min==max?"�����ѡ��"+min+"��"+i.simple:(max? "��ѡ��"+i.simple + min+"��"+max+"��Ŀ":"������ѡ��" +min + "��" + i.simple);
							if( (max && (checked_count>max || checked_count<min)) || (!max && checked_count<min) ){
								showError(field ,i.name, warnMsg);	return;
							}else{
								showRight(field,i.name,'��ȷ');
							}
						}
					}
				}
			},
			//Ԫ������֤
			validate = function(){
				checkRet = true;
				$.each(settings.items, function(){
					isAll=true; fieldCheck(this);
				});
				if(settings.isAlert && msg != ""){
					alert(msg);	msg = "";
				}
				return checkRet;
			};
			//��Ԫ���¼���
			$.each(settings.items, function(){
				var field = $("[name='"+this.name+"']",formObj[0]);
				var obj = this,
				toExp = function(){showExp(obj);},
				toCheck = function(){ isAll=false; fieldCheck(obj);};
				if(field.is(":file") || field.is("select")){
					field.change(toCheck).focus(toExp);
				}else{
					field.blur(toCheck).focus(toExp);
				}
			});
			return this.each(function(){
				//�ύ�¼���
				if(settings.isAjaxSubmit) {
					formObj.submit(function(){
						if (validate()){//��֤ͨ��-ajax�ύ����
							if (settings.isBg){
								$.fn.skygqCheckAjaxForm.setPosition(formObj,settings);
							}
							$('input:submit',formObj).attr('disabled','disabled');
							formObj.skygqajaxSubmit(settings);
						}
						return false;
					});
				}else{//��ajax�ύ����
					formObj.submit(validate);
				}
			});
	};
	$.skygqCheckAjaxForm = function(){};

	$.skygqCheckAjaxForm.defaultSettings = {
		items				: [],
		isAlert				: false,
		isAjaxSubmit		: false,
		success				: $.noop,
		isBg				: true,
		clearForm			: true,
		root				: '',
		ajaxImage			: null
	};

	$.skygqCheckAjaxForm.rule	= {
		"eng" 		: [/^[A-Za-z]+$/,"ֻ������Ӣ��"],
		"chn" 		: [/^[\u0391-\uFFE5]+$/,"ֻ�����뺺��"],
		"mail" 		: [/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/,"��ʽ����ȷ"],
		"url" 		: [/^http[s]?:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/,"��ʽ����ȷ"],
		"currency" 	: [/^\d+(\.\d+)?$/,"���ָ�ʽ����"],
		"number" 	: [/^\d+$/,"ֻ��Ϊ����"],
		"int" 		: [/^[0-9]{1,30}$/,"ֻ��Ϊ����"],
		"double" 	: [/^[-\+]?\d+(\.\d+)?$/,"ֻ��Ϊ��С��������"],
		"username" 	: [/^[\u4E00-\u9FA5\w]{2,16}$/,"�û������Ϸ�"],
		"password" 	: [/^(\w){4,20}$/,"ֻ��Ϊ���ֺ�Ӣ�ļ��»��ߵ���ϣ�4-20���ַ�"],
		"safe" 		: [/>|<|,|\[|\]|\{|\}|\?|\/|\+|=|\||\'|\\|\"|:|;|\~|\!|\@|\#|\*|\$|\%|\^|\&|\(|\)|`/i,"�����������ַ�"],
		"dbc" 		: [/[��-����-�ڣ�-�������������ޣ��������ߣ������ۣݣ����������������������࡫��]/,"������ȫ���ַ�"],
		"qq" 		: [/[1-9][0-9]{4,}/,"��ʽ����ȷ"],
		"date" 		: [/^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/,"��ʽ����ȷ"],
		"telephone" : [/^1\d{10}$/,"��ʽ����ȷ"],
		"tel"       : [/^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$|(^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\d{8}$)/,"��ʽ����ȷ"],
		"zipcode" 	: [/^[1-9]\d{5}$/,"��ʽ����ȷ"],
		"bodycard" 	: [/^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\d{4}((19\d{2}(0[13-9]|1[012])(0[1-9]|[12]\d|30))|(19\d{2}(0[13578]|1[02])31)|(19\d{2}02(0[1-9]|1\d|2[0-8]))|(19([13579][26]|[2468][048]|0[48])0229))\d{3}(\d|X|x)?$/,"��ʽ����ȷ"],
		"ip" 		: [/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/,"IP����ȷ"],
		// ��������
		"eq"		: [function(arg1,arg2){ return arg1==arg2 ? true:false;},"�������"],
		"gt"		: [function(arg1,arg2){ return arg1>arg2 ? true:false;},"�������"],
		"gte"		: [function(arg1,arg2){ return arg1>=arg2 ? true:false;},"������ڻ����"],
		"lt"		: [function(arg1,arg2){ return arg1<arg2 ? true:false;},"����С��"],
		"lte"		: [function(arg1,arg2){ return arg1<=arg2 ? true:false;},"����С�ڻ����"]
	};
	$.skygqCheckAjaxForm.extendRemove = function(target, props) {
		$.extend(target, props);
		for (var name in props)
			if (props[name] == null || props[name] == undefined)
				target[name] = props[name];
		return target;
	};
	$.skygqCheckAjaxForm.addRules = function(settings) {
		$.skygqCheckAjaxForm.extendRemove($.skygqCheckAjaxForm.rule, settings || {});
		return this;
	};

	$.fn.skygqCheckAjaxForm.setPosition = function(formObj,settings){
		var form_position = formObj.offset();
		settings.overLayObj.css({
			'width' : formObj.outerWidth(),
			'height': formObj.outerHeight(),
			'top'	: form_position.top,
			'left'	: form_position.left,
			'opacity':'0.5'
		}).fadeIn();
		var image_h = settings.ajaxImageObj[0].height;
		var marginTop = parseInt((formObj.outerHeight() - image_h)/2,10);
		if (settings.ajaxImage) settings.ajaxImageObj.css('marginTop',marginTop);
	};
	$.fn.skygqajaxSubmit = function(options) {
		if (!this.length) {	return this;}
		return this.each(function(){
			var $form = $(this), callbacks = [];
			var url = $.trim($form.attr('action'));
			if (url) url = (url.match(/^([^#]+)/)||[])[1];// ��ȡurl�С�#���ַ�ǰ��ĵ�ַ
			url = url || window.location.href || '';
			options = $.extend(true, {
				url		:  url,
				type	: $form.attr('method') || 'GET',
				dataType:'html'
			}, options);

			var q = $form.serialize();

			if(options.type.toUpperCase() == 'GET') {
				options.url += (options.url.indexOf('?') >= 0 ? '&' : '?') + q;
				options.data = null;
			}else{
				options.data = q;
			}

			if (options.clearForm) {
				callbacks.push(function() { $form.clearForm(); });
			}

			callbacks.push(function(){
				$.fn.removeBg($form);
			});

			if (options.success) {
				callbacks.push(options.success);
			}

			options.success = function(data, status, xhr) {
				var context = options.context || options;
				for (var i=0, max=callbacks.length; i < max; i++) {
					callbacks[i].apply(context, [data, status, xhr || $form, $form]);
				}
			};
		   	$.ajax(options);
		});
	};

	$.fn.removeBg = function($form){
		$('#skygqCheckAjaxFormOverlay').fadeOut();
    	$('input:submit',$form[0]).removeAttr('disabled');
	};

	$.fn.clearForm = function() {
		return this.each(function() {
			$('input,select,textarea', this).clearFields();
		});
	};

	$.fn.clearFields = function() {
		return this.each(function() {
			var t = this.type, tag = this.tagName.toLowerCase();
			if (t == 'text' || t == 'password' || tag == 'textarea') {
				this.value = '';
			}
			else if (t == 'checkbox' || t == 'radio') {
				this.checked = false;
			}
			else if (tag == 'select') {
				this.selectedIndex = -1;
			}
		});
	};
})(jQuery);