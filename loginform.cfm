

<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">

<cfif isdefined("cookie.userid")>
<cfcookie name="userid" expires="NOW">
<cflock scope="SESSION" type="EXCLUSIVE" timeout="5">
<cfset structclear(session)>
</cflock>
</cfif>


<cfif FindNoCase('Firefox','#CGI.HTTP_USER_AGENT#') EQ 0>

<script language="JavaScript" charset="iso-8859-7">
alert(" � �������� ���� ����� ������� ���� �� ��� Mozilla Firefox! ");
</script>
<cfabort>
</cfif>


<html>

<head>

<title>����   ��������   ��������</title>
	
</head>

<body>

<cflayout name="thelayout" type="border">

<cflayoutarea position="top" align="center">
<font style="color:#0000CC " size="+2"> ��������� ����������� </font> <br/>
<font style="color: #996666" size="+1"> ���� ������ ����������� ���������� (����) </font>
</cflayoutarea>

<cflayoutarea  position="center" align="center" overflow="auto">
<p align="center">
<img src="sima2.jpg" border="0" width="105" height="110">

</p>
<!---
<p align="center" style="text-align:justify"> <img src="" border="1"  width="200" height="198" align="left"> </p>
--->
<br>
<br>
<br>

<cfif isdefined("invalid")>
<cfif invalid EQ "yes">
<script language="JavaScript" charset="iso-8859-7">
alert("������ �������! �������� ����������� ����");
</script>
</cfif>
</cfif>


<cfform name="Logname" action="#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#" method="POST">
<table align="right" bgcolor="#00ff00" style="position:absolute; left:460; bottom:25">
<TR>
<TD align="right">
����� &nbsp; ������:
</TD>
<TD>
<CFINPUT TYPE="Text" Name="username" message="�������� ������ ����� ������!"
required="Yes" maxlength="10"> 
</TD>
</TR>
<TR>
<TD align="right">
������� &nbsp; ������:
</TD>
<TD>
<CFINPUT type="Password" name="password" message="�������� ������ ������ ������!"
required="Yes" maxlength="20">
</TD>
</TR>
<TR>
<br>
</TR>
<TR>

<!---
<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">
--->

<TD colspan="2" align="center">
<INPUT Type="submit" name="login" value="�������"> &nbsp; &nbsp;
<INPUT Type="reset" value="����������">
</TD>
</TR>
</table>

</cfform>

<p align="left">
<img src="fund.jpeg" border="1" width="190" height="150" hspace="60">
</p>
<p align="left"> &nbsp; &nbsp; <strong> <font size="4"> ���� ������ ����������� ���������� </font></strong>  </p>
<p align="left">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <strong> <font size="3"> �������� ��������</font></strong>
</p>
<p align="left">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong> <font size="3"> �������� 207 - ���������� 92 </font></strong>
</p>
<p align="left">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
<strong><font size="3">
11853, ����� </font></strong>
</p>
</cflayoutarea>

<cflayoutarea position="bottom" align="center" splitter="true">
<font style="color:#666666" size="3" > &copy; Copyright  �.�.�.� </font> </br>
<font style="color:#666666" size="3" > ����� 2010 </font>
</cflayoutarea>

</cflayout>


</body>
</html>

