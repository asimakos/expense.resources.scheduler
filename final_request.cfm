<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">

<cfif not isdefined("cookie.userid")>
<cfabort>
</cfif>

<html>
<head>
	<title>�5 - ������� &nbsp; ����� &nbsp; ��� &nbsp; �������� &nbsp; ������������� &nbsp; �����������</title>
	<SCRIPT src="perif.js" charset="iso-8859-7">
	</SCRIPT>
	<SCRIPT src="headfund.js" charset="iso-8859-7">
	</SCRIPT>
	<script language="JavaScript" charset="iso-8859-7">
	window.onbeforeunload=unloadMess;
	function unloadMess(){
	var mess="�������� �������������� �� ��������� logout ��� ����� ��� ��� ��������, ������� ������� ��� ���� ����� �������� �� ��������!";
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
<font style="color:#0000CC " size="+2"> ��������� ����������� </font> <br/>
<font style="color: #996666" size="+1"> ���� ������ ����������� ���������� (����) </font>
</cflayoutarea>

<cflayoutarea  position="center" align="center" overflow="auto">
<br>
<p align="center"> <font size="+1"> <b>  ������� &nbsp; ���������� &nbsp; ����� &nbsp; ��� &nbsp; �������� &nbsp; ��� &nbsp;������ &nbsp; ��������� &nbsp; ��� &nbsp; ��� &nbsp; (�5)</b></font></p>
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
�������� &nbsp;���: &nbsp; &nbsp;
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
<TH.kon style="position:absolute;left:430;top:108">,&nbsp;���� ���������: &nbsp; &nbsp;</TH>
<TD style="position:absolute;left:550;top:108">
<cfselect name="kmonth" required="Yes" multiple="No">
<option value="">  </option>
<option value="����������"> ���������� </option>
<option value="�����������"> �����������</option>
<option value="�������"> ������� </option>
<option value="��������"> �������� </option>
<option value="�����"> ����� </option>
<option value="�������"> ������� </option>
<option value="�������"> ������� </option>
<option value="���������"> ��������� </option>
<option value="�����������"> ����������� </option>
<option value="���������"> ��������� </option>
<option value="���������"> ��������� </option>
<option value="����������"> ���������� </option>
</cfselect>
</TD>
<TH.kon style="position:absolute;left:660;top:108"> &nbsp; 
,&nbsp;����  &nbsp; &nbsp; 
</TH>
<TD style="position:absolute;left:710;top:108">
<cfinput name="kyear" type="Text" maxlength="4" size="4">
</TD>
<!---
<TH.kon style="position:absolute;left:770;top:108"> &nbsp; 
��� ����� &nbsp; 
</TH>
<TD style="position:absolute;left:850;top:108">
<cfselect name="kstatus" required="Yes" multiple="No">
<option value="��������"> �������� </option>
<option value="�������"> ������� </option>
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
<cfgridcolumn name="kae_descr" header="��������� ���"  width="400">
<cfgridcolumn name="date_id" header="�������� ���������"  width="120">
<cfgridcolumn name="received" header="������� ��� ����"  width="60" type="NUMERIC">
<cfgridcolumn name="spent" header="������� ��� ����"  width="60" type="NUMERIC">
<cfgridcolumn name="occasions" header="������������"  width="60" type="NUMERIC">
<cfgridcolumn name="request" header="��������"  width="60" type="NUMERIC">
</cfgrid>
</TD>
</TR>

<TR>
<cfdiv style="position:absolute;left:120;bottom:35"><b> ������: </b> </cfdiv>
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
<input type="Button" name="sum" value="��������� �����" onclick="displaykae_sum()" style="position:absolute;left:200;bottom:35">
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
<b> �5 </b> <br>
<font style="color:#666666" size="3" > &copy; Copyright  �.�.�.� </font> </br>
<font style="color:#666666" size="3" > ����� 2010 </font>
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
