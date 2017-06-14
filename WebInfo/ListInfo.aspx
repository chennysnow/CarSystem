<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.Master" AutoEventWireup="true" CodeBehind="ListInfo.aspx.cs" Inherits="WebInfo.ListInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>       
        $(function () {
            var id ='<%=dispid %>';
            if (id != "") {
                disp(id);
            }
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
                                <h3 class="am-list-item-hd"><i class="am-icon-cube" style=" color: #5eb95e;  padding-right: 4Px;"></i><a href="javascript:void(0);" onclick="disp('d<%=v.id %>')"><%=v.title %></a></h3>
                                <div class="am-list-item-text" data-id="infotxt" data-lx="<%=v.contact %>" data-date="<%=v.cdate %>"><%=v.context %></div>
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
</asp:Content>
