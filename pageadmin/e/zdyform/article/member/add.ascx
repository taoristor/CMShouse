﻿<% @ Control  Language="C#" Inherits="PageAdmin.paform"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%Start();%>
<tr id='tr_article_title'><td class='tdhead'>标题<span style='color:#ff0000'>*</span></td><td><input type=text name='title' id='title' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("title"));}%>" style='width:400px'   maxlength="200"><span id="title_tip"></span></td></tr>
<tr id='tr_article_pa_style'><td class='tdhead'>标题样式</td><td><input type=text name='pa_style' id='pa_style' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_style"));}%>"  maxlength="200"><span id="pa_style_tip"></span></td></tr>
<tr id='tr_article_titlepic'><td class='tdhead'>标题图片</td><td><input ondblclick="if(this.value!='')window.open(this.value)" type=text name='titlepic' id='titlepic'  value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("titlepic"));}%>"  ><%if(Field_ImageUpload=="true"){%><a href="javascript:delete_file('article','titlepic',<%=InforId%>)" id="delete_titlepic" style="padding-left:2px;display:<%=r("titlepic")==""?"none":""%>" title='删除图片'><img src=/e/images/public/del.gif border=0></a><a id='upload_titlepic' href="javascript:open_upload('<%=SiteId%>','','image','article','titlepic','titlepic')" style="display:<%=r("titlepic")==""?"":"none"%>"><img src='/e/images/public/attachimg.gif' border=0  hspace=2 alt='上传图片' align=absbottom></a><%}%><span id="titlepic_tip"></span></td></tr><tr><td align="right">作者 </td><td>
<input type="text" name="pa_autor" id="pa_autor" value="<%=r("pa_autor")%>" maxlength=20>
<select onchange="if(this.options[this.selectedIndex].value!='')document.getElementById('pa_autor').value=this.options[this.selectedIndex].value">
<option value="">选择作者</option>
<option value="PageAdmin">PageAdmin</option>
<option value="佚名">佚名</option>
<option value="管理员">管理员</option>
<option value="不详">不详</option>
</select>
</td></tr>
<tr><td align="right">标题样式 </td><td>
<input type="text" name="pa_source" id="pa_source" value="<%=r("pa_source")%>" maxlength=20>
<select onchange="if(this.options[this.selectedIndex].value!='')document.getElementById('pa_source').value=this.options[this.selectedIndex].value">
<option value="">选择来源</option>
<option value="本站原创">本站原创</option>
<option value="办公室">办公室</option>
<option value="公司">公司</option>
<option value="集团">集团</option>
</select>
</td></tr>
<tr id='tr_article_pa_video'><td class='tdhead'>视频</td><td><input ondblclick="if(this.value!='')window.open(this.value)" type=text name='pa_video' id='pa_video'  value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_video"));}%>" size="50" ><%if(Field_AttachmentUpload=="true"){%><a href="javascript:delete_file('article','pa_video',<%=InforId%>)" id="delete_pa_video" style="padding-left:2px;display:<%=r("pa_video")==""?"none":""%>" title='删除文件'><img src=/e/images/public/del.gif border=0></a><a id='upload_pa_video' href="javascript:open_upload('<%=SiteId%>','','file','article','pa_video','pa_video')" style="display:<%=r("pa_video")==""?"":"none"%>"><img src='/e/images/public/attachment.gif' border=0  hspace=2 alt='上传文件' align=absbottom></a><%}%><span id="pa_video_tip"></span></td></tr><tr id='tr_article_pa_fj'><td class='tdhead'>附件</td><td><input ondblclick="if(this.value!='')window.open(this.value)" type=text name='pa_fj' id='pa_fj'  value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_fj"));}%>" size="50" ><%if(Field_AttachmentUpload=="true"){%><a href="javascript:delete_file('article','pa_fj',<%=InforId%>)" id="delete_pa_fj" style="padding-left:2px;display:<%=r("pa_fj")==""?"none":""%>" title='删除文件'><img src=/e/images/public/del.gif border=0></a><a id='upload_pa_fj' href="javascript:open_upload('<%=SiteId%>','','file','article','pa_fj','pa_fj')" style="display:<%=r("pa_fj")==""?"":"none"%>"><img src='/e/images/public/attachment.gif' border=0  hspace=2 alt='上传文件' align=absbottom></a><%}%><span id="pa_fj_tip"></span></td></tr><tr id='tr_article_pa_pics'><td class='tdhead'>图片组<br><input type='button' value='增加图片' class='f_bt' onclick="open_files('<%=SiteId%>','0','article','pa_pics','images','<%=InforId%>')"><br><input type='button' id='Edit_pa_pics' value='刷新图片' class='f_bt' onclick="Iframe_Submit('iframe_pa_pics')" style='display:none'></td><td><div id='pa_pics_box' style='width:98%;border:1px solid #cccccc;background-color:#ffffff;padding:5px 5px 5px 5px'><input type=hidden value='0' name='pa_pics' id='pa_pics'><iframe  id='iframe_pa_pics' name='iframe_pa_pics' allowtransparency='true' src='/e/aspx/file_list.aspx?id=<%=InforId%>&table=article&field=pa_pics&fieldtype=images&sid=<%=SiteId%>&from=member' frameborder=0 scroling=auto height=150px width=100% marginwidth=0 marginheight=0 align=center></iframe></div><span id="pa_pics_tip"></span></td></tr><tr id='tr_article_thedate'><td class='tdhead'>发布日期</td><td><input type=text name='thedate' id='thedate' value="<%if(post=="add"){Response.Write(""==""?DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"):"");}else{Response.Write(DateTime.Parse(r("thedate")).ToString("yyyy-MM-dd HH:mm:ss"));}%>"  maxlength="200"><a href="javascript:open_calendar('thedate',1)"><img src=/e/images/icon/date.gif border=0 height=20 hspace=2 align=absbottom></a><span id="thedate_tip"></span></td></tr>
<tr id='tr_article_pa_related_ids'><td class='tdhead'>关联信息</td><td><select name='pa_related_ids' id='pa_related_ids'  multiple  size="10"  title="双击删除"  ondblclick="clear_select('pa_related_ids');"  style="width:80%;" ></select><span id="pa_related_ids_tip"></span><%if(post=="add"){%><script type="text/javascript">Set_Selected("","pa_related_ids")</script><%}else{%><script type="text/javascript">Set_Selected("<%=r("pa_related_ids")%>","pa_related_ids")</script><%}%><!--add-->
<br><input type="button" value="选择关联信息" class="f_bt" onclick='Data_Select("选择关联信息","0",Current_SiteId,"article",Tg_Table,"pa_related_ids",1,true,"80%","80%")'></td></tr><tr id='tr_article_pa_introduct'><td class='tdhead' id='tr_article_pa_introduct'>简介</td><td><textarea name='pa_introduct' id='pa_introduct' style="width:80%;height:100px" ><%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_introduct"));}%></textarea><span id="pa_introduct_tip"></span></td></tr>
<tr id='tr_article_content'><td class='tdhead'>内容</td><td><textarea name='content' id='content' style="width:100%;height:300px"   ><%if(post=="add"){Response.Write("");}else{Response.Write(r("content"));}%></textarea><script charset="utf-8" src="/e/incs/kindeditor/kindeditor.js" type="text/javascript"></script><script type="text/javascript">var KE_content;KindEditor.ready(function(K) {KE_content= K.create("#content",{uploadJson :kindeditor_uploadJson,fileManagerJson :kindeditor_fileManagerJson,allowImageUpload:<%=Editor_ImageUpload%>,allowFlashUpload:<%=Editor_FlashUpload%>,allowMediaUpload:<%=Editor_FlashUpload%>,allowFileUpload:<%=Editor_AttachmentUpload%>,allowFileManager :false,items :kindeditor_NormalItems,filterMode :false,extraFileUploadParams:{siteid:"<%=SiteId%>"}});});</script><span id="content_tip"></span></td></tr>

<input type='hidden' name='mustname' value='标题,'><input type='hidden' name='mustfield' value='title,'><input type='hidden' name='musttype' value='text,'>
<script  type='text/javascript'>
function article_zdycheck(){
Iframe_Submit("iframe_pa_pics","1")
Set_Selected("select-all","pa_related_ids");
KE_content.sync();
return true;
}
</script>
<%End();%>






