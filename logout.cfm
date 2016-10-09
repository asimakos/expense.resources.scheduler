<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<cfcookie name="userid" expires="NOW">

<cflogout>

<cflock scope="SESSION" type="EXCLUSIVE" timeout="5">
<cfset structclear(session)>
</cflock>

<script language="JavaScript" charset="iso-8859-7">

alert("Ο χρόνος της περιόδου σας τελείωσε!");
location.href='login_action.cfm';
</script>

