

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

/*
function gridvision(){

var grid=ColdFusion.Grid.getGridObject('kae_grid');
var cols=grid.getColumnModel();


document.getElementById("data2").style.visibility="visible";

cols.setHidden(0,false);
cols.setHidden(1,false);
cols.setHidden(2,false);
cols.setHidden(3,false);
cols.setHidden(4,false);
cols.setHidden(5,false);
cols.setHidden(6,false);
grid.reconfigure(grid.getDataSource(),cols);

//dupl_gridata();
}
*/

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

spent_data=function(editEvent){

var y=trim(document.getElementById("kon").value);

if (y!="hello"){
alert("�������� ������� ��� ������ ��� ������������� ���������� ��� �� ���������� ��� ���������� ��� ��������!"); 
editEvent.cancel=true;
}

if (y=="hello"){
var grid=ColdFusion.Grid.getGridObject('kae_grid');
var sel=grid.getSelectionModel();
var rec=sel.getSelected();

var x=parseFloat(rec.get('KAE_SPENT'))+parseFloat(editEvent.value);
rec.set('KAE_SPENT',parseFloat(x).toFixed(2));
alert("�� ���� ��� ����� �������� ���������� �� �� �����������!");
editEvent.cancel=true;
}
}

function spent_init(){

var grid=ColdFusion.Grid.getGridObject('kae_grid');
grid.on('validateedit',spent_data);
}

function save_spent(perif){

var grid=ColdFusion.Grid.getGridObject('kae_grid');
var n=grid.dataSource.data.items.length;

jsidfund=new remoteindex();
jssave=new remotesave();

var fund_index=jsidfund.save_index(perif);

for(var i=0;i<n;i++){

var f_kae=grid.dataSource.data.items[i].get('KCODE');
var f_spent=grid.dataSource.data.items[i].get('KAE_SPENT');
var kon=jssave.save_spent(fund_index,f_kae,f_spent);
}

if (kon=="y"){
alert("H �������� ��� �������� ������������ �� ��������!");
document.form_apply.reset();
ColdFusion.Grid.refresh('kae_grid');
}
}

function save_data(perif){

kae1=new Array(38);
kae2=new Array(38);
var grid=ColdFusion.Grid.getGridObject('kae_grid');
var n=grid.dataSource.data.items.length;
//var #ToScript(cookie.userid,"perif")#;


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

kae2[0]="����� ����������� ��� ��������� ������� ���������� (�������� - ����)";
kae2[1]="����� ��������� � ��������� ��� ���������";
kae2[2]="����� ����������� ��� �� ��������� ��� ��������� ��� ���������� ������� ���������� (�������� - ����)";
kae2[3]="��������� �������";
kae2[4]="������ ���������";
kae2[5]="�����������";
kae2[6]="����������� ��� ������ ����������������� ��������� (����, ��������� & ������� �������������)";
kae2[7]="������ ���������";
kae2[8]="������� ��� �������";
kae2[9]="������� ������������";
kae2[10]="�������� - ���������� - ����������� (�������������� ��� � ��������� ������)";
kae2[11]="���� ������ ������ �������� �������";
kae2[12]="������� ��� ��������� ��� �������� �������";
kae2[13]="������� ��� ��������� ��� �������� ����������� ����� ����� ������";
kae2[14]="������� ��� ��������� ��� �������� ������ ����������";
kae2[15]="������� ������� ��������";
kae2[16]="������� ������� ��������";
kae2[17]="������� ��� ������� ������������ (����/���� ������ ��� �������������)";
kae2[18]="������ ������� ���� �������� ������� ���������";
kae2[19]="������ ������� �������";
kae2[20]="��������� �������, �������� ����� ��� ������ ������� ������";
kae2[21]="��������� �������, ������������, ����������, ���������� ��� ������ ������� ��������";
kae2[22]="��������� ������������ ��� ������������� ������";
kae2[23]="��������� ����� ������������";
kae2[24]="��������� ����� ���������� ��� ��������� �������������";
kae2[25]="��������� ����� ���������� ��� ��������� ����������� ����� ����� ������";
kae2[26]="��������� ����� ���������� ��� ��������� ���� ������ ������ ����������";
kae2[27]="��������� �������� ��� ����������";
kae2[28]="��������� �������� ��������� ��� ������� ������������";
kae2[29]="����������� �������� ���������, ���������� ��� ������ ������ ������ ���������� ���������� ������";
kae2[30]="������ ���������� (������ ����������)";
kae2[31]="������ ����������";
kae2[32]="��������� �������";
kae2[33]="��������� �������� ��������� ��� �����������";
kae2[34]="��������� ������������, ����������� �������������� ��� ������� ��������";
kae2[35]="��������� ������������ �����������, ������������ ��� ������ ������";
kae2[36]="��������� ���� ������ �����������������, �������������� ��� ������ �������� ������������ ����������";
kae2[37]="��������� ���� ������ ��������� & ������ ����������";

jsfund=new remotefund();
jsdata=new remotedata();
jstime=new remotetime();

for(var j=0;j<2;j++){
if (document.form_grid.period[j].checked==true){
var mn=document.form_grid.period[j].value;
}
}

var date_request=trim(document.getElementById("ndata1").innerHTML);
var fund_index=jsfund.new_index();
var docx=window.frames[0].document.form_upload.kfile.value;
//var data_perif=jsperif.save_perif(fund_index,perif,date_request,mn);

var new_date=new String(date_request);
var pos=new_date.indexOf(":");

var date_data=new_date.substr(pos+1);
var new_pos=trim(date_data).indexOf(" ");
var date1=trim(date_data).substr(0,new_pos);
var date2=trim(date_data).substr(new_pos,trim(date_data).length);

if (trim(mn)=="��������"){
var fund_time=jstime.perif_datestatus(perif,mn,date1,date2);
if (fund_time=="y"){
alert("���� ��� ����������� �������� ������ ��� ����� ��� �������!�������� �������� ���� ���� ���������.");
return;
}
}

for (var i=0;i<n;i++)
{

var f_approved=0;
//var f_received=8765;
//var f_spent=8766.8;
//var f_occasions=76766;
//var f_request=23334;

var f_received=grid.dataSource.data.items[i].get('KAE_RECEIVED');
var f_spent=grid.dataSource.data.items[i].get('KAE_SPENT');
var f_occasions=grid.dataSource.data.items[i].get('KAE_OCCASIONS');
var f_request=grid.dataSource.data.items[i].get('KAE_REQUEST');
var f_comment=grid.dataSource.data.items[i].get('KAE_COMMENT');
var f_doc=trim(docx);

//var xy=new String(f_received);
//var xy1=new String(f_spent);
//var xy2=new String(f_occasions);
//var xy3=new String(f_request);
//var xy4=new String(f_comment);

/*
if (trim(xy).length==0)
f_received=0;

if (trim(xy1).length==0){
alert("�������� �������� ���� ��� ������� ������������ ���� �������: " + (i+1));
return;
}

if (trim(xy2).length==0){
alert("�������� �������� ���� ��� ������������ ����������� ���� �������: " + (i+1));
return;
}

if (trim(xy3).length==0){
alert("�������� �������� ���� ��� �������� ����� ���� �������: " + (i+1));
return;
}

if (trim(xy4).length==0){
alert("�������� �������� ���� ��� ������ ���� �������: " + (i+1));
return;
}
*/

if (!f_spent)
f_spent=0;

if (!f_occasions)
f_occasions=0;

if (!f_request)
f_request=0;

if (!f_comment)
f_comment="*";

if (!f_received)
f_received=0;

var kon=jsdata.save_request(fund_index,kae1[i],kae2[i],perif,date_request,f_received,f_spent,f_occasions,f_request,f_approved,f_comment,f_doc,mn);
}

if (kon=="y"){
alert("� �������� ��� ��������� ������������ �� ��������!");
document.getElementById("ndata1").innerHTML="";
document.form_grid.reset();
ColdFusion.Grid.refresh('kae_grid');
}
}

function display_date(){

var current=new Date();

var day=current.getDate();
var month=current.getMonth()+1;
var year=current.getFullYear();
var y1="����������: "+ day+"/"+month+"/"+year + "<br>" + "� ������������ ��� ����������";
return y1;
}

function close_kyreport(){

var my_parent=window.opener;
window.close();
my_parent.document.form_request.kon.style.visibility="hidden";
}

function save_button(){
var my_parent=window.opener;
my_parent.document.form_request.kon.style.visibility="hidden";

}

formatprice=function(data,cellmd,record,row,col,store){

if (data)
return numberFormat(parseFloat(data).toFixed(2));
//parseFloat(data).toFixed(2);
else if (data==0)
return numberFormat(parseFloat(0).toFixed(2));
//parseFloat(0).toFixed(2);
}

kysymbol=function(){

var grid=ColdFusion.Grid.getGridObject('requests');

cm=grid.getColumnModel();
cm.setRenderer(5,formatprice);
cm.setRenderer(6,formatprice);
cm.setRenderer(7,formatprice);
cm.setRenderer(8,formatprice);
cm.setRenderer(9,formatprice);
grid.reconfigure(grid.getDataSource(),cm);
}

d2symbol=function(){

var grid=ColdFusion.Grid.getGridObject('requests');

cm=grid.getColumnModel();
cm.setRenderer(3,formatprice);
cm.setRenderer(4,formatprice);
cm.setRenderer(5,formatprice);
cm.setRenderer(6,formatprice);
grid.reconfigure(grid.getDataSource(),cm);
}

d1symbol=function(){

var grid=ColdFusion.Grid.getGridObject('requests');

cm=grid.getColumnModel();
cm.setRenderer(2,formatprice);
cm.setRenderer(3,formatprice);
cm.setRenderer(4,formatprice);
cm.setRenderer(5,formatprice);
cm.setRenderer(6,formatprice);
grid.reconfigure(grid.getDataSource(),cm);
}

perifsymbol=function(){

var grid=ColdFusion.Grid.getGridObject('kae_grid');

cm=grid.getColumnModel();
cm.setRenderer(2,formatprice);
cm.setRenderer(3,formatprice);
cm.setRenderer(4,formatprice);
cm.setRenderer(5,formatprice);
grid.reconfigure(grid.getDataSource(),cm);
}

expensesymbol=function(){

var grid=ColdFusion.Grid.getGridObject('kae_grid');

cm=grid.getColumnModel();
cm.setRenderer(2,formatprice);
grid.reconfigure(grid.getDataSource(),cm);
}