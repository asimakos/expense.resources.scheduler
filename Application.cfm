

<cfapplication name="Money" sessionmanagement="Yes" 
sessiontimeout="#CreateTimeSpan(0,0,20,0)#"
setclientcookies="no">


<cflock type="EXCLUSIVE" scope="SESSION"  timeout="5">
<cfparam name="Session.login" default="no">
</cflock>

<!---
<cfif NOT (isdefined("cookie.userid"))>
<cfinclude template="login_action.cfm">
</cfif>
--->



