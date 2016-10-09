<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">

<cfif not isdefined("cookie.userid")>
<cfabort>
</cfif>

<html>
<head>
	<title>������������ &nbsp; ������������� &nbsp; �����������</title>
</head>

<body>

<STYLE>

TH {font-family:arial;font-size:14;background:navy;color:white}
TD {font-family:arial;font-size:14}
TD.DataA {background:silver;color:black}
TD.DataB {background:lightgrey;color:black}

</STYLE>

<cflayout name="thelayout" type="tab">

<cflayoutarea   overflow="auto" title="ATTIKH">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"110">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="110/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="110/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="110/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="110/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>


<cflayoutarea   overflow="auto" title="�������� ���������">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"120">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="120/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="120/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="120/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="120/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea   overflow="auto" title="������ ���������">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"140">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="140/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="140/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="140/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="140/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="����. ���������(��������)">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"1301">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="1301/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="1301/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="1301/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="1301/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="����. ���������(������)">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"1302">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="1302/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="1302/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="1302/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="1302/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="����. ���������(����/����)">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"1303">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="1303/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="1303/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="1303/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="1303/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="�������(��������)">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"1501">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="1501/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="1501/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="1501/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="1501/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="�������(�����/���)">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"1502">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="1502/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="1502/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="1502/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="1502/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="��������(������)">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"1601">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="1601/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="1601/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="1601/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="1601/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>
</cflayoutarea>

<cflayoutarea  overflow="auto" title="��������(�����)">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"1602">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="1602/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="1602/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="1602/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="1602/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="����� �����">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"170">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="170/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="170/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="170/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="170/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="������ ������">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"180">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="180/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="180/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="180/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="180/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="������ ������">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"190">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="190/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="190/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="190/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="190/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="���/���(�������)">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"2001">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="2001/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="2001/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="2001/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="2001/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="���/���(��������)">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"2002">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="2002/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="2002/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="2002/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="2002/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="������ ������">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"210">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="210/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="210/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="210/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="210/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="����� ������">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"220">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="220/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="220/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="220/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="220/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="�����">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"230">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="230/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="230/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="230/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="230/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="�����">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"250">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="250/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="250/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="250/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="250/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>

<cflayoutarea  overflow="auto" title="�����">

<cfset currentdir=GetDirectoryFromPath(GetTemplatePath())&"260">

<cfdirectory directory="#currentdir#"
name="mydirectory">

<cfif #mydirectory.recordcount# GT 0>

<table align="center">
<tr>
<th> ����� </th>
<th> ������� </th>
<th> ����� </th>
</tr>

<cfoutput query="mydirectory">

<cfset Class= IIF(mydirectory.CurrentRow MOD 2 EQ 0,"'DataA'","'DataB'")>

<tr>
<td class="#Class#"> #mydirectory.name# </td>
<td class="#Class#"> #(mydirectory.size/1000)# KB </td>

<td class="#Class#">
<cfset word=Right(#mydirectory.name#,4)>

<cfswitch expression="#word#">
<cfcase value="docx,.doc">
<a href="260/#mydirectory.name#">
<img src="doc.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value="xlsx,.xls">
<a href="260/#mydirectory.name#">
<img src="xls.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfcase value=".pdf">
<a href="260/#mydirectory.name#">
<img src="pdf.jpeg" height="40" width="40" border="0">
</a>
</cfcase>
<cfdefaultcase>
<a href="260/#mydirectory.name#">
<img src="win.jpeg" height="40" width="40" border="0">
</a>
</cfdefaultcase>
</cfswitch>
</td>
</tr>
</cfoutput>

</table>
<cfelse>
<p align="center">
<b> ��� �������� ������ ���������! </b>
</p>
</cfif>

</cflayoutarea>


</cflayout>


</body>
</html>
