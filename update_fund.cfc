<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfcomponent>

<cffunction name="update_kae" access="remote">
<cfargument name="kae_name">
<cfargument name="kae_money">

<cfquery name="update_requests" datasource="fund">

UPDATE kae_avail
SET amount=#arguments.kae_money#
WHERE kae_code='#arguments.kae_name#'

</cfquery>

<cfreturn "y">

</cffunction>


<cffunction name="update_ky" access="remote">
<cfargument name="ky_perif">
<cfargument name="ky_kae">
<cfargument name="ky_period">
<cfargument name="ky_request">
<cfargument name="ky_approved">
<cfargument name="ky_received">
<cfargument name="ky_available">

<cfquery name="update_ky" datasource="fund">

UPDATE funds
SET fund_approved=#arguments.ky_approved#,fund_received=#arguments.ky_received#,
fund_available=#arguments.ky_available#
WHERE id_perif='#arguments.ky_perif#' AND id_kae='#arguments.ky_kae#' AND
date_id='#arguments.ky_period#' AND date_status='#arguments.ky_request#'

</cfquery>

</cffunction>

<cffunction name="perifdisplay_kae" access="remote">
<cfargument name="page" type="numeric" required="yes">
<cfargument name="pageSize" type="numeric" required="yes">
<cfargument name="gridsortcolumn" type="string" required="no" default="">
<cfargument name="gridsortdir" type="string" required="no" default="">

<cfset var contacts="">

<cfquery name="kae_data" datasource="fund">

SELECT ' '+kae_id As kcode,kae_description,kae_received,kae_spent,kae_occasions,kae_request,kae_comment  FROM kae

<cfif arguments.gridsortcolumn NEQ "" and arguments.gridsortdir NEQ "">

ORDER BY #arguments.gridsortcolumn##arguments.gridsortdir#

</cfif>
</cfquery>

<cfreturn QueryConvertForGrid(kae_data,arguments.page,arguments.pageSize)>

</cffunction>

<cffunction name="perifedit_kae" access="remote">
<cfargument name="gridaction" type="string" required="yes">
<cfargument name="gridrow" type="struct" required="yes">
<cfargument name="gridchanged" type="struct" required="yes">

<cfset var colname="">
<cfset var value="">

<cfswitch expression="#arguments.gridaction#">

<cfcase value="U">

<cfset colname=StructKeyList(arguments.gridchanged)>
<cfset value=arguments.gridchanged[colname]>


</cfcase>
</cfswitch>

</cffunction>

<cffunction name="save_request" access="remote">
<cfargument name="arg_id" required="yes">
<cfargument name="arg_kae" required="yes">
<cfargument name="arg_descr" required="yes">
<cfargument name="arg_perif" required="yes">
<cfargument name="arg_date" required="yes">
<cfargument name="arg_received" required="no" default="0">
<cfargument name="arg_spent" required="yes">
<cfargument name="arg_occasions" required="yes">
<cfargument name="arg_request" required="yes">
<cfargument name="arg_approved" required="no" default="0">
<cfargument name="arg_comment" required="no" default=" ">
<cfargument name="arg_doc" required="yes">
<cfargument name="arg_datestatus" required="yes">


<cfset REQUEST.strpath="#GetDirectoryFromPath(GetCurrentTemplatePath())##Trim(arguments.arg_perif)#\#Trim(arguments.arg_doc)#">

<cfquery name="request_insert" datasource="fund">

INSERT INTO funds(id_fund,id_kae,kae_descr,id_perif,date_id,fund_received,fund_spent,
fund_occasions,fund_request,fund_approved,fund_comment,fund_doc,date_status)
VALUES (<cfqueryparam value="#arguments.arg_id#" cfsqltype="CF_SQL_BIGINT">,
<cfqueryparam value="#arguments.arg_kae#" cfsqltype="CF_SQL_VARCHAR">,
<cfqueryparam value="#arguments.arg_descr#" cfsqltype="CF_SQL_VARCHAR">,
<cfqueryparam value="#arguments.arg_perif#" cfsqltype="CF_SQL_VARCHAR">,
<cfqueryparam value="#arguments.arg_date#" cfsqltype="CF_SQL_VARCHAR">,
<cfqueryparam value="#arguments.arg_received#" cfsqltype="CF_SQL_MONEY">,
<cfqueryparam value="#arguments.arg_spent#" cfsqltype="CF_SQL_MONEY">,
<cfqueryparam value="#arguments.arg_occasions#" cfsqltype="CF_SQL_MONEY">,
<cfqueryparam value="#arguments.arg_request#" cfsqltype="CF_SQL_MONEY">,
<cfqueryparam value="#arguments.arg_approved#" cfsqltype="CF_SQL_MONEY">,
<cfqueryparam value="#arguments.arg_comment#" cfsqltype="CF_SQL_VARCHAR">,
<cfqueryparam value="#Trim(REQUEST.strpath)#" cfsqltype="CF_SQL_VARCHAR">,
<cfqueryparam value="#arguments.arg_datestatus#" cfsqltype="CF_SQL_VARCHAR">)

</cfquery>

<cfreturn "y">

</cffunction>

<cffunction name="perif_datestatus" access="remote">
<cfargument name="perifk" required="Yes">
<cfargument name="datek" required="Yes">
<cfargument name="timek1" required="Yes">
<cfargument name="timek2" required="Yes">

<cfquery name="perif_data" datasource="fund">

SELECT COUNT(*) AS num FROM funds
WHERE id_perif='#Trim(arguments.perifk)#'
AND date_status='#Trim(arguments.datek)#'
AND date_id LIKE '%#Trim(arguments.timek1)#%'
AND date_id LIKE '%#Trim(arguments.timek2)#%'

</cfquery>

<cfif perif_data.num GT 0>
<cfreturn "y">
</cfif>

</cffunction>

<cffunction name="perif_received" access="remote">
<cfargument name="perifk" required="Yes">
<cfargument name="kaek" required="Yes">

<cfquery name="perif_sum" datasource="fund">

SELECT SUM(fund_received) AS total_received
FROM funds
WHERE id_perif='#Trim(arguments.perifk)#' AND id_kae='#Trim(arguments.kaek)#'
GROUP BY id_kae

</cfquery>

<cfif perif_sum.recordcount GT 0>

<cfreturn perif_sum.total_received>
</cfif>

</cffunction>

<cffunction name="perif_spent" access="remote">
<cfargument name="perifk" required="Yes">
<cfargument name="kaek" required="Yes">

<cfquery name="perif_sum" datasource="fund">

SELECT SUM(fund_spent) AS total_spent
FROM funds
WHERE id_perif='#Trim(arguments.perifk)#' AND id_kae='#Trim(arguments.kaek)#'
GROUP BY id_kae

</cfquery>

<cfif perif_sum.recordcount GT 0>

<cfreturn perif_sum.total_spent>
</cfif>

</cffunction>

<cffunction name="perif_occasions" access="remote">
<cfargument name="perifk" required="Yes">
<cfargument name="kaek" required="Yes">

<cfquery name="perif_sum" datasource="fund">

SELECT SUM(fund_occasions) AS total_occasions
FROM funds
WHERE id_perif='#Trim(arguments.perifk)#' AND id_kae='#Trim(arguments.kaek)#'
GROUP BY id_kae

</cfquery>

<cfif perif_sum.recordcount GT 0>

<cfreturn perif_sum.total_occasions>
</cfif>

</cffunction>

<cffunction name="load_spent" access="remote">
<cfargument name="page" type="numeric" required="yes">
<cfargument name="pageSize" type="numeric" required="yes">
<cfargument name="gridsortcolumn" type="string" required="no" default="">
<cfargument name="gridsortdir" type="string" required="no" default="">

<cfset var contacts="">

<cfquery name="kae_data" datasource="fund">

SELECT ' '+kae_id As kcode,kae_description,kae_spent  FROM kae

<cfif arguments.gridsortcolumn NEQ "" and arguments.gridsortdir NEQ "">

ORDER BY #arguments.gridsortcolumn##arguments.gridsortdir#

</cfif>
</cfquery>

<cfreturn QueryConvertForGrid(kae_data,arguments.page,arguments.pageSize)>

</cffunction>

<cffunction name="change_spent" access="remote">
<cfargument name="gridaction" type="string" required="yes">
<cfargument name="gridrow" type="struct" required="yes">
<cfargument name="gridchanged" type="struct" required="yes">

<cfset var colname="">
<cfset var value="">

<cfswitch expression="#arguments.gridaction#">

<cfcase value="U">

<cfset colname=StructKeyList(arguments.gridchanged)>
<cfset value=arguments.gridchanged[colname]>

</cfcase>
</cfswitch>

</cffunction>

<cffunction name="save_index" access="remote">
<cfargument name="kperif" required="yes">

<cfquery name="perif_ind" datasource="fund">

SELECT MAX(id_fund) As max_id  FROM funds
WHERE id_perif='#Trim(arguments.kperif)#'

</cfquery>

<cfif  perif_ind.max_id GT 0>
<cfreturn perif_ind.max_id>
</cfif>

</cffunction>

<cffunction name="save_spent" access="remote">
<cfargument name="kindex" reruired="yes">
<cfargument name="kkae" required="Yes">
<cfargument name="kspent" required="Yes">

<cfquery name="perif_spent" datasource="fund">

UPDATE funds
SET fund_spent=#Trim(arguments.kspent)#
WHERE id_fund=#Trim(arguments.kindex)# AND id_kae='#Trim(arguments.kkae)#'

</cfquery>

<cfreturn "y">
</cffunction>

</cfcomponent>
