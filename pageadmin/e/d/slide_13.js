﻿var Show_Style=1;
var Image_13=new Array();
var Pics="/e/upload/s1/article/image/2015/08/10162038.jpg|/e/upload/s1/article/image/2015/08/10162021.jpg|/e/upload/s1/article/image/2015/08/10162000.jpg|/e/upload/s1/article/image/2015/08/10161941.jpg|/e/upload/s1/article/image/2015/08/10161922.jpg";
var Links="/index.aspx?lanmuid=62&sublanmuid=648&id=476|/index.aspx?lanmuid=62&sublanmuid=648&id=475|/index.aspx?lanmuid=62&sublanmuid=648&id=474|/index.aspx?lanmuid=62&sublanmuid=648&id=473|/index.aspx?lanmuid=62&sublanmuid=648&id=472";
var Titles="企业相册6|企业相册5|企业相册4|企业相册3|企业相册2";
var Alts="企业相册6|企业相册5|企业相册4|企业相册3|企业相册2";
var Apic13=Pics.split('|');
var ALink13=Links.split('|');
var ATitle13=Titles.split('|');
var AAlts13=Alts.split('|');
var Show_Text=1;
for(i=0;i<Apic13.length;i++)
  {
   Image_13.src = Apic13[i]; 
  }



  var FHTML='<div id="js_slide_focus_13" class="slide_focus focus_style1" style="height:160px"><a class="prev"></a><a class="next"></a>';
  FHTML+='<ul class="inner">';
  for(var i=0;i<Apic13.length;i++)
   {
     if(ALink13.length<(i+1) || ALink13[i]=="")
      {
       ALink13[i]="javascript:void(0)";
      }
     if(AAlts13.length<(i+1))
      {
       AAlts13[i]="";
      }
     if(ATitle13.length<(i+1))
      {
       ATitle13[i]="";
      }
    FHTML+='<li><a href="'+ALink13[i]+'" target="_self" title="'+AAlts13[i]+'"><img src="'+Apic13[i]+'">';
    FHTML+='<em>'+ATitle13[i]+'</em>';
    FHTML+='</a></li>';
   }
 FHTML+='</ul>';
 FHTML+='</div>';
 document.write(FHTML);
$(function(){Slide_Focus("js_slide_focus_13",0,5,290,160,false);});
