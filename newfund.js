

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


dataValidator=function(editEvent){

var grid=ColdFusion.Grid.getGridObject('requests');
var sel=grid.getSelectionModel();
var rec=sel.getSelected();
var x=document.form_request.kkae.value;
var y1=0;
var y2=0;
var y_dif=0;

y1=rec.get('FUND_RECEIVED');
y2=document.getElementById("sum_kon").value;

y_dif=parseFloat(editEvent.value)-parseFloat(rec.get('FUND_APPROVED'));

rec.set('FUND_RECEIVED',parseFloat(y1)+parseFloat(y_dif));
//rec.set('FUND_AVAILABLE',parseFloat(y2)-parseFloat(editEvent.value));

var y_received=parseFloat(y1)+parseFloat(y_dif);
var y_avail=parseFloat(y2)-parseFloat(y_dif);

document.getElementById("sum_kon").value=parseFloat(y_avail).toFixed(2);
document.getElementById("sum_av").value=numberFormat(parseFloat(y_avail).toFixed(2));

var y=rec.get('ID_PERIF') + "*" + x + "*" + rec.get('DATE_ID') + "*" + rec.get('DATE_STATUS') + "*" + editEvent.value + "*" + y_received + "*" + y_avail;

var element=document.createElement("input");
element.setAttribute("type","hidden");
element.setAttribute("value",y);
element.setAttribute("name",x);

var kon=document.getElementById("kaelist");
kon.appendChild(element);

}

function kaeinit(){

var grid=ColdFusion.Grid.getGridObject('requests');
grid.on('validateedit',dataValidator);

}

function open_report(){

var little=window.open("kyreport.cfm","_blank","menubar,toolbar,scrollbars,width=900,height=900,resizable");
little.moveTo(80,10);
little.focus();
document.getElementById("kon").style.visibility="visible";
}

function getkae_code(){

var y1="KAE"+"<br>";
y1+="0711"+"<br>";
y1+="0712"+"<br>";
y1+="0713"+"<br>";
y1+="0813"+"<br>";
y1+="0819"+"<br>";
y1+="0823"+"<br>";
y1+="0824"+"<br>";
y1+="0829"+"<br>";
y1+="0831"+"<br>";
y1+="0839"+"<br>";
y1+="0843"+"<br>";
y1+="0845"+"<br>";
y1+="0851"+"<br>";
y1+="0861"+"<br>";
y1+="0869"+"<br>";
y1+="0871"+"<br>";
y1+="0873"+"<br>";
y1+="0875"+"<br>";
y1+="0879"+"<br>";
y1+="0899"+"<br>";
y1+="1111"+"<br>";
y1+="1121"+"<br>";
y1+="1211"+"<br>";
y1+="1231"+"<br>";
y1+="1311"+"<br>";
y1+="1321"+"<br>";
y1+="1329"+"<br>";
y1+="1511"+"<br>";
y1+="1512"+"<br>";
y1+="1611"+"<br>";
y1+="1619"+"<br>";
y1+="1699"+"<br>";
y1+="1711"+"<br>";
y1+="1712"+"<br>";
y1+="1713"+"<br>";
y1+="1723"+"<br>";
y1+="1725"+"<br>";
y1+="1729"+"<br>";

return y1;

}

function getp_110(){

var my_parent=window.opener;
var x_110="аттийг"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_110=0;

for (var j=0;j<kae1.length;j++){

//var all_inputs=my_parent.document.getElementById("kaelist").getElementsByName(kae1[j]);
var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="110"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_110+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_120(){

var my_parent=window.opener;
var x_110="йемтя. лайедомиа"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_120=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="120"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_120+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_130a(){

var my_parent=window.opener;
var x_110="йолотгмг"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_130a=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="1301"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_130a+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_140(){

var my_parent=window.opener;
var x_110="дут.лайедомиа"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_140=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="140"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_140+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_150a(){

var my_parent=window.opener;
var x_110="иыаммима"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_150a=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="1501"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_150a+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_160a(){

var my_parent=window.opener;
var x_110="каяиса"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_160a=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="1601"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_160a+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_170(){

var my_parent=window.opener;
var x_110="иом. мгсиа"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_170=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="170"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_170+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_180(){

var my_parent=window.opener;
var x_110="дут. еккада"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_180=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="180"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_180+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_190(){

var my_parent=window.opener;
var x_110="стея. еккада"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_190=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="190"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_190+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_200a(){

var my_parent=window.opener;
var x_110="тяипокг"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_200a=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="2001"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_200a+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_210(){

var my_parent=window.opener;
var x_110="боя. аицаио"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_210=0;
for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="210"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_210+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_220(){

var my_parent=window.opener;
var x_110="мот. аицаио"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_220=0;
for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="220"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_220+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_230(){

var my_parent=window.opener;
var x_110="йягтг"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_230=0;
for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="230"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_230+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_250(){

var my_parent=window.opener;
var x_110="едеуа"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length

sum_250=0;
for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="250"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_250+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_260(){

var my_parent=window.opener;
var x_110="едеух"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_260=0;
for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="260"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_260+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_130b(){

var my_parent=window.opener;
var x_110="йабака"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_130b=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="1302"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_130b+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_130c(){

var my_parent=window.opener;
var x_110="акен/покг"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_130c=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="1303"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_130c+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_150b(){

var my_parent=window.opener;
var x_110="гцоул/тса"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_150b=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="1502"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_150b+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_160b(){

var my_parent=window.opener;
var x_110="бокос"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_160b=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="1602"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_160b+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function getp_200b(){

var my_parent=window.opener;
var x_110="йакалата"+"<br>";
var data_110;

kae1=new Array();

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

//kae1.length
sum_200b=0;

for (var j=0;j<kae1.length;j++){

var all_inputs=my_parent.document.getElementById("kaelist");
var n=all_inputs.childNodes.length;

for(var i=n-1;i>0;i--){

if (trim(all_inputs.childNodes[i].name)==trim(kae1[j])){

var y=all_inputs.childNodes[i].value;
data_110=y.split("*");
if (trim(data_110[0])=="2002"){
x_110+=numberFormat(parseFloat(data_110[4]).toFixed(2))+"<br>";
sum_200b+=parseFloat(data_110[4]).toFixed(2);
break;
}
}
}
}
return trim(x_110);
}

function total_sum(){

document.getElementById("syn1").innerHTML=numberFormat(parseFloat(sum_110).toFixed(2));
document.getElementById("syn2").innerHTML=numberFormat(parseFloat(sum_120).toFixed(2));
document.getElementById("syn3").innerHTML=numberFormat(parseFloat(sum_130a).toFixed(2));
document.getElementById("syn4").innerHTML=numberFormat(parseFloat(sum_130b).toFixed(2));
document.getElementById("syn5").innerHTML=numberFormat(parseFloat(sum_130c).toFixed(2));
document.getElementById("syn6").innerHTML=numberFormat(parseFloat(sum_140).toFixed(2));
document.getElementById("syn7").innerHTML=numberFormat(parseFloat(sum_150a).toFixed(2));
document.getElementById("syn8").innerHTML=numberFormat(parseFloat(sum_150b).toFixed(2));
document.getElementById("syn9").innerHTML=numberFormat(parseFloat(sum_160a).toFixed(2));
document.getElementById("syn10").innerHTML=numberFormat(parseFloat(sum_160b).toFixed(2));
document.getElementById("syn11").innerHTML=numberFormat(parseFloat(sum_170).toFixed(2));
document.getElementById("syn12").innerHTML=numberFormat(parseFloat(sum_180).toFixed(2));
document.getElementById("syn13").innerHTML=numberFormat(parseFloat(sum_190).toFixed(2));
document.getElementById("syn14").innerHTML=numberFormat(parseFloat(sum_200a).toFixed(2));
document.getElementById("syn15").innerHTML=numberFormat(parseFloat(sum_200b).toFixed(2));
document.getElementById("syn16").innerHTML=numberFormat(parseFloat(sum_210).toFixed(2));
document.getElementById("syn17").innerHTML=numberFormat(parseFloat(sum_220).toFixed(2));
document.getElementById("syn18").innerHTML=numberFormat(parseFloat(sum_230).toFixed(2));
document.getElementById("syn19").innerHTML=numberFormat(parseFloat(sum_250).toFixed(2));
document.getElementById("syn20").innerHTML=numberFormat(parseFloat(sum_260).toFixed(2));

}