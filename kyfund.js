
function ltrim(str) { 
	for(var k = 0; k < str.length && isWhitespace(str.charAt(k)); k++);
	return str.substring(k, str.length);
}


function rtrim(str) {
	for(var j=str.length-1; j>=0 && isWhitespace(str.charAt(j)) ; j--) ;
	return str.substring(0,j+1);
}


function trim(str) {
	return ltrim(rtrim(str));
}

function numberFormat(nStr,prefix){
    var prefix = prefix || '';
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1))
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    return prefix + x1 + x2;
}

rowdata=function(grid,column,columnevent){

var sel=grid.getSelectionModel();
var rec=sel.getSelected();
jsky=new remoteky();

var y1=rec.get('KAE_CODE');
var y2=jsky.kyamount(trim(y1));

document.getElementById("sum_av").value=numberFormat(parseFloat(y2).toFixed(2));
document.getElementById("sum_kon").value=parseFloat(y2).toFixed(2);
}

function rowinit(){

var mygrid=ColdFusion.Grid.getGridObject('requests');
mygrid.on('headerclick',rowdata);
}

function displayky_sum(){

getotal_kyreceived();
getotal_kyspent();
getotal_kyoccasion();
getotal_kyrequest();
//getotal_kyavailable();
getotal_kyapproved();
}

function getotal_kyreceived(){

var grid=ColdFusion.Grid.getGridObject('requests');
var n=grid.dataSource.data.items.length;
var total_item=0;

for(var i=0;i<n;i++){
if (grid.dataSource.data.items[i].get('FUND_RECEIVED'))
total_item+=parseFloat(grid.dataSource.data.items[i].get('FUND_RECEIVED'));
}

document.getElementById("received_id").innerHTML= '<b>' + "Λήψη έως τώρα:" + "<br>" + numberFormat(total_item.toFixed(2)) + '</b>';

}

function getotal_kyspent(){

var grid=ColdFusion.Grid.getGridObject('requests');
var n=grid.dataSource.data.items.length;
var total_item=0;

for(var i=0;i<n;i++){
if (grid.dataSource.data.items[i].get('FUND_SPENT'))
total_item+=parseFloat(grid.dataSource.data.items[i].get('FUND_SPENT'));
}

document.getElementById("spent_id").innerHTML='<b>' + "Ανάλωση πρ/νων μηνών:" + "<br>" + numberFormat(total_item.toFixed(2)) + '</b>';
}


function getotal_kyoccasion(){

var grid=ColdFusion.Grid.getGridObject('requests');
var n=grid.dataSource.data.items.length;
var total_item=0;

for(var i=0;i<n;i++){
if (grid.dataSource.data.items[i].get('FUND_OCCASIONS'))
total_item+=parseFloat(grid.dataSource.data.items[i].get('FUND_OCCASIONS'));
}

document.getElementById("occasion_id").innerHTML='<b>' + "Ανειλημμένες υποχρεώσεις:" + "<br>" + numberFormat(total_item.toFixed(2)) + '</b>';
}

function getotal_kyrequest(){

var grid=ColdFusion.Grid.getGridObject('requests');
var n=grid.dataSource.data.items.length;
var total_item=0;

for(var i=0;i<n;i++){
if (grid.dataSource.data.items[i].get('FUND_REQUEST'))
total_item+=parseFloat(grid.dataSource.data.items[i].get('FUND_REQUEST'));
}

document.getElementById("request_id").innerHTML='<b>' + "Αιτήματα μηνών:" + "<br>" + numberFormat(total_item.toFixed(2)) + '</b>';
}


function getotal_kyavailable(){

var grid=ColdFusion.Grid.getGridObject('requests');
var n=grid.dataSource.data.items.length;
var total_item=0;

for(var i=0;i<n;i++){
if (grid.dataSource.data.items[i].get('FUND_AVAILABLE'))
total_item+=parseFloat(grid.dataSource.data.items[i].get('FUND_AVAILABLE'));
}

document.getElementById("available_id").innerHTML='<b>' + "Διαθέσιμο:" + "<br>" + numberFormat(total_item.toFixed(2)) + '</b>';
}

function getotal_kyapproved(){

var grid=ColdFusion.Grid.getGridObject('requests');
var n=grid.dataSource.data.items.length;
var total_item=0;

for(var i=0;i<n;i++){
if (grid.dataSource.data.items[i].get('FUND_APPROVED'))
total_item+=parseFloat(grid.dataSource.data.items[i].get('FUND_APPROVED'));
}

document.getElementById("approved_id").innerHTML='<b>' + "Απόδοση:" + "<br>" + numberFormat(total_item.toFixed(2)) + '</b>';
}


function save_reportky(){

kae1=new Array();
var data_all;
jsky=new updateky();

kae1[0]="0711";
kae1[1]="0712";
kae1[2]="0713";
kae1[3]="0813";
kae1[4]="0819";
kae1[5]="0823";
kae1[6]="0824";
kae1[7]="0829";
kae1[8]="0831";
kae1[9]="0839";
kae1[10]="0843";
kae1[11]="0845";
kae1[12]="0851";
kae1[13]="0861";
kae1[14]="0869";
kae1[15]="0871";
kae1[16]="0873";
kae1[17]="0875";
kae1[18]="0879";
kae1[19]="0899";
kae1[20]="1111";
kae1[21]="1121";
kae1[22]="1211";
kae1[23]="1231";
kae1[24]="1311";
kae1[25]="1321";
kae1[26]="1329";
kae1[27]="1511";
kae1[28]="1512";
kae1[29]="1611";
kae1[30]="1619";
kae1[31]="1699";
kae1[32]="1711";
kae1[33]="1712";
kae1[34]="1713";
kae1[35]="1723";
kae1[36]="1725";
kae1[37]="1729";


for (var j=0;j<kae1.length;j++){

var all_inputs=document.getElementsByName(kae1[j]);
var n=all_inputs.length;

for (var i=0;i<n;i++){

var y=all_inputs[i].value;
data_all=y.split("*");

jsky.update_ky(data_all[0],data_all[1],data_all[2],data_all[3],data_all[4],data_all[5],data_all[6]);
}
}
alert("Η αποθήκευση των αποδόσεων ολοκληρώθηκε με επιτυχία!");

}