<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">

<cfif not isdefined("cookie.userid")>
<cfabort>
</cfif>

<html>
<head>
	<title> &nbsp; �5 &nbsp; - ��������� &nbsp; ���� &nbsp; </title>
	<script language="JavaScript" charset="iso-8859-7">
	window.onbeforeunload=unloadMess;
	function unloadMess(){
	var mess="�������� �������������� �� ��������� logout ��� ����� ��� ��� ��������, ������� ������� ��� ���� ����� �������� �� ��������!";
    return mess;
	}
	function d1(){
	window.onbeforeunload=null;
	location.href="frequest.cfm";
	}
	function d2(){
	window.onbeforeunload=null;
	location.href="final_request.cfm";
	}
	</script>
</head>
<body>

<cflayout name="thelayout" type="tab">

<cflayoutarea  overflow="auto" title="����������">
<br>
<a href="javascript:void(0);" onclick="d1();">
<p align="center"> ���������� ���������� �����</p>
</a>
<br>
</cflayoutarea>

<cflayoutarea  overflow="auto" title="�������">
<br>
<a href="javascript:void(0);" onclick="d2();">
<p align="center"> ������� ���������� �����</p>
</a>
<br>

</cflayoutarea>

</cflayout>
</body>
</html>
