<% @ Control Language="C#" Inherits="PageAdmin.detail_zdymodel"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%=Zdy_Location%>
<div class="sublanmu_box sublanmu_box_<%=Sublanmu_Id%>" id="sublanmu_box">
<div class="sublanmu_content" id="sublanmu_content">
<%conn.Open();%><%
string SortId="",video="",Content="";
Site_Id=1;
DataTable dt=Get_Data();
string Related_Ids="";
 
DataRow dr; 
if(dt.Rows.Count>0)
 {
  dr=dt.Rows[0];
  SortId=dr["sort_id"].ToString();
%>
<div class="productinfor">
<ul>
<li class="title"><h1><%=Server.HtmlEncode(dr["title"].ToString())%>
</h1></li>
</ul>
<div id="ProdImages" class="slide_focus focus_style1"><a class="prev"></a><a class="next"></a>
 <ul class="inner">
<%
DataTable dt1=Get_File("product","pa_images",Detail_Id);
DataRow dr1;
for(int i=0;i<dt1.Rows.Count;i++)
 {
   dr1=dt1.Rows[i];
%>
 <li><a href="javascript:void(0)"><img src="<%=dr1["url"]%>"><em><%=dr1["title"]%></em></a></li>
<%}%>
<ul>
</div>
<script type="text/javascript">
$(function(){Slide_Focus("ProdImages",1,3,0,0,true);});
</script>
<div class="info">
<strong>产品名称：</strong><%=dr["title"].ToString()%><br>
<strong>产品型号：</strong><%=dr["title"].ToString()%><br>
<%if(dr["price"].ToString()!="0"){%><strong>产品价格：</strong><%=dr["price"].ToString()%><%}%>
</div>
<dl id="tabhead"  class="tabhead">
<dd>产品介绍</dd>
<dd>技术参数</dd>
</dl>
<dl id="tabcontent"  class="tabcontent">
<dd><%=Add_KeyLink(dr["content"].ToString(),7,false)%></dd>
<dd><%=dr["pa_jscs"].ToString()%></dd>
</dl>
<script type="text/javascript">
tabs("tabhead","tabcontent","onclick");
</script>
</div>
<%}
%><%conn.Close();%>
<script type="text/javascript">Get_Info("<%=Thetable%>","<%=Detail_Id%>")</script>
<asp:PlaceHolder id="P_Comment" runat="server"/></div></div>