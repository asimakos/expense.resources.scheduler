<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<cfset REQUEST.perif="#Trim(cookie.userid)#">
<p align="center" id="nik"><font size="+1"><b> Παρακαλώ καταχωρήστε το διαβιβαστικό σας! </b></font></p>
<cfif isdefined("docm")>
<cffile action="UPLOAD" filefield="kfile" destination="#GetDirectoryFromPath(GetCurrentTemplatePath())##REQUEST.perif#\" 
nameconflict="OVERWRITE">
<br>
<script language="JavaScript" charset="iso-8859-7">
document.getElementById("nik").innerHTML="";
alert("Το διαβιβαστικό σας έχει αποθηκευτεί με επιτυχία!");
</script>
</cfif>
<cfform enctype="multipart/form-data" method="POST" name="form_upload">
<br>
<br>
<br>
<cfinput type="File" name="kfile">
<cfinput type="Submit" name="docm" value="Καταχώρηση διαβιβαστικού"> 
</p>
</cfform>

