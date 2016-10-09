

<cfajaximport tags="cfdiv,cfgrid,cfinput-datefield">

<cflogin idletimeout="1500">

<cfif NOT (isdefined("Form.username") AND isdefined("Form.password"))>

<cfinclude template="loginform.cfm">

<cfabort>
<cfelse>

<cfquery name="login" datasource="fund">

SELECT userid,roles FROM valid_user
WHERE userid=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#Form.username#"> AND
passwordid=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#Form.password#">

</cfquery>

<cfif login.recordcount GT 0>
<cfloginuser name="#login.userid#" password="#Form.password#" roles="login.roles">
<cfset cookie.userid=#Trim(login.userid)#>


<cflock type="EXCLUSIVE" scope="SESSION" timeout="5">
<cfset Session.login="yes">
</cflock>


<cfelse>
<cfset invalid="yes">
<cfinclude template="loginform.cfm">
<cfabort>

</cfif>
</cfif>
</cflogin>

<!---
<cflock type="READONLY" scope="SESSION" timeout="5">
<cfset variables.URLToken=Session.URLToken>
</cflock>
--->


<cfswitch expression="#Trim(GetAuthUser())#">

<cfcase delimiters="," value="110,120,1301,1302,1303,140,1501,1502,1601,1602,170,180,190,2001,2002,210,220,230,250,260">
<script language="JavaScript">
//var #ToScript(variables.URLToken,"token")#;
location.href='apply.cfm';
</script>
</cfcase>

<cfcase value="100">
<script language="JavaScript">
//var #ToScript(variables.URLToken,"token")#;
location.href='kyrequest.cfm';
</script>
</cfcase>

<cfcase value="90">
<script language="JavaScript">
//var #ToScript(variables.URLToken,"token")#;
location.href='avail.cfm';
</script>
</cfcase>

</cfswitch>


