

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


function isWhitespace(charToCheck) {
	var whitespaceChars = " \t\n\r\f";
	return (whitespaceChars.indexOf(charToCheck) != -1);
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

update_kae=function(editEvent){

var grid=ColdFusion.Grid.getGridObject('requests');
var sel=grid.getSelectionModel();
var rec=sel.getSelected();
//var y_d=rec.get('KAE_DESCR');
var y_d=rec.get('KCODE');
var y_m=editEvent.value;
var y_f="";

//alert(rec.get('REQUEST'));

if (parseFloat(rec.get('REQUEST'))<parseFloat(y_m)){
alert("�� ��������� ���� ����� ���������� ��� �� �����������! �������� �������� ��� ����� ����.");
editEvent.cancel=true;
return;
}

jsupdate=new remoteupdate();

y_f=jsupdate.update_kae(trim(y_d),y_m);

if (y_f=="y")
alert("�� ��������� ���� ������������ �� ��������!");

}


function updateinit(){

var grid=ColdFusion.Grid.getGridObject('requests');
grid.on('validateedit',update_kae);

}


function displaykae_sum(){

getotal_received();
getotal_spent();
getotal_occasion();
getotal_request();
getotal_available();
getotal_approved();
}


function getotal_received(){

var grid=ColdFusion.Grid.getGridObject('requests');
var n=grid.dataSource.data.items.length;
var total_item=0;

for(var i=0;i<n;i++){
if (grid.dataSource.data.items[i].get('RECEIVED'))
total_item+=parseFloat(grid.dataSource.data.items[i].get('RECEIVED'));
}

document.getElementById("received_id").innerHTML= '<b>' + "���� ��� ����:" + "<br>" + numberFormat(total_item.toFixed(2)) + '</b>';

}


function getotal_spent(){

var grid=ColdFusion.Grid.getGridObject('requests');
var n=grid.dataSource.data.items.length;
var total_item=0;

for(var i=0;i<n;i++){
if (grid.dataSource.data.items[i].get('SPENT'))
total_item+=parseFloat(grid.dataSource.data.items[i].get('SPENT'));
}

document.getElementById("spent_id").innerHTML='<b>' + "������� ��/��� �����:" + "<br>" + numberFormat(total_item.toFixed(2)) + '</b>';
}


function getotal_occasion(){

var grid=ColdFusion.Grid.getGridObject('requests');
var n=grid.dataSource.data.items.length;
var total_item=0;

for(var i=0;i<n;i++){
if (grid.dataSource.data.items[i].get('OCCASIONS'))
total_item+=parseFloat(grid.dataSource.data.items[i].get('OCCASIONS'));
}

document.getElementById("occasion_id").innerHTML='<b>' + "������������ �����������:" + "<br>" + numberFormat(total_item.toFixed(2)) + '</b>';
}

function getotal_request(){

var grid=ColdFusion.Grid.getGridObject('requests');
var n=grid.dataSource.data.items.length;
var total_item=0;

for(var i=0;i<n;i++){
if (grid.dataSource.data.items[i].get('REQUEST'))
total_item+=parseFloat(grid.dataSource.data.items[i].get('REQUEST'));
}

document.getElementById("request_id").innerHTML='<b>' + "�������� �����:" + "<br>" + numberFormat(total_item.toFixed(2)) + '</b>';
}


function getotal_available(){

var grid=ColdFusion.Grid.getGridObject('requests');
var n=grid.dataSource.data.items.length;
var total_item=0;

for(var i=0;i<n;i++){
if (grid.dataSource.data.items[i].get('AVAILABLE'))
total_item+=parseFloat(grid.dataSource.data.items[i].get('AVAILABLE'));
}

document.getElementById("available_id").innerHTML='<b>' + "���������:" + "<br>" + numberFormat(total_item.toFixed(2)) + '</b>';
}


function getotal_approved(){

var grid=ColdFusion.Grid.getGridObject('requests');
var n=grid.dataSource.data.items.length;
var total_item=0;

for(var i=0;i<n;i++){
if (grid.dataSource.data.items[i].get('APPROVED'))
total_item+=parseFloat(grid.dataSource.data.items[i].get('APPROVED'));
}

document.getElementById("approved_id").innerHTML='<b>' + "�������:" + "<br>" + numberFormat(total_item.toFixed(2)) + '</b>';
}


function flash_perif(){

var y="";
var grid=ColdFusion.Grid.getGridObject('requests');
var n=grid.dataSource.data.items.length;

for(var i=0;i<n;i++){
if (grid.dataSource.data.items[i].get('ID_PERIF')){

y=grid.dataSource.data.items[i].get('ID_PERIF');

if (y=="100")
alert("KON");
else if (y=="110")
grid.dataSource.data.items[i].set('KON',"�������");
else if(y=="120")
grid.dataSource.data.items[i].set('KON',"��������� ����������");
else if(y=="1301")
grid.dataSource.data.items[i].set('KON',"����. ���������� - ������ (KOMOTHNH)");
else if(y=="1302")
grid.dataSource.data.items[i].set('KON',"����. ���������� - ������ (������)");
else if(y=="1303")
grid.dataSource.data.items[i].set('KON',"����. ���������� - ������ (����/����)");
else if(y=="140")
grid.dataSource.data.items[i].set('KON',"������� ����������");
else if(y=="1501")
grid.dataSource.data.items[i].set('KON',"������� (��������)");
else if(y=="1502")
grid.dataSource.data.items[i].set('KON',"������� (�����/���)");
else if(y=="1601")
grid.dataSource.data.items[i].set('KON',"��������� (������)");
else if(y=="1602")
grid.dataSource.data.items[i].set('KON',"��������� (�����)");
else if(y=="170")
grid.dataSource.data.items[i].set('KON',"������ �����");
else if(y=="180")
grid.dataSource.data.items[i].set('KON',"������� �������");
else if(y=="190")
grid.dataSource.data.items[i].set('KON',"������� �������");
else if(y=="2001")
grid.dataSource.data.items[i].set('KON',"������������ (�������)");
else if(y=="2002")
grid.dataSource.data.items[i].set('KON',"������������ (�����)");
else if(y=="210")
grid.dataSource.data.items[i].set('KON',"������� �������");
else if(y=="220")
grid.dataSource.data.items[i].set('KON',"������ �������");
else if(y=="230")
grid.dataSource.data.items[i].set('KON',"������");
else if(y=="250")
grid.dataSource.data.items[i].set('KON',"�����");
else if(y=="260")
grid.dataSource.data.items[i].set('KON',"�����");
else
grid.dataSource.data.items[i].set('KON'," ");

}
}
}
