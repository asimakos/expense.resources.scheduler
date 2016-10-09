<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">

<cfif not isdefined("cookie.userid")>
<cfabort>
</cfif>

<html>
<head>
	<title>Δ5 - Έλεγχος &nbsp; ποσών &nbsp; για &nbsp; αιτήματα &nbsp; Περιφερειακών &nbsp; Διευθύνσεων</title>
	<SCRIPT src="perif.js" charset="iso-8859-7">
	</SCRIPT>
	<SCRIPT src="headfund.js" charset="iso-8859-7">
	</SCRIPT>
	<script language="JavaScript" charset="iso-8859-7">
	window.onbeforeunload=unloadMess;
	function unloadMess(){
	var mess="Παρακαλώ χρησιμοποιήστε το εικονίδιο logout για έξοδο από την εφαρμογή, πατήστε ΑΚΥΡΩΣΗ εάν κατά λάθος κλείσετε το παράθυρο!";
    return mess;
	}
	function d_home(){
	window.onbeforeunload=null;
	location.href="avail.cfm";
	}
	function perif_log(){
	window.onbeforeunload=null;
	location.href="logout.cfm";
	}
	</script>
</head>

<body>
<cflayout name="thelayout" type="border">

<cflayoutarea position="top" align="center">
<font style="color:#0000CC " size="+2"> ΥΠΟΥΡΓΕΙΟ ΟΙΚΟΝΟΜΙΚΩΝ </font> <br/>
<font style="color: #996666" size="+1"> ΣΩΜΑ ΔΙΩΞΗΣ ΟΙΚΟΝΟΜΙΚΟΥ ΕΓΚΛΗΜΑΤΟΣ (ΣΔΟΕ) </font>
</cflayoutarea>

<cflayoutarea  position="center" align="center" overflow="auto">
<br>
<p align="center"> <font size="+1"> <b>  Έλεγχος &nbsp; διαθέσιμου &nbsp; ποσού &nbsp; και &nbsp; απόδοσης &nbsp; για &nbsp;σύνολο &nbsp; αιτημάτων &nbsp; ανά &nbsp; ΚΑΕ &nbsp; (Δ5)</b></font></p>
<br>

<STYLE>

TH {font-family:arial;font-size:smaller;background:navy;color:white}
TD {font-family:arial;font-size:smaller}
TD.DataA {background:silver;color:black}
TD.DataB {background:lightgrey;color:black}

</STYLE>

<cfform name="form_request" action="">
<table>
<TR>
<TH.kon style="position:absolute;left:260;top:108">
Επιλέξτε &nbsp;ΚΑΕ: &nbsp; &nbsp;
</TH>
<TD style="position:absolute;left:370;top:108">
<cfselect name="kkae" required="Yes" multiple="No">
<option value="0700">0700</option>
<option value="0800">0800</option>
<option value="1100">1100</option>
<option value="1200">1200</option>
<option value="1300">1300</option>
<option value="1500">1500</option>
<option value="1600">1600</option>
<option value="1700">1700</option>
</cfselect>
</TD>
<TH.kon style="position:absolute;left:430;top:108">,&nbsp;μήνα αιτήματος: &nbsp; &nbsp;</TH>
<TD style="position:absolute;left:550;top:108">
<cfselect name="kmonth" required="Yes" multiple="No">
<option value="">  </option>
<option value="Ιανουάριος"> Ιανουάριος </option>
<option value="Φεβρουάριος"> Φεβρουάριος</option>
<option value="Μάρτιος"> Μάρτιος </option>
<option value="Απρίλιος"> Απρίλιος </option>
<option value="Μάϊος"> Μάϊος </option>
<option value="Ιούνιος"> Ιούνιος </option>
<option value="Ιούλιος"> Ιούλιος </option>
<option value="Αύγουστος"> Αύγουστος </option>
<option value="Σεπτέμβριος"> Σεπτέμβριος </option>
<option value="Οκτώβριος"> Οκτώβριος </option>
<option value="Νοέμβριος"> Νοέμβριος </option>
<option value="Δεκέμβριος"> Δεκέμβριος </option>
</cfselect>
</TD>
<TH.kon style="position:absolute;left:660;top:108"> &nbsp; 
,&nbsp;έτος  &nbsp; &nbsp; 
</TH>
<TD style="position:absolute;left:710;top:108">
<cfinput name="kyear" type="Text" maxlength="4" size="4">
</TD>
<!---
<TH.kon style="position:absolute;left:770;top:108"> &nbsp; 
και τύπος &nbsp; 
</TH>
<TD style="position:absolute;left:850;top:108">
<cfselect name="kstatus" required="Yes" multiple="No">
<option value="ΚΑΝΟΝΙΚΟ"> ΚΑΝΟΝΙΚΟ </option>
<option value="ΕΚΤΑΚΤΟ"> ΕΚΤΑΚΤΟ </option>
</cfselect>
</TD>
--->
</TR>

<TR>
<TD>
<br> 
<br>
<br>
<br>
<br>
<cfgrid name="requests" format="html" striperows="yes" pagesize="30" selectmode="ROW" fontsize="12"
bindonload="yes" 
bind="cfc:extrafund.get_kaeperiod({cfgridpage},{cfgridpageSize},{kkae},{kmonth},{kyear},{cfgridsortcolumn},{cfgridsortdirection})">

<cfgridcolumn name="kcode" header="K.A.E" select="No" width="40">
<cfgridcolumn name="kae_descr" header="Περιγραφή ΚΑΕ"  width="400">
<cfgridcolumn name="date_id" header="Περίοδος αιτήματος"  width="120">
<cfgridcolumn name="received" header="Απόδοση έως τώρα"  width="60" type="NUMERIC">
<cfgridcolumn name="spent" header="Ανάλωση έως τώρα"  width="60" type="NUMERIC">
<cfgridcolumn name="occasions" header="Ανειλημμένες"  width="60" type="NUMERIC">
<cfgridcolumn name="request" header="Αιτήματα"  width="60" type="NUMERIC">
</cfgrid>
</TD>
</TR>

<TR>
<cfdiv style="position:absolute;left:120;bottom:35"><b> ΣΥΝΟΛΑ: </b> </cfdiv>
<cfdiv id="received_id" style="position:absolute;left:360;bottom:35"> </cfdiv>
<cfdiv id="spent_id" style="position:absolute;left:480;bottom:35"> </cfdiv>
<cfdiv id="occasion_id" style="position:absolute;left:655;bottom:35">  </cfdiv>
<cfdiv id="request_id" style="position:absolute;left:850;bottom:35">  </cfdiv>
<!---
<cfdiv id="available_id" style="position:absolute;left:980;bottom:35">  </cfdiv>
<cfdiv id="approved_id" style="position:absolute;left:1070;bottom:35">  </cfdiv>
--->
</TR>
</table>
<br>
<cfset ajaxOnLoad("d2symbol")>
<br>
<br>
<input type="Button" name="sum" value="Συνολικές τιμές" onclick="displaykae_sum()" style="position:absolute;left:200;bottom:35">
</cfform>
</cflayoutarea>

<cflayoutarea position="bottom" align="center" splitter="true">
<table>
<tr>
<td align="left">
<a href="javascript:void(0);" onclick="d_home();">
<img src="home.jpeg" height="60" width="60" border="0">
</a>
</td>
<td>
<b> Δ5 </b> <br>
<font style="color:#666666" size="3" > &copy; Copyright  Σ.Δ.Ο.Ε </font> </br>
<font style="color:#666666" size="3" > Αθήνα 2010 </font>
</td>
<td align="right">
<a href="javascript:void(0);" onclick="perif_log();">
<img src="logout3.jpg" border="0">
</a>
</td>
</tr>
</table>
</cflayoutarea>
</cflayout>
</body>
</html>
