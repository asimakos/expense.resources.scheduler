

<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">

<cfif not isdefined("cookie.userid")>
<cfabort>
</cfif>

<cfajaxproxy cfc="update_fund" jsclassname="remotespent">
<cfajaxproxy cfc="update_fund" jsclassname="remoteindex">
<cfajaxproxy cfc="update_fund" jsclassname="remotesave">
<cfajaxproxy bind="javascript:show_spent({codeper})">


<cfswitch expression="#Trim(cookie.userid)#">
<cfcase value="110">
<cfset REQUEST.perif="�����. ��������� �������">
</cfcase>
<cfcase value="120">
<cfset REQUEST.perif="�����. ��������� ��������� ����������">
</cfcase>
<cfcase value="1301">
<cfset REQUEST.perif="�����. ��������� ����. ����������-������ (KOMOTHNH)">
</cfcase>
<cfcase value="1302">
<cfset REQUEST.perif="�����. ��������� ����. ����������-������ (������)">
</cfcase>
<cfcase value="1303">
<cfset REQUEST.perif="�����. ��������� ����. ����������-������ (����/����)">
</cfcase>
<cfcase value="140">
<cfset REQUEST.perif="�����. ��������� �������  ����������">
</cfcase>
<cfcase value="1501">
<cfset REQUEST.perif="�����. ��������� ������� (��������)">
</cfcase>
<cfcase value="1502">
<cfset REQUEST.perif="�����. ��������� ������� (�����/���)">
</cfcase>
<cfcase value="1601">
<cfset REQUEST.perif="�����. ��������� ��������� (������)">
</cfcase>
<cfcase value="1602">
<cfset REQUEST.perif="�����. ��������� ��������� (�����)">
</cfcase>
<cfcase value="170">
<cfset REQUEST.perif="�����. ��������� ������ �����">
</cfcase>
<cfcase value="180">
<cfset REQUEST.perif="�����. ��������� ������� �������">
</cfcase>
<cfcase value="190">
<cfset REQUEST.perif="�����. ��������� ������� �������">
</cfcase>
<cfcase value="2001">
<cfset REQUEST.perif="�����. ��������� ���/����� (�������)">
</cfcase>
<cfcase value="2002">
<cfset REQUEST.perif="�����. ��������� ���/����� (��������)">
</cfcase>
<cfcase value="210">
<cfset REQUEST.perif="�����. ��������� ������� �������">
</cfcase>
<cfcase value="220">
<cfset REQUEST.perif="�����. ��������� ������ �������">
</cfcase>
<cfcase value="230">
<cfset REQUEST.perif="�����. ��������� ������">
</cfcase>
<cfcase value="250">
<cfset REQUEST.perif="�����">
</cfcase>
<cfcase value="260">
<cfset REQUEST.perif="�����">
</cfcase>
</cfswitch>

<html>
<head>
	<title><cfoutput> #REQUEST.perif# </cfoutput> - ���������� &nbsp; ��������</title>
	<SCRIPT src="perif.js" charset="iso-8859-7">
	</SCRIPT>
	<SCRIPT src="kydoc.js" charset="iso-8859-7">
	</SCRIPT>
	<script language="JavaScript" charset="iso-8859-7">
	window.onbeforeunload=unloadMess;
	function unloadMess(){
	var mess="�������� �������������� �� ��������� logout ��� ����� ��� ��� ��������, ������� ������� ��� ���� ����� �������� �� ��������!";
    return mess;
	}
	function perif_home(){
	window.onbeforeunload=null;
	location.href="apply.cfm";
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

<cfform name="form_apply" action=" ">
<br>
<br>
<p align="center">
<font size="+1"> <b> �������� ������� ��� ������ ��� �� ���������� ��� ���������� ��� ��������: </b> </font>
<br>
<cfoutput>
#REQUEST.perif# &nbsp;&nbsp; (�������) <INPUT Type="text" name="codeper" value="#Trim(cookie.userid)#" size="4">
</cfoutput>
<input type="Hidden" id="kon" name="kostas" value="">
</p>

<table align="center">
<tr> 

<cfgrid name="kae_grid" selectmode="EDIT" pagesize="38" format="html" autowidth="no" 
striperows="yes" height="550" width="880" rowheight="25"
bind="cfc:update_fund.load_spent({cfgridpage},{cfgridpagesize},{cfgridsortcolumn},{cfgridsortdirection}) "
onchange="cfc:update_fund.change_spent({cfgridaction},{cfgridrow},{cfgridchanged})"> 

<cfgridcolumn name="kcode"
header="K.A.E"
select="no"
width="40"
headerbold="yes">

<cfgridcolumn name="kae_description"
header="���������  K.A.E"
select="no"
width="530"
headerbold="yes">

<cfgridcolumn name="kae_spent"
header="�������"
width="80"
type="NUMERIC"
headerbold="yes">

</cfgrid>

</tr>
</table>
<br>
<INPUT Type="button" id="kon_sp" name="kon_sp"  value="KOSTAS1" onclick="amount_spent(<cfoutput>#Trim(cookie.userid)#</cfoutput>)" style="visibility:hidden">
<INPUT Type="button" id="kon_save" name="kon3" value="���������� ��������" onclick="save_spent(<cfoutput>#Trim(cookie.userid)#</cfoutput>)" style="visibility:hidden"> 
</cfform>

<cfset ajaxOnLoad("expensesymbol")>
<cfset ajaxOnLoad("spent_init")>
<br>
</cflayoutarea>

<cflayoutarea position="bottom" align="center" splitter="true">
<table>
<tr>
<td align="left">
<a href="javascript:void(0);" onclick="perif_home();">
<img src="home.jpeg" height="60" width="60" border="0">
</a>
</td>
<td>
<cfoutput> <b> #REQUEST.perif# </b> </cfoutput>
<br>
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
