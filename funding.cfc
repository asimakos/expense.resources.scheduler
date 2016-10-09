<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfcomponent>

<cffunction name="edit_fedit" access="remote">
<cfargument name="gridaction" type="string" required="Yes">
<cfargument name="gridrow" type="struct" required="Yes">
<cfargument name="gridchanged" type="struct" required="Yes">

<cfset var colname="">
<cfset var value="">

<cfswitch expression="#arguments.gridaction#">
<cfcase value="U">

<cfset colname=structKeyList(arguments.gridchanged)>
<cfset value=arguments.gridchanged[colname]>

<cfquery name="change_request" datasource="fund">

UPDATE funds
SET #colname#='#value#'
WHERE id_kae=#arguments.gridrow.id_kae# AND id_fund=#arguments.gridrow.id_fund#

</cfquery>
</cfcase>
</cfswitch>
</cffunction>


<cffunction name="get_fedit" access="remote" returntype="struct">
<cfargument name="page" type="numeric" required="Yes">
<cfargument name="pageSize" type="numeric" required="Yes">
<cfargument name="kindex" type="numeric" required="Yes">
<cfargument name="gridsortcolumn" type="string" required="No" default="">
<cfargument name="gridsortdir" type="string" required="No" default="">

<cfset var fdata="">

<cfquery name="get_data" datasource="fund">

SELECT id_fund,id_kae,kae_descr,fund_received,fund_spent,fund_occasions,fund_request,fund_approved,fund_comment
FROM funds
WHERE id_fund=#arguments.kindex#

<cfif arguments.gridsortcolumn NEQ "" AND arguments.gridsortdir NEQ "">
ORDER BY #arguments.gridsortcolumn# #arguments.gridsortdir#
</cfif>

</cfquery>

<cfreturn QueryConvertForGrid(get_data,arguments.page,arguments.pageSize)>

</cffunction>


<cffunction name="edit_request" access="remote">
<cfargument name="gridaction" type="string" required="Yes">
<cfargument name="gridrow" type="struct" required="Yes">
<cfargument name="gridchanged" type="struct" required="Yes">

<cfset var colname="">
<cfset var value="">

<cfswitch expression="#arguments.gridaction#">
<cfcase value="U">

<cfset colname=structKeyList(arguments.gridchanged)>
<cfset value=arguments.gridchanged[colname]>
<!---
<cfquery name="change_request" datasource="fund">
UPDATE funds
SET #colname#='#value#'
WHERE id_kae=#arguments.gridrow.kcode#
</cfquery>
--->
</cfcase>
</cfswitch>
</cffunction>

<cffunction name="getperiod_data" access="remote" returntype="struct">
<cfargument name="page" type="numeric" required="Yes">
<cfargument name="pageSize" type="numeric" required="Yes">
<cfargument name="gridsortcolumn" type="string" required="No" default="">
<cfargument name="gridsortdir" type="string" required="No" default="">

<cfset var get_requests="">

<cfquery name="get_requests" datasource="fund">

SELECT  ' '+id_kae AS kcode,kae_descr,SUM(fund_received) AS received,
SUM(fund_spent) AS spent,SUM(fund_occasions) AS occasions,
SUM(fund_request) AS request,SUM(fund_available) AS available
FROM funds
WHERE fund_approved=0
GROUP BY id_kae,kae_descr
<cfif arguments.gridsortcolumn NEQ "" AND arguments.gridsortdir NEQ "">
ORDER BY #arguments.gridsortcolumn# #arguments.gridsortdir#
</cfif>

</cfquery>
 
 <cfreturn QueryConvertForGrid(get_requests,arguments.page,arguments.pageSize)>
 
</cffunction>


<cffunction name="getperiod" access="remote" returntype="string" output="false">
<cfargument name="arg1" required="no">

<cfif Len(#Trim(arguments.arg1)#) EQ 0>
<cfreturn " ">
</cfif>

<cfset mytext1=ArrayNew(1)>

<cfset REQUEST.data1=#arguments.arg1#>
<cfset mytext1=REQUEST.data1.split("[/]+")>

<cfswitch expression="#Trim(mytext1[2])#">

<cfcase value="1">
<cfset REQUEST.x1="Ιανουάριος">
</cfcase>
<cfcase value="2">
<cfset REQUEST.x1="Φεβρουάριος">
</cfcase>
<cfcase value="3">
<cfset REQUEST.x1="Μάρτιος">
</cfcase>
<cfcase value="4">
<cfset REQUEST.x1="Απρίλιος">
</cfcase>
<cfcase value="5">
<cfset REQUEST.x1="Μάϊος">
</cfcase>
<cfcase value="6">
<cfset REQUEST.x1="Ιούνιος">
</cfcase>
<cfcase value="7">
<cfset REQUEST.x1="Ιούλιος">
</cfcase>
<cfcase value="8">
<cfset REQUEST.x1="Αύγουστος">
</cfcase>
<cfcase value="9">
<cfset REQUEST.x1="Σεπτέμβριος">
</cfcase>
<cfcase value="10">
<cfset REQUEST.x1="Οκτώβριος">
</cfcase>
<cfcase value="11">
<cfset REQUEST.x1="Νοέμβριος">
</cfcase>
<cfcase value="12">
<cfset REQUEST.x1="Δεκέμβριος">
</cfcase>

</cfswitch>

<cfreturn "Περίοδος  αιτήματος:   " & REQUEST.x1 &  "   "  &mytext1[3]>

</cffunction>



<cffunction name="new_index" access="remote">

<cfquery name="data_index" datasource="fund">

SELECT MAX(id_fund) AS indexk from funds

</cfquery>

<cfif data_index.recordcount EQ 0>
<cfset REQUEST.maxindex=1>
<cfelse>
<cfset REQUEST.maxindex=val(data_index.indexk)+1>
</cfif>

<cfreturn REQUEST.maxindex>

</cffunction>

</cfcomponent>
