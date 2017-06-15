<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.Master" AutoEventWireup="true" CodeBehind="ListInfo.aspx.cs" Inherits="WebInfo.ListInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>       
        $(function () {
            var id ='<%=dispid %>';
            if (id != "") {
                disp(id);
            }


            $('div.userinfo button.am-btn').
                on('click', function () {
                    $('#my-confirm').modal({
                        relatedTarget: this,
                        onConfirm: function (options) {
                            $("form").submit();
                        },
                        // closeOnConfirm: false,
                        onCancel: function () {
                            
                        }
                    });
                });



        });

        function disp(e) {  
            var $modal = $('#Mmodal');
            var dat = $("#"+e);
            var title =$("h3" ,dat).text();
            var $dom = $("div[data-id='infotxt']", dat);
            var context = $dom.text();
            var lx = $dom.attr("data-lx");
            var date = $dom.attr("data-date");

            $("#disptitle").text(title);
            $("#dispcontext").text(context);
            $("#dispot").text("联系："+lx + " 日期：" + date);
            $modal.modal();            
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="context" runat="server">
<div class="category2top">
    <div class="am-g am-container userinfo">
        <div class="am-u-sm-12 am-u-md-12 am-u-lg-3 userinfo_left">
            <div class="am-g">
                <div class="am-u-md-12 am-u-lg-6 userface">
                    <img src="jscss/images/user1.png">
                </div>
                <div class="am-u-md-12 am-u-lg-6 userin" style=" padding-top: 16px;">
                    <h3>91车联盟</h3>                    
                    
                    <button type="button" class="am-btn am-btn-warning am-hide-lg-only" style="margin: 0 auto; margin-top: 30px">
                        <i class="am-icon-plus"></i>
                        发布信息
                    </button>
                </div>
            </div>

        </div>
        <div class="am-u-sm-0 am-u-md-12 am-u-lg-7 am-show-lg-only userinfo_center">
            随着信息技术应用的普及，人们对信息体系的依赖性越来越强,信息安全已成为日趋突出。
        </div>
        <div class="am-u-sm-12 am-u-md-12 am-u-lg-2 am-show-lg-only userinfo_right">
                <button type="button" class="am-btn am-btn-warning">
                    <i class="am-icon-plus"></i>发布信息</button>
        </div>

    </div>
</div>
    <div class="am-g">
        <div class="am-u-sm-0 am-u-md-2 am-u-lg-3">&nbsp;</div>
        <div class="am-u-sm-12 am-u-md-8 am-u-lg-6">
            <div data-am-widget="list_news" class="am-list-news am-list-news-default  am-no-layout">
                <div class="am-list-news-bd">
                    <ul class="am-list">
                        <%foreach (var v in listinfo)
                            {%>
                        <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left" style="border-top: 0px" id="d<%=v.id %>">
                            <div class=" am-u-sm-9 am-list-main">
                                <h3 class="am-list-item-hd"><i class="am-icon-cube" style=" color: #5eb95e;  padding-right: 4Px;"></i><a href="javascript:void(0);" onclick="disp('d<%=v.id %>')"><%=v.type==3?"[买车]":"" %>  <%=v.type==4?"[卖车]":"" %>  <%=v.title %></a></h3>
                                <div class="am-list-item-text" data-id="infotxt" data-lx="<%=islogin?v.contact:"" %>" data-date="<%=v.cdate %>"><%=v.context %></div>
                            </div>
                        </li>
                        <div class="newsico am-fr">
                            <i class="am-icon-clock-o"><%=v.cdate.ToShortDateString() %></i>
                            <%if (v.type == 2)
                                {%>
                            <i class="am-icon-arrow-up" style="color: #f37b1d;"></i>
                            <%} %>
                        </div>
                        <%} %>

                    </ul>
                    <ul data-am-widget="pagination" class="am-pagination am-pagination-default am-no-layout" style="text-align: center">
                        <li class="am-pagination-first ">
                            <%if (page == 1)
                                { %>
                            <a href="javascript:;" class="">第一页</a>
                            <%}
    else
    { %><a href="listinfo.aspx?page=1" class="">第一页</a>
                            <%} %>
                        </li>

                        <li class="am-pagination-prev ">
                            <%if (page == 1)
                                { %>
                            <a href="javascript:;" class="">上一页</a>
                            <%}
    else
    { %><a href="listinfo.aspx?page=<%=page-1 %>" class="">上一页</a>
                            <%} %>
                        </li>
                       <li id="wos-pagination-next-more" style="padding: 5px; border: 1px solid #ccc; margin-right: 7px;"><%=page %>/<%=totalpage %></li>                    
                        <%if (page >= totalpage)
                                { %>
                            <a href="javascript:;" class="">下一页</a>
                            <%}
    else
    { %><a href="listinfo.aspx?page=<%=page+1 %>" class="">下一页</a>
                            <%} %>
                        </li>
                        <li class="am-pagination-last ">
                        <%if (page >= totalpage)
                                { %>
                            <a href="javascript:;" class="">最末页</a>
                            <%}
                        else
                        { %><a href="listinfo.aspx?page=<%=totalpage%>" class="">最末页</a>
                                                <%} %>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="am-u-sm-0 am-u-md-2 am-u-lg-3">&nbsp;</div>
    </div>

  <div class="am-modal am-modal-no-btn" tabindex="-1" id="Mmodal" style="top:35%">

      <section class="am-panel am-panel-default">
  <header class="am-panel-hd">
    <h3 class="am-panel-title" id="disptitle">标题</h3>
  </header>
  <div class="am-panel-bd" id="dispcontext" style="text-align: left;">

  </div>
<footer class="am-panel-footer" id="dispot" style="
    color: #999999;
">页脚</footer>
</section>
</div>

    
  <div class="am-modal am-modal-no-btn" tabindex="-1" id="infomodal" style="top:35%">

      <section class="am-panel am-panel-default">
  <header class="am-panel-hd">
    <h3 class="am-panel-title" id="disptitle">发布信息</h3>
  </header>
  <div class="am-panel-bd" id="dispcontext" style="text-align: left;">


  </div>

</section>
</div>

    <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm" style="top:20%">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">发布信息</div>
        <div class="am-g tpl-amazeui-form">
                        <div class="am-u-sm-12 am-u-md-12">
                            <form class="am-form am-form-horizontal" action="listinfo.aspx" method="POST" >
                                <div class="am-form-group">
                                    <label for="title" class="am-u-sm-2 am-form-label">标题 </label>
                                    <div class="am-u-sm-10">
                                        <input type="text" name="title" id="title" placeholder="标题">
                                        <small> </small>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="context" class="am-u-sm-2 am-form-label">内容</label>
                                     <div class="am-u-sm-10">
					                    <textarea class="" rows="5" name="context" id="context" placeholder="输入内容"></textarea>                                      
                                        <small> </small>
                                    </div>
                                </div>
    

                                <div class="am-form-group">
                                    <label for="type" class="am-u-sm-2 am-form-label">类型 </label>
                                    <div class="am-u-sm-10" style="text-align: left;">
                                        <label class="am-radio-inline">
                                        <input type="radio"  value="3" name="type"  checked> 买车
                                      </label>
                                      <label class="am-radio-inline">
                                        <input type="radio" value="4" name="type"> 卖车
                                      </label>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="contact" class="am-u-sm-2 am-form-label">电话</label>
                                    <div class="am-u-sm-10">
                                        <input type="text"  name="contact" id="contact" placeholder="输入你电话号码">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="username" class="am-u-sm-2 am-form-label">联系人</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" id="username" name="username" placeholder="输入你称呼 Twitter">
                                    </div>
                                </div>  
                                <div class="am-form-group">
                                    <label class="am-u-sm-12 am-form-label">信息发布后,请等待审核通过!</label>
                                    
                                </div>                                  
                            </form>
                        </div>
        </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>

</asp:Content>
