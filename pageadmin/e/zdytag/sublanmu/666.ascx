<% @ Control  Language="C#" Inherits="PageAdmin.patag"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%Start();%>
<script type="text/javascript" src="/e/js/zdyform.js"></script>
<style type='text/css'>
.xsyd_table{border:1px solid #eeeeee}
.xsyd_table td{border:1px solid #eeeeee;padding:5px}
</style>
<form name="xsyd" method="post" Enctype="multipart/form-data" action="/e/aspx/post.aspx">
<table border=0 cellpadding=0 cellspacing=0  align=center width=95% class="xsyd_table">
<tr><td align=right>订购产品 <span style="color:#ff0000">*</span></td><td><input type=text name="title" id="title" value="" maxlength="50" ></td></tr>
<tr><td align=right>你的姓名 <span style="color:#ff0000">*</span></td><td><input type=text name="pa_ndxm" id="pa_ndxm" value="" maxlength="50" ></td></tr>
<tr><td align=right>联系号码 <span style="color:#ff0000">*</span></td><td><input type=text name="pa_sjhm" id="pa_sjhm" value="" maxlength="50" ></td></tr>
<tr><td align=right>联系邮箱 <span style="color:#ff0000">*</span></td><td><input type=text name="pa_lxyx" id="pa_lxyx" value="" maxlength="50" ></td></tr>
<tr><td align=right>留言内容 <span style="color:#ff0000">*</span></td><td><textarea name="content" id="content" ></textarea></td></tr>
<tr><td align=right>验证码<span style="color:#ff0000">*</span></td><td><input type=text name="vcode" id="vcode" maxlength=4 size=4> <img src="/e/aspx/yzm.aspx" onclick=Code_Change("vcode_img") align=absmiddle border=0 id="vcode_img" style="cursor:pointer" alt="点击更换"></td></tr>
<tr><td colspan=2 align=center><input type="hidden" name="checked" value="0"><input type="hidden" name="showcode" value="0"><input type="hidden" name="to" value=""><input type="hidden" name="mailto" value=""><input type="hidden" name="mailreply" value=""><input type="hidden" name="mailsubject" value=""><input type="hidden" name="mailbody" value=""><input type="hidden" name="insertdatabase" value="1"><input type="hidden" name="siteid" value="1"><input type="hidden" name="formtable" value="xsyd"><input type="hidden" name="mustname" value="订购产品,你的姓名,联系号码,联系邮箱,留言内容,"><input type="hidden" name="mustfield" value="title,pa_ndxm,pa_sjhm,pa_lxyx,content,"><input type="hidden" name="musttype" value="text,text,text,text,textarea,"><input type="button" class="bt" value=" 提交 " onclick="return set_xsyd()"> <input type="reset" value=" 重设 " class="bt-1"></td></tr></table>
</form>
<script type="text/javascript">
var prod=Request("prod");
document.getElementById("title").value=prod;
function set_xsyd()
{
document.forms["xsyd"].mailto.value="";
document.forms["xsyd"].mailreply.value="";
document.forms["xsyd"].mailsubject.value="";
document.forms["xsyd"].mailbody.value="";
return Check_ZdyForm("xsyd");
}

function xsyd_zdycheck(){
return true;
}
</script>

<%End();
if(PageCount>1)
{
string PageHtml="<div id=\"sublanmu_page\" class=\"sublanmu_page\">";
if(CurrentPage==1)
{
if(APage_LinkText[0]!=""){PageHtml+="<span class=\"firstpage\">"+APage_LinkText[0]+"</span>";} //首页
}
else if(CurrentPage>1)
{
 if(APage_LinkText[0]!=""){PageHtml+="<a href=\""+GoPage(1)+"\" class=\"firstpage\">"+APage_LinkText[0]+"</a>";} //首页
 if(APage_LinkText[1]!=""){PageHtml+=" <a href=\""+GoPage(CurrentPage-1)+"\" class=\"prevpage\">"+APage_LinkText[1]+"</a>";} //上一页
}
 int p=8; //表示开始时显示的页码总数
 int M=4; //超过p页后左右两边显示页码数
 int LastPage=1;
 if(CurrentPage<p)
  {
    LastPage=p;
    if(LastPage>PageCount)
     {
       LastPage=PageCount;
     }
    for(int i=1;i<=LastPage;i++)
    {
     if(CurrentPage==i)
      {
        PageHtml+=" <span class=\"c\">"+i.ToString()+"</span>";
      }
    else
      {
       PageHtml+=" <a href=\""+GoPage(i)+"\">"+i.ToString()+"</a>";
      }
    }
  }
 else
  {
    //PageHtml+=" <a href=\""+GoPage(CurrentPage-1)+"\">1...</a>";
    LastPage=CurrentPage+M;
    if(LastPage>PageCount)
     {
       LastPage=PageCount;
     }
    for(int i=(CurrentPage-M);i<=LastPage;i++)
    {
     if(CurrentPage==i)
      {
        PageHtml+=" <span class=\"c\">"+i.ToString()+"</span>";
      }
    else
      {
       PageHtml+=" <a href=\""+GoPage(i)+"\">"+i.ToString()+"</a>";
      }
    }

  }

if(CurrentPage<PageCount)
{
  if(LastPage<PageCount)
   {
     PageHtml+=" <a href=\""+GoPage(LastPage+1)+"\">...</a>";
   }
  if(APage_LinkText[2]!=""){PageHtml+=" <a href=\""+GoPage(CurrentPage+1)+"\" class=\"nextpage\">"+APage_LinkText[2]+"</a>";}  //下一页
  if(APage_LinkText[3]!=""){PageHtml+=" <a href=\""+GoPage(PageCount)+"\" class=\"lastpage\">"+APage_LinkText[3]+"</a>";}     //尾页
}
else if(CurrentPage==PageCount)
{
if(APage_LinkText[3]!=""){PageHtml+=" <span class=\"lastpage\">"+APage_LinkText[3]+"</span>";}     //尾页
}
if(Page_LinkInfo!=""){PageHtml+=" <span class=\"pageinfo\">"+String.Format(Page_LinkInfo,CurrentPage,PageCount,RecordCount)+"</span>";} //记录页次
PageHtml+="</div>";
Response.Write(PageHtml);
}%>