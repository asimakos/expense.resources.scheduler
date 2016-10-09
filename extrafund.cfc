<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfcomponent>

<cffunction name="get_kaeperiod" access="remote" returntype="struct">
<cfargument name="page" type="numeric" required="Yes">
<cfargument name="pageSize" type="numeric" required="Yes">
<cfargument name="ckae" type="string" required="No" default="">
<cfargument name="month" type="string" required="No" default="">
<cfargument name="year" type="string" required="No" default="">
<cfargument name="gridsortcolumn" type="string" required="No" default="">
<cfargument name="gridsortdir" type="string" required="No" default="">

<cfset var get_requests="">

<cfquery name="get_requests" datasource="fund">

<cfswitch expression="#Trim(arguments.ckae)#">

<cfcase value="0700"> 

SELECT ' '+id_kae AS kcode,kae_descr,SUM(fund_received) AS received,date_id,
SUM(fund_spent) AS spent,SUM(fund_occasions) AS occasions,
SUM(fund_request) AS request
FROM funds
WHERE
fund_approved=0
<cfif len(#Trim(arguments.ckae)#)>
AND id_kae IN ('0711','0712','0713')
</cfif>

<cfif len(#Trim(arguments.month)#)>
AND date_id LIKE '%#arguments.month#%'
</cfif>

<cfif len(#Trim(arguments.year)#)>
AND date_id LIKE '%#arguments.year#%'
</cfif>

GROUP BY id_kae,kae_descr,date_id
<cfif arguments.gridsortcolumn NEQ "" AND arguments.gridsortdir NEQ "">
ORDER BY #arguments.gridsortcolumn# #arguments.gridsortdir#
</cfif>
</cfcase>

<cfcase value="0800">

SELECT ' '+id_kae AS kcode,kae_descr,SUM(fund_received) AS received,date_id,
SUM(fund_spent) AS spent,SUM(fund_occasions) AS occasions,
SUM(fund_request) AS request
FROM funds
WHERE
fund_approved=0
<cfif len(#Trim(arguments.ckae)#)>
AND id_kae IN ('0813','0819','0823','0824','0829','0831','0839','0843','0845','0851','0861','0869',
'0871','0873','0875','0879','0899')
</cfif>

<cfif len(#Trim(arguments.month)#)>
AND date_id LIKE '%#arguments.month#%'
</cfif>

<cfif len(#Trim(arguments.year)#)>
AND date_id LIKE '%#arguments.year#%'
</cfif>

GROUP BY id_kae,kae_descr,date_id
<cfif arguments.gridsortcolumn NEQ "" AND arguments.gridsortdir NEQ "">
ORDER BY #arguments.gridsortcolumn# #arguments.gridsortdir#
</cfif>
</cfcase>

<cfcase value="1100"> 

SELECT  id_kae AS kcode,kae_descr,SUM(fund_received) AS received,date_id,
SUM(fund_spent) AS spent,SUM(fund_occasions) AS occasions,
SUM(fund_request) AS request
FROM funds
WHERE
fund_approved=0
<cfif len(#Trim(arguments.ckae)#)>
AND id_kae IN ('1111','1121')
</cfif>

<cfif len(#Trim(arguments.month)#)>
AND date_id LIKE '%#arguments.month#%'
</cfif>

<cfif len(#Trim(arguments.year)#)>
AND date_id LIKE '%#arguments.year#%'
</cfif>

GROUP BY id_kae,kae_descr,date_id
<cfif arguments.gridsortcolumn NEQ "" AND arguments.gridsortdir NEQ "">
ORDER BY #arguments.gridsortcolumn# #arguments.gridsortdir#
</cfif>
</cfcase>

<cfcase value="1200"> 

SELECT  id_kae AS kcode,kae_descr,SUM(fund_received) AS received,date_id,
SUM(fund_spent) AS spent,SUM(fund_occasions) AS occasions,
SUM(fund_request) AS request
FROM funds
WHERE
fund_approved=0
<cfif len(#Trim(arguments.ckae)#)>
AND id_kae IN ('1211','1231')
</cfif>

<cfif len(#Trim(arguments.month)#)>
AND date_id LIKE '%#arguments.month#%'
</cfif>

<cfif len(#Trim(arguments.year)#)>
AND date_id LIKE '%#arguments.year#%'
</cfif>

GROUP BY id_kae,kae_descr,date_id
<cfif arguments.gridsortcolumn NEQ "" AND arguments.gridsortdir NEQ "">
ORDER BY #arguments.gridsortcolumn# #arguments.gridsortdir#
</cfif>
</cfcase>

<cfcase value="1300"> 

SELECT  id_kae AS kcode,kae_descr,SUM(fund_received) AS received,date_id,
SUM(fund_spent) AS spent,SUM(fund_occasions) AS occasions,
SUM(fund_request) AS request
FROM funds
WHERE
fund_approved=0
<cfif len(#Trim(arguments.ckae)#)>
AND id_kae IN ('1311','1321','1329')
</cfif>

<cfif len(#Trim(arguments.month)#)>
AND date_id LIKE '%#arguments.month#%'
</cfif>

<cfif len(#Trim(arguments.year)#)>
AND date_id LIKE '%#arguments.year#%'
</cfif>

GROUP BY id_kae,kae_descr,date_id
<cfif arguments.gridsortcolumn NEQ "" AND arguments.gridsortdir NEQ "">
ORDER BY #arguments.gridsortcolumn# #arguments.gridsortdir#
</cfif>
</cfcase>

<cfcase value="1500"> 

SELECT  id_kae AS kcode,kae_descr,SUM(fund_received) AS received,date_id,
SUM(fund_spent) AS spent,SUM(fund_occasions) AS occasions,
SUM(fund_request) AS request
FROM funds
WHERE
fund_approved=0
<cfif len(#Trim(arguments.ckae)#)>
AND id_kae IN ('1511','1512')
</cfif>

<cfif len(#Trim(arguments.month)#)>
AND date_id LIKE '%#arguments.month#%'
</cfif>

<cfif len(#Trim(arguments.year)#)>
AND date_id LIKE '%#arguments.year#%'
</cfif>

GROUP BY id_kae,kae_descr,date_id
<cfif arguments.gridsortcolumn NEQ "" AND arguments.gridsortdir NEQ "">
ORDER BY #arguments.gridsortcolumn# #arguments.gridsortdir#
</cfif>
</cfcase>

<cfcase value="1600"> 

SELECT  id_kae AS kcode,kae_descr,SUM(fund_received) AS received,date_id,
SUM(fund_spent) AS spent,SUM(fund_occasions) AS occasions,
SUM(fund_request) AS request
FROM funds
WHERE
fund_approved=0
<cfif len(#Trim(arguments.ckae)#)>
AND id_kae IN ('1611','1619','1699')
</cfif>

<cfif len(#Trim(arguments.month)#)>
AND date_id LIKE '%#arguments.month#%'
</cfif>

<cfif len(#Trim(arguments.year)#)>
AND date_id LIKE '%#arguments.year#%'
</cfif>

GROUP BY id_kae,kae_descr,date_id
<cfif arguments.gridsortcolumn NEQ "" AND arguments.gridsortdir NEQ "">
ORDER BY #arguments.gridsortcolumn# #arguments.gridsortdir#
</cfif>
</cfcase>

<cfcase value="1700"> 

SELECT  id_kae AS kcode,kae_descr,SUM(fund_received) AS received,date_id,
SUM(fund_spent) AS spent,SUM(fund_occasions) AS occasions,
SUM(fund_request) AS request
FROM funds
WHERE
fund_approved=0
<cfif len(#Trim(arguments.ckae)#)>
AND id_kae IN ('1711','1712','1713','1723','1725','1729')
</cfif>

<cfif len(#Trim(arguments.month)#)>
AND date_id LIKE '%#arguments.month#%'
</cfif>

<cfif len(#Trim(arguments.year)#)>
AND date_id LIKE '%#arguments.year#%'
</cfif>

GROUP BY id_kae,kae_descr,date_id
<cfif arguments.gridsortcolumn NEQ "" AND arguments.gridsortdir NEQ "">
ORDER BY #arguments.gridsortcolumn# #arguments.gridsortdir#
</cfif>
</cfcase>

</cfswitch>

</cfquery>
<cfreturn QueryConvertForGrid(get_requests,arguments.page,arguments.pageSize)>
 
</cffunction>


<cffunction name="editkae_request" access="remote">
<cfargument name="gridaction" type="string" required="Yes">
<cfargument name="gridrow" type="struct" required="Yes">
<cfargument name="gridchanged" type="struct" required="Yes">

<cfset var colname="">
<cfset var value="">

<!---
<cfswitch expression="#arguments.gridaction#">
<cfcase value="U">

<cfset colname=structKeyList(arguments.gridchanged)>
<cfset value=arguments.gridchanged[colname]>

<cfquery name="change_request" datasource="fund">

UPDATE funds
SET #colname#='#value#'
WHERE id_fund=#arguments.gridrow.id_fund# AND id_kae=#arguments.gridrow.id_kae#

</cfquery>
</cfcase>
</cfswitch>
--->
</cffunction>

<cffunction name="getkykae_data" access="remote" returntype="struct">
<cfargument name="page" type="numeric" required="Yes">
<cfargument name="pageSize" type="numeric" required="Yes">
<cfargument name="ckae" type="string" required="No" default="">
<cfargument name="month" type="string" required="No" default="">
<cfargument name="year" type="string" required="No" default="">
<cfargument name="gridsortcolumn" type="string" required="No" default="">
<cfargument name="gridsortdir" type="string" required="No" default="">

<cfset var get_requests="">

<cfquery name="get_requests" datasource="fund">

SELECT ' '+id_kae AS kae_code,date_id,date_status,id_perif,fund_received,
fund_spent,fund_occasions,fund_request,fund_approved,fund_comment FROM funds
WHERE
fund_approved=0
<cfif len(arguments.ckae)>
AND id_kae LIKE '%#arguments.ckae#%'
</cfif>

<cfif len(arguments.month)>
AND date_id LIKE '%#arguments.month#%'
</cfif>

<cfif len(arguments.year)>
AND date_id LIKE '%#arguments.year#%'
</cfif>

<cfif arguments.gridsortcolumn NEQ "" AND arguments.gridsortdir NEQ "">
ORDER BY #arguments.gridsortcolumn# #arguments.gridsortdir#
</cfif>

</cfquery>
 
<cfreturn QueryConvertForGrid(get_requests,arguments.page,arguments.pageSize)>
 
</cffunction>

<cffunction name="kyamount" access="remote">
<cfargument name="kae_name" required="Yes">

<cfset var kae_num=0>
<cfquery name="kae_amount" datasource="fund">
SELECT amount FROM kae_avail
WHERE kae_code='#arguments.kae_name#'
</cfquery>

<cfif kae_amount.recordcount GT 0>

<cfset kae_num=kae_amount.amount>
<cfelse>
<cfset kae_num=0>
</cfif>

<cfreturn kae_num>

</cffunction>

</cfcomponent>