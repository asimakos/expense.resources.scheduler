<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">

<cfif not isdefined("cookie.userid")>
<cfabort>
</cfif>

<html>
<head>
	<title>���� �������� �������� - �������� &nbsp; ��������� &nbsp; ������������� &nbsp; ����������</title>
	<SCRIPT src="perif.js" charset="iso-8859-7">
	</SCRIPT>
	<SCRIPT src="kydoc.js" charset="iso-8859-7">
	</SCRIPT>
</head>

<body onunload="new_closreport()">

<cflayout name="thelayout" type="border">

<cflayoutarea position="top" align="center">
<font style="color:#0000CC " size="+2"> ��������� ����������� </font> <br/>
<font style="color: #996666" size="+1"> ���� ������ ����������� ���������� (����) </font>
</cflayoutarea>

<cflayoutarea  position="center" align="center" overflow="auto">

<STYLE>

TH {font-family:arial;font-size:smaller;background:yellow;color:black}
TD {font-family:arial;font-size:smaller}
TD.DataA {background:silver;color:black}
TD.DataB {background:lightgrey;color:black}

</STYLE>


<p align="center">
<font size="+1"><b> ������� &nbsp; ��������� &nbsp;  ������������� &nbsp; ���������� </b></font>
<br>
<form>
<input type="Button" name="print" value="�������� ��������" onclick="window.print();">&nbsp; &nbsp;
<input type="Button" name="clear" value="�������� ��������" onclick="close_report();">
</form>
</p>
<br>
<table>
<TR>
<TH>
 �.�.� 
</TH>
<TH>
���������  �.�.�
</TH>
<TH>
���� ��� ����
</TH>
<TH>
������� �����. �����
</TH>
<TH>
������������ �����������
</TH>
<TH>
�������� �����
</TH>
</TR>
<TR>


<TD>
<cfdiv bind="javascript:getkae_id()" style="background-color:##FFFF99">  </cfdiv>
</TD>
<TD>
<cfdiv bind="javascript:getkae_description()" style="background-color:##FFFF99">  </cfdiv>
</TD>

<TD>
<cfdiv bind="javascript:getkae_received()" style="background-color:##FFFF99">  </cfdiv>
</TD>
<TD>
<cfdiv bind="javascript:getkae_spent()" style="background-color:##FFFF99">  </cfdiv>
</TD>

<TD>
<cfdiv bind="javascript:getkae_occasions()" style="background-color:##FFFF99">  </cfdiv>
</TD>

<TD>
<cfdiv bind="javascript:getkae_requests()" style="background-color:##FFFF99">  </cfdiv>

</TD>
</TR>
</table>

<br>
<cfdiv bind="javascript:display_date()" align="right" ></cfdiv>

<br>
<br>

</cflayoutarea>
<cflayoutarea position="bottom" align="center" splitter="true">
<table>
<tr>
<td>
<font style="color:#666666" size="3" > &copy; Copyright  �.�.�.� </font> </br>
<font style="color:#666666" size="3" > ����� 2010 </font>
</td>
<td align="right">
<a href="logout.cfm">
<img src="logout3.jpg" border="0">
</a>
</td>
</tr>
</table>
</cflayoutarea>


</cflayout>

</body>
</html>