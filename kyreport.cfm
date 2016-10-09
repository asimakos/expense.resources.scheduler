<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">

<cfif not isdefined("cookie.userid")>
<cfabort>
</cfif>

<cfajaximport tags="cfdiv">

<html>
<head>
	<title>Εκτύπωση &nbsp; Πιστώσεων &nbsp; Περιφερειακών &nbsp; Διεύθυνσεων</title>
	<SCRIPT src="perif.js" charset="iso-8859-7">
	</SCRIPT>
	<SCRIPT src="newfund.js" charset="iso-8859-7">
	</SCRIPT>
</head>
<body onunload="save_button()">
<cflayout name="thelayout" type="hbox">
<cflayoutarea style="height:400;">
<cflayout name="thelayout" type="border">

<cflayoutarea position="top" align="center">
<font style="color:#0000CC " size="+2"> ΥΠΟΥΡΓΕΙΟ ΟΙΚΟΝΟΜΙΚΩΝ </font> <br/>
<font style="color: #996666" size="+1"> ΣΩΜΑ ΔΙΩΞΗΣ ΟΙΚΟΝΟΜΙΚΟΥ ΕΓΚΛΗΜΑΤΟΣ (ΣΔΟΕ) </font>
</cflayoutarea>

<cflayoutarea  position="center" align="center" overflow="auto">

<STYLE>

TH {font-family:arial;font-size:smaller;background:#FFCC00;color:black}
TD {font-family:arial;font-size:smaller}
TD.DataA {background:silver;color:black}
TD.DataB {background:lightgrey;color:black}

</STYLE>


<p align="center">
<font size="+1"><b> ΣΔΟΕ Κεντρική Υπηρεσία - Πιστώσεις &nbsp; Περιφερειακών &nbsp; Διευθύνσεων </b></font>
<br>
<form>
<input type="Button" name="print" value="εκτύπωση αναφοράς" onclick="window.print();">&nbsp; &nbsp;
<input type="Button" name="clear" value="κλείσιμο αναφοράς" onclick="close_kyreport()">&nbsp; &nbsp;
<input type="Button" name="sum" value="Σύνολα Αποδόσεων" onclick="total_sum()">
</form>
</p>
<br>

<cfdiv style="position:absolute; top:90px; width:1250px; height:400px; left:2px; overflow:auto; background-color:##FFFFCC">

<cfdiv id="syn"  style="position:absolute; top:30px; left:4px; width:15px;"> <b> ΣΥΝ. </b> </cfdiv>

<cfdiv  bind="javascript:getkae_code()" style="position:absolute; top:80px; left:4px; width:10px;"> </cfdiv>

<cfdiv  id="syn1" style="position:absolute; top:30px; left:40px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_110()" style="position:absolute; top:80px; left:40px; width:70px;"> </cfdiv>

<cfdiv  id="syn2" style="position:absolute; top:30px; left:110px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_120()" style="position:absolute; top:80px; left:110px; width:160px;"> </cfdiv>

<cfdiv  style="position:absolute; top:60px; left:270px; width:290px;"> <b> ΑΝΑΤΟΛΙΚΗ ΜΑΚΕΔΟΝΙΑ-ΘΡΑΚΗ </b> </cfdiv>

<cfdiv  id="syn3" style="position:absolute; top:30px; left:250px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_130a()" style="position:absolute; top:80px; left:250px; width:160px;"> </cfdiv>

<cfdiv  id="syn4" style="position:absolute; top:30px; left:320px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_130b()" style="position:absolute; top:80px; left:320px; width:200px;"> </cfdiv>

<cfdiv  id="syn5" style="position:absolute; top:30px; left:460px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_130c()" style="position:absolute; top:80px; left:460px; width:100px;"> </cfdiv>

<cfdiv  id="syn6" style="position:absolute; top:30px; left:565px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_140()" style="position:absolute; top:80px; left:565px; width:60px;"> </cfdiv>

<cfdiv style="position:absolute; top:60px; left:760px; width:110px;"> <b> ΗΠΕΙΡΟΥ </b> </cfdiv>

<cfdiv  id="syn7" style="position:absolute; top:30px; left:710px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_150a()" style="position:absolute; top:80px; left:710px; width:90px;"> </cfdiv>

<cfdiv  id="syn8" style="position:absolute; top:30px; left:800px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_150b()" style="position:absolute; top:80px; left:800px; width:110px;"> </cfdiv>

<cfdiv  style="position:absolute; top:60px; left:920px; width:110px;"> <b> ΘΕΣΣΑΛΙΑΣ  </b> </cfdiv>

<cfdiv  id="syn9" style="position:absolute; top:30px; left:890px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_160a()" style="position:absolute; top:80px; left:890px; width:110px;"> </cfdiv>

<cfdiv  id="syn10" style="position:absolute; top:30px; left:970px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_160b()" style="position:absolute; top:80px; left:970px; width:90px;"> </cfdiv>

<cfdiv  id="syn11" style="position:absolute; top:30px; left:1050px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_170()" style="position:absolute; top:80px; left:1050px; width:110px;"> </cfdiv>

<cfdiv  id="syn12" style="position:absolute; top:30px; left:1160px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_180()" style="position:absolute; top:80px; left:1160px; width:110px;"> </cfdiv>

<cfdiv  id="syn13" style="position:absolute; top:30px; left:1280px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_190()" style="position:absolute; top:80px; left:1280px; width:110px;"> </cfdiv>

<cfdiv  style="position:absolute; top:60px; left:1410px; width:150px;"> <b> ΠΕΛΟΠΟΝNΗΣΟΥ  </b> </cfdiv>

<cfdiv  id="syn14" style="position:absolute; top:30px; left:1380px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_200a()" style="position:absolute; top:80px; left:1380px; width:110px;"> </cfdiv>

<cfdiv  id="syn15" style="position:absolute; top:30px; left:1470px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_200b()" style="position:absolute; top:80px; left:1470px; width:110px;"> </cfdiv>

<cfdiv  id="syn16" style="position:absolute; top:30px; left:1570px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_210()" style="position:absolute; top:80px; left:1570px; width:110px;"> </cfdiv>

<cfdiv  id="syn17" style="position:absolute; top:30px; left:1670px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_220()" style="position:absolute; top:80px; left:1670px; width:110px;"> </cfdiv>

<cfdiv  id="syn18" style="position:absolute; top:30px; left:1750px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_230()" style="position:absolute; top:80px; left:1750px; width:110px;"> </cfdiv>

<cfdiv  id="syn19" style="position:absolute; top:30px; left:1810px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_250()" style="position:absolute; top:80px; left:1810px; width:110px;"> </cfdiv>

<cfdiv  id="syn20" style="position:absolute; top:30px; left:1870px; width:70px;"> </cfdiv>

<cfdiv  bind="javascript:getp_260()" style="position:absolute; top:80px; left:1870px; width:110px;"> </cfdiv>

</cfdiv>
<br>
<br>

<cfdiv bind="javascript:display_date()" style="position:absolute; bottom:1; right:10" ></cfdiv>

<br>
<br>
<br>
</cflayoutarea>
<cflayoutarea position="bottom" align="center" splitter="true">
<table>
<tr>
<td>
<font style="color:#666666" size="3" > &copy; Copyright  Σ.Δ.Ο.Ε </font> </br>
<font style="color:#666666" size="3" > Αθήνα 2010 </font>
</td>
</tr>
</table>
</cflayoutarea>

</cflayout>
</cflayoutarea>
</cflayout>

</body>
</html>
