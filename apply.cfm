<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">

<cfif not isdefined("cookie.userid")>
<cfabort>
</cfif>

<cfswitch expression="#Trim(cookie.userid)#">
<cfcase value="110">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Αττικής">
</cfcase>
<cfcase value="120">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Κεντρικής Μακεδονίας">
</cfcase>
<cfcase value="1301">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Ανατ. Μακεδονίας-Θράκης (KOMOTHNH)">
</cfcase>
<cfcase value="1302">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Ανατ. Μακεδονίας-Θράκης (ΚΑΒΑΛΑ)">
</cfcase>
<cfcase value="1303">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Ανατ. Μακεδονίας-Θράκης (ΑΛΕΞ/ΠΟΛΗ)">
</cfcase>
<cfcase value="140">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Δυτικής  Μακεδονίας">
</cfcase>
<cfcase value="1501">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Ηπείρου (ΙΩΑΝΝΙΝΑ)">
</cfcase>
<cfcase value="1502">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Ηπείρου (ΗΓΟΥΜ/ΤΣΑ)">
</cfcase>
<cfcase value="1601">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Θεσσαλίας (ΛΑΡΙΣΑ)">
</cfcase>
<cfcase value="1602">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Θεσσαλίας (ΒΟΛΟΣ)">
</cfcase>
<cfcase value="170">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Ιονίων νήσων">
</cfcase>
<cfcase value="180">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Δυτικής Ελλάδας">
</cfcase>
<cfcase value="190">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Στερεάς Ελλάδας">
</cfcase>
<cfcase value="2001">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Πελ/νήσου (ΤΡΙΠΟΛΗ)">
</cfcase>
<cfcase value="2002">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Πελ/νήσου (ΚΑΛΑΜΑΤΑ)">
</cfcase>
<cfcase value="210">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Βορείου Αιγαίου">
</cfcase>
<cfcase value="220">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Νοτίου Αιγαίου">
</cfcase>
<cfcase value="230">
<cfset REQUEST.perif="Περιφ. Διεύθυνση Κρήτης">
</cfcase>
<cfcase value="250">
<cfset REQUEST.perif="ΕΔΕΥΑ">
</cfcase>
<cfcase value="260">
<cfset REQUEST.perif="ΕΔΕΥΘ">
</cfcase>
</cfswitch>


<html>
<head>
	<title> <cfoutput> #REQUEST.perif# </cfoutput>  </title>
	<script language="JavaScript" charset="iso-8859-7">
	window.onbeforeunload=unloadMess;
	function unloadMess(){
	var mess="Παρακαλώ χρησιμοποιήστε το εικονίδιο logout για έξοδο από την εφαρμογή, πατήστε ΑΚΥΡΩΣΗ εάν κατά λάθος κλείσετε το παράθυρο!";
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

<cflayoutarea  overflow="auto" title="Αίτημα">
<br>
<a href="javascript:void(0);" onclick="perif1();">
<p align="center"> Καταχώρηση αιτήματος</p>
</a>
<br>
</cflayoutarea>

<cflayoutarea  overflow="auto" title="Ανάλωση">
<br>
<a href="javascript:void(0);" onclick="perif2();">
<p align="center"> Καταχώρηση ανάλωσης</p>
</a>
<br>

</cflayoutarea>

</cflayout>
</body>
</html>
