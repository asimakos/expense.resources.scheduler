<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">

<cfif not isdefined("cookie.userid")>
<cfabort>
</cfif>

<cfajaximport tags="cfgrid,cfdiv">
<cfajaxproxy cfc="update_fund" jsclassname="updateky">
<cfajaxproxy cfc="extrafund" jsclassname="remoteky">
<html>
<head>
	<title>ΣΔΟΕ &nbsp; Κεντρική &nbsp; Υπηρεσία -  Απόδοση &nbsp; ποσού &nbsp;</title>
	<SCRIPT src="perif.js" charset="iso-8859-7">
	</SCRIPT>
	<SCRIPT src="newfund.js" charset="iso-8859-7">
	</SCRIPT>
	<SCRIPT src="headfund.js" charset="iso-8859-7">
	</SCRIPT>
	<SCRIPT src="kyfund.js" charset="iso-8859-7">
	</SCRIPT>
	<script language="JavaScript" charset="iso-8859-7">
	window.onbeforeunload=unloadMess;
	function unloadMess(){
	var mess="Παρακαλώ χρησιμοποιήστε το εικονίδιο logout για έξοδο από την εφαρμογή, πατήστε ΑΚΥΡΩΣΗ εάν κατά λάθος κλείσετε το παράθυρο!";
    return mess;
	}
	function perif_log(){
	window.onbeforeunload=null;
	location.href="logout.cfm";
	}
	function perif_arch(){
	window.onbeforeunload=null;
	location.href="content.cfm";
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
<cfform name="form_request" action="">
<table align="center"> 
<TR>
<font size="+1"> 
<br>
<cfdiv id="amount">
<b> Καταχώρηση &nbsp; διαθέσιμου &nbsp;ποσού &nbsp;για:</b>
</cfdiv>
</font>
<cfinput name="sum_av" type="text">
</TR>
<TR>
<cfinput name="sum_kon" type="hidden">
</TR>
</table>
<br>

<STYLE>

TH {font-family:arial;font-size:smaller;background:navy;color:white}
TD {font-family:arial;font-size:smaller}
TD.DataA {background:silver;color:black}
TD.DataB {background:lightgrey;color:black}

</STYLE>


<table>
<TR>
<input type="Button" name="perif" value="Περιφ. διευθύνσεις" onclick="flash_perif()" style="position:absolute;left:140;top:108">
<TH.kon style="position:absolute;left:360;top:108">
Επιλέξτε &nbsp;ΚΑΕ: &nbsp; &nbsp;
</TH>
<TD style="position:absolute;left:480;top:108">
<cfselect name="kkae" required="Yes" multiple="No">
<option value="0711">0711</option>
<option value="0712">0712</option>
<option value="0713">0713</option>
<option value="0813">0813</option>
<option value="0819">0819</option>
<option value="0823">0823</option>
<option value="0824">0824</option>
<option value="0829">0829</option>
<option value="0831">0831</option>
<option value="0839">0839</option>
<option value="0843">0843</option>
<option value="0845">0845</option>
<option value="0851">0851</option>
<option value="0861">0861</option>
<option value="0869">0869</option>
<option value="0871">0871</option>
<option value="0873">0873</option>
<option value="0875">0875</option>
<option value="0879">0879</option>
<option value="0899">0899</option>
<option value="1111">1111</option>
<option value="1121">1121</option>
<option value="1211">1211</option>
<option value="1231">1231</option>
<option value="1311">1311</option>
<option value="1321">1321</option>
<option value="1329">1329</option>
<option value="1511">1511</option>
<option value="1512">1512</option>
<option value="1611">1611</option>
<option value="1619">1619</option>
<option value="1699">1699</option>
<option value="1711">1711</option>
<option value="1712">1712</option>
<option value="1713">1713</option>
<option value="1723">1723</option>
<option value="1725">1725</option>
<option value="1729">1729</option>
</cfselect>
</TD>
<TH.kon style="position:absolute;left:540;top:108">,&nbsp;&nbsp;&nbsp; μήνα αιτήματος: &nbsp; &nbsp;</TH>
<TD style="position:absolute;left:680;top:108">
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
<TH.kon style="position:absolute;left:790;top:108"> &nbsp; &nbsp; &nbsp;  &nbsp; 
και  έτος  &nbsp; &nbsp; 
</TH>
<TD style="position:absolute;left:890;top:108">
<cfinput name="kyear" type="Text">
</TD>
</TR>

<TR>
<TD>
<br> 
<br>
<br>
<br>
<br>
<cfgrid name="requests" format="html" striperows="yes" pagesize="30" selectmode="EDIT" fontsize="12"
onchange="cfc:extrafund.editkae_request({cfgridaction},{cfgridrow},{cfgridchanged})"
bindonload="yes" 
bind="cfc:extrafund.getkykae_data({cfgridpage},{cfgridpageSize},{kkae},{kmonth},{kyear},{cfgridsortcolumn},{cfgridsortdirection})">
<cfgridcolumn name="kae_code" header="ΚΑΕ" select="No" width="40">
<cfgridcolumn name="kon" header="Περιφ. Δ/νσεις" select="No" width="220">
<cfgridcolumn name="id_perif" display="No">
<cfgridcolumn name="date_id" header="Περίοδος αιτήματος" select="No" width="170">
<cfgridcolumn name="date_status" header="Τύπος αιτήματος" select="No" width="70">
<cfgridcolumn name="fund_received" header="Λήψη έως τώρα" select="No" width="60" type="NUMERIC">
<cfgridcolumn name="fund_spent" header="Ανάλωση πρ/νων μηνών" select="No" width="60" type="NUMERIC">
<cfgridcolumn name="fund_occasions" header="Ανειλημμένες υποχρεώσεις" select="No" width="60" type="NUMERIC">
<cfgridcolumn name="fund_request" header="Αιτήματα μηνός" select="No" width="60" type="NUMERIC">
<cfgridcolumn name="fund_approved" header="Απόδοση ποσού"  width="60" type="NUMERIC">
<cfgridcolumn name="fund_comment" header="Σχόλια" select="No" width="260">
</cfgrid>
</TD>
</TR>

<TR>
<cfdiv style="position:absolute;left:120;bottom:65"><b> ΣΥΝΟΛΑ: </b> </cfdiv>
<cfdiv id="received_id" style="position:absolute;left:360;bottom:65"> </cfdiv>
<cfdiv id="spent_id" style="position:absolute;left:480;bottom:65"> </cfdiv>
<cfdiv id="occasion_id" style="position:absolute;left:655;bottom:65">  </cfdiv>
<cfdiv id="request_id" style="position:absolute;left:850;bottom:65">  </cfdiv>
<!---
<cfdiv id="available_id" style="position:absolute;left:980;bottom:65">  </cfdiv>
--->
<cfdiv id="approved_id" style="position:absolute;left:1070;bottom:65">  </cfdiv>

</TR>

</table>
<br>
<cfset ajaxOnLoad("kysymbol")>
<cfset ajaxOnLoad("kaeinit")>
<cfset ajaxOnLoad("rowinit")>
<br>
<br>

<cfdiv id="kaelist">
</cfdiv>
<input type="Button" name="sum" value="Συνολικές τιμές" onclick="displayky_sum()" style="position:absolute;left:200;bottom:65">
<input type="Button" id="kostas" value="Αναφορά Πιστώσεων" onclick="open_report()">
<input type="Button" id="kon" name="kon" value="Αποθήκευση Πιστώσεων" onclick="save_reportky()" style="visibility:hidden">
</cfform>
</cflayoutarea>

<cflayoutarea position="bottom" align="center" splitter="true">
<table>
<tr>
<td align="left">
<a href="javascript:void(0);" onclick="perif_arch();">
<img src="arch.jpeg" border="0" height="50" width="50">
</a>
</td>
<td>
<b> ΣΔΟΕ &nbsp; Κεντρική Υπηρεσία </b> <br>
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
