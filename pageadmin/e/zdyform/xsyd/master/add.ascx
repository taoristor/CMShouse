<% @ Control  Language="C#" Inherits="PageAdmin.paform"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%Start();%>
<tr id='tr_xsyd_title'><td class='tdhead'>订购产品<span style='color:#ff0000'>*</span></td><td><input type=text name='title' id='title' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("title"));}%>"  maxlength="200"><span id="title_tip"></span></td></tr>
<tr id='tr_xsyd_pa_ndxm'><td class='tdhead'>你的姓名<span style='color:#ff0000'>*</span></td><td><input type=text name='pa_ndxm' id='pa_ndxm' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_ndxm"));}%>"  maxlength="200"><span id="pa_ndxm_tip"></span></td></tr>
<tr id='tr_xsyd_pa_sjhm'><td class='tdhead'>联系号码<span style='color:#ff0000'>*</span></td><td><input type=text name='pa_sjhm' id='pa_sjhm' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_sjhm"));}%>"  maxlength="200"><span id="pa_sjhm_tip"></span></td></tr>
<tr id='tr_xsyd_pa_lxyx'><td class='tdhead'>联系邮箱<span style='color:#ff0000'>*</span></td><td><input type=text name='pa_lxyx' id='pa_lxyx' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_lxyx"));}%>"  maxlength="200"><span id="pa_lxyx_tip"></span></td></tr>
<tr id='tr_xsyd_content'><td class='tdhead' id='tr_xsyd_content'>留言内容<span style='color:#ff0000'>*</span></td><td><textarea name='content' id='content'  ><%if(post=="add"){Response.Write("");}else{Response.Write(r("content"));}%></textarea><span id="content_tip"></span></td></tr>

<input type='hidden' name='mustname' value='订购产品,你的姓名,联系号码,联系邮箱,留言内容,'><input type='hidden' name='mustfield' value='title,pa_ndxm,pa_sjhm,pa_lxyx,content,'><input type='hidden' name='musttype' value='text,text,text,text,textarea,'>
<script  type='text/javascript'>
function xsyd_zdycheck(){
return true;
}
</script>
<%End();%>






