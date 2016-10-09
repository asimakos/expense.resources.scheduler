<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">

<cfif not isdefined("cookie.userid")>
<cfabort>
</cfif>

<html>
<head>
	<title> &nbsp; Δ5 &nbsp; - Διαθέσιμο &nbsp; ποσό &nbsp; </title>
	<script language="JavaScript" charset="iso-8859-7">
	window.onbeforeunload=unloadMess;
	function unloadMess(){
	var mess="Παρακαλώ χρησιμοποιήστε το εικονίδιο logout για έξοδο από την εφαρμογή, πατήστε ΑΚΥΡΩΣΗ εάν κατά λάθος κλείσετε το παράθυρο!";
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

<cflayoutarea  overflow="auto" title="Καταχώρηση">
<br>
<a href="javascript:void(0);" onclick="d1();">
<p align="center"> Καταχώρηση διαθέσιμου ποσού</p>
</a>
<br>
</cflayoutarea>

<cflayoutarea  overflow="auto" title="Έλεγχος">
<br>
<a href="javascript:void(0);" onclick="d2();">
<p align="center"> Έλεγχος διαθέσιμου ποσού</p>
</a>
<br>

</cflayoutarea>

</cflayout>
</body>
</html>
