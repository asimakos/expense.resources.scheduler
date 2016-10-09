<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">

<cfif not isdefined("cookie.userid")>
<cfabort>
</cfif>

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
	<title> <cfoutput> #REQUEST.perif# </cfoutput>  </title>
	<script language="JavaScript" charset="iso-8859-7">
	window.onbeforeunload=unloadMess;
	function unloadMess(){
	var mess="�������� �������������� �� ��������� logout ��� ����� ��� ��� ��������, ������� ������� ��� ���� ����� �������� �� ��������!";
    return mess;
	}
	function perif1(){
	window.onbeforeunload=null;
	location.href="finsert.cfm";
	}
	function perif2(){
	window.onbeforeunload=null;
	location.href="expense.cfm";
	}
	</script>
</head>
<body>

<cflayout name="thelayout" type="tab">

<cflayoutarea  overflow="auto" title="������">
<br>
<a href="javascript:void(0);" onclick="perif1();">
<p align="center"> ���������� ���������</p>
</a>
<br>
</cflayoutarea>

<cflayoutarea  overflow="auto" title="�������">
<br>
<a href="javascript:void(0);" onclick="perif2();">
<p align="center"> ���������� ��������</p>
</a>
<br>

</cflayoutarea>

</cflayout>
</body>
</html>
