<% @ Control Language="C#" Inherits="PageAdmin.detail_zdymodel"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%=Zdy_Location%>
<div class="sublanmu_box sublanmu_box_<%=Sublanmu_Id%>" id="sublanmu_box">
<div class="sublanmu_content" id="sublanmu_content">
<%conn.Open();%><script type="text/javascript" src="/e/js/zoom.js"></script>
<link href="/e/css/zoom.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="/e/js/product.js"></script>
<% 
int i,Id,P_SortId;
string Price,Point;
DataTable dt,dt1;
dt=Get_Data();
string Related_Ids="";
 
DataRow dr,dr1; 
if(dt.Rows.Count>0)
 {
  dr=dt.Rows[0]; 
  Id=int.Parse(dr["id"].ToString());
  P_SortId=int.Parse(dr["sort_id"].ToString());
  Price=dr["price"].ToString();
  Point=dr["point"].ToString();
%>
<div class="product_pic_infor">
<ul>
<li class="left">
<div class="view" id="view" style="position:relative">
<%
dt1=Get_File("product","pa_images",Id);
for(i=0;i<dt1.Rows.Count;i++)
 {
  dr1=dt1.Rows[i];
%><img class="zoom" src="<%=dr1["thumbnail"]%>" big="<%=dr1["url"]%>" border="0" id="picture" name="picture" style="display:<%=i==0?"":"none"%>">
<%}%></div>
<div class="clear"></div>
<!--缩略图区域--->
<%if(int.Parse(dr["pa_images"].ToString())>1){%>
<a class="leftbar" onclick="roll('left')"></a>
<div class="thumbnails" id="thumbnails"><ul>
<%
dt1=Get_File("product","pa_images",Id);
for(i=0;i<dt1.Rows.Count;i++)
 {
  dr1=dt1.Rows[i];
%>
<li onclick="LoadImg(<%=i%>)"><img src="<%=dr1["thumbnail"]%>" id="thumbnail" name="thumbnail"></li>
<%}%></ul></div>
<a class="rightbar" onclick="roll('right')"></a>
<%}%>
<!--缩略图区域--->
</li>
<li class="right">
<span class="title"><%=dr["title"]%></span>
<span style="display:block;font-size:13px;line-height:30px;">Type of the products:<%=SubStr(dr["pa_xinghao"].ToString(),50,true)%></span>
<%if(Price!="" && Price!="0"){%><span style="display:block;font-size:13px;line-height:30px;">Product price:<%=Price%>Yuan &nbsp;<a href="javascript:ordercart('<%=Site_Id%>','product',<%=Id%>)" style="color:#ff0000">[Online ordering]</a></span><%}%>
<%if(Point!="" && Point!="0"){%>Points required:<%=Point%>点 &nbsp;<a href="javascript:exchange('<%=Site_Id%>','product',<%=Id%>)" style="color:#ff0000">[Redeem points]</a><br><%}%>
<%=Ubb(dr["pa_introduction"].ToString())%>
<div class="lj-box"><input type="hidden" id="currentimage"><a class="pro-ckdt" href=javascript:ShowImage()>Zoom</a><a class="pro-xsyd" target="_blank" href="/index.aspx?lanmuid=82&sublanmuid=666&prod=<%=Server.UrlEncode(dr["title"].ToString())%>">Reservation</a></div>
</li>
<li class="clear"></li>
</ul>
</div>
<br>

<div class="prodinfotab">
<div class="tabheader"><dl class="tab_t" id="tab_t">
<dd>Introduction</dd><dd>Parameters</dd>
</dl></div>
<div class="tabcontent"><dl class="tab_c" id="tab_c">
<dd><%=dr["content"]%></dd>
<dd><%=dr["pa_jscs"].ToString()%>
</dd>
</dl></div>
</div>
<script type="text/javascript">
tabs("tab_t","tab_c","onclick")
window.onload=function(){zoom({width:300,height:200});}
</script>
<%
}
%><%conn.Close();%>
<script type="text/javascript">Get_Info("<%=Thetable%>","<%=Detail_Id%>")</script>
<asp:PlaceHolder id="P_Comment" runat="server"/></div></div>