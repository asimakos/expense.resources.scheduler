

function show_doc(y){

if (y){
document.getElementById("kperiod").style.visibility="visible";
document.getElementById("kupload").style.visibility="visible";
document.getElementById("jon").style.visibility="visible";
perif_load();
perif_datasp();
perif_dataoc();

//gridvision();
}
}

perif_request=function(grid,row,col,evt){

rowsel=row;
colsel=col;
}

perif_ndata=function(editEvent){

var y=document.getElementById("hid_date").value;

if (!y){
alert("Παρακαλώ επιλέξτε αρχικά ημερομηνία περιόδου! Το ποσό του αιτήματός σας ή τα σχόλιά σας δεν θα αποθηκευτούν.");
editEvent.cancel=true;
}

if (y){
var grid=ColdFusion.Grid.getGridObject('kae_grid');
var sel=grid.getSelectionModel();
var rec=sel.getSelected();

if (colsel==3){
var x=parseFloat(rec.get('KAE_SPENT'))+parseFloat(editEvent.value);
rec.set('KAE_SPENT',parseFloat(x));
alert("Το ποσό που μόλις εισάγατε προστέθηκε με το προηγούμενο!");
editEvent.cancel=true;
}

if ((colsel==4)&&(parseFloat(editEvent.value)>0)){
var y=parseFloat(rec.get('KAE_OCCASIONS'))+parseFloat(editEvent.value);
rec.set('KAE_OCCASIONS',parseFloat(y));
alert("Το ποσό που μόλις εισάγατε προστέθηκε με το προηγούμενο!");
editEvent.cancel=true;
}

if ((colsel==4)&&(parseFloat(editEvent.value)<0)){
var z1=parseFloat(rec.get('KAE_OCCASIONS'))+parseFloat(editEvent.value);
rec.set('KAE_OCCASIONS',parseFloat(z1));
editEvent.cancel=true;

var z2=parseFloat(rec.get('KAE_SPENT'))-parseFloat(editEvent.value);
rec.set('KAE_SPENT',parseFloat(z2));
editEvent.cancel=true;
}

}
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

function perif_init(){

var grid=ColdFusion.Grid.getGridObject('kae_grid');
grid.on('validateedit',perif_ndata);
grid.on('celldblclick',perif_request);

}

function display_spent(){

var grid=ColdFusion.Grid.getGridObject('kae_grid');
var n=grid.dataSource.data.items.length;

for(var i=0;i<n;i++){
document.form_grid.dupl_spent[i].value=grid.dataSource.data.items[i].get('KAE_SPENT');
}
}

function display_received(){

var grid=ColdFusion.Grid.getGridObject('kae_grid');
var n=grid.dataSource.data.items.length;

for(var i=0;i<n;i++){
document.form_grid.dupl_received[i].value=grid.dataSource.data.items[i].get('KAE_RECEIVED');
}
}

function display_occasions(){

var grid=ColdFusion.Grid.getGridObject('kae_grid');
var n=grid.dataSource.data.items.length;

for(var i=0;i<n;i++){
document.form_grid.dupl_occasions[i].value=grid.dataSource.data.items[i].get('KAE_OCCASIONS');
}
}

function display_requests(){

var grid=ColdFusion.Grid.getGridObject('kae_grid');
var n=grid.dataSource.data.items.length;

for(var i=0;i<n;i++){
document.form_grid.dupl_requests[i].value=grid.dataSource.data.items[i].get('KAE_REQUEST');
}
}

function getkae_requests(){

var my_parent=window.opener;
var n=my_parent.document.form_grid.dupl_spent.length;
var y6="";
var sum_total=0;

for(var i=0;i<n;i++){
var yk=my_parent.document.form_grid.dupl_requests[i].value;
if (yk)
y6+=numberFormat(parseFloat(yk).toFixed(2))+"<br>";
else
y6+=" "+"<br>";
if (my_parent.document.form_grid.dupl_requests[i].value)
sum_total+=parseFloat(my_parent.document.form_grid.dupl_requests[i].value);
}
return y6+"<br>"+"ΣΥΝΟΛΟ: "+numberFormat(sum_total.toFixed(2));
}


function getkae_received(){

var my_parent=window.opener;
var n=my_parent.document.form_grid.dupl_spent.length;
var y3="";
var sum_total=0;

for(var i=0;i<n;i++){
var yk=my_parent.document.form_grid.dupl_received[i].value;
if (yk)
y3+=numberFormat(parseFloat(yk).toFixed(2))+"<br>";
else
y3+=" "+"<br>";
if (my_parent.document.form_grid.dupl_received[i].value)
sum_total+=parseFloat(my_parent.document.form_grid.dupl_received[i].value);
}
return y3+"<br>"+"ΣΥΝΟΛΟ: "+numberFormat(sum_total.toFixed(2));
}

function getkae_spent(){

var my_parent=window.opener;
var n=my_parent.document.form_grid.dupl_spent.length;
var y4="";
var sum_total=0;

for(var i=0;i<n;i++){
var yk=my_parent.document.form_grid.dupl_spent[i].value;
if (yk)
y4+=numberFormat(parseFloat(yk).toFixed(2))+"<br>";
else
y4+=" "+"<br>";
if (my_parent.document.form_grid.dupl_spent[i].value){
sum_total+=parseFloat(my_parent.document.form_grid.dupl_spent[i].value);
}
}
return y4+"<br>"+"ΣΥΝΟΛΟ: "+numberFormat(sum_total.toFixed(2));
}

function getkae_occasions(){

var my_parent=window.opener;
var n=my_parent.document.form_grid.dupl_spent.length;
var y5="";
var sum_total=0;

for(var i=0;i<n;i++){
var yk=my_parent.document.form_grid.dupl_occasions[i].value;
if (yk)
y5+=numberFormat(parseFloat(yk).toFixed(2))+"<br>";
else
y5+=" "+"<br>";
if (my_parent.document.form_grid.dupl_occasions[i].value)
sum_total+=parseFloat(my_parent.document.form_grid.dupl_occasions[i].value);
}
return y5+"<br>"+"ΣΥΝΟΛΟ: "+numberFormat(sum_total.toFixed(2));
}

function getkae_id(){

var y1="0711"+"<br>";
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

return y1+"<br>"+"<br>";

}

function getkae_description(){

var y2="Εξοδα μετακίνησης στο εσωτερικό μονίμου προσωπικού (Τακτικοί - ΙΔΑΧ)"+"<br>";
y2+="Εξοδα μετάθεσης ή απόσπασης στο εσωτερικό"+"<br>";
y2+="Εξοδα μετακίνησης από το εσωτερικό στο εξωτερικό και αντίστροφα μονίμου προσωπικού (Τακτικοί - ΙΔΑΧ)"+"<br>";
y2+="Μισθώματα κτιρίων"+"<br>";
y2+="Λοιπές μισθώσεις"+"<br>";
y2+="Ταχυδρομικά"+"<br>";
y2+="Υποχρεώσεις από παροχή τηλεπικοινωνιακών υπηρεσιών (τέλη, μισθώματα & δαπάνες εγκαταστάσεων)"+"<br>";
y2+="Λοιπές μεταφορές"+"<br>";
y2+="Υδρευση και άρδευση"+"<br>";
y2+="Δαπάνες καθαριότητας"+"<br>";
y2+="Εκδόσεις - εκτυπώσεις - βιβλιοδεσία (περιλαμβάνεται και η προμήθεια χάρτου)"+"<br>";
y2+="Κάθε είδους δαπάνη δημοσίων σχέσεων"+"<br>";
y2+="Αμοιβές για συντήρηση και επισκευή κτιρίων"+"<br>";
y2+="Αμοιβές για συντήρηση και επισκευή μεταφορικών μέσων ξηράς γενικά"+"<br>";
y2+="Αμοιβές για συντήρηση και επισκευή λοιπού εξοπλισμού"+"<br>";
y2+="Αμοιβές φυσικών προσώπων"+"<br>";
y2+="Αμοιβές νομικών προσώπων"+"<br>";
y2+="Αμοιβές για δαπάνες καθαριότητας (συμπ/νται φυσικά και νομικάπροσωπα)"+"<br>";
y2+="Λοιπές αμοιβές όσων εκτελούν ειδικές υπηρεσίες"+"<br>";
y2+="Λοιπές ειδικές αμοιβές"+"<br>";
y2+="Προμήθεια χαρτιού, γραφικών ειδών και λοιπών συναφών υλικών"+"<br>";
y2+="Προμήθεια βιβλίων, συγγραμμάτων, περιοδικών, εφημερίδων και λοιπών συναφών εκδόσεων"+"<br>";
y2+="Προμήθεια υγειονομικού και φαρμακευτικού υλικού"+"<br>";
y2+="Προμήθεια ειδών καθαριότητας"+"<br>";
y2+="Προμήθεια ειδών συντήρησης και επισκευής εγκαταστάσεων"+"<br>";
y2+="Προμήθεια ειδών συντήρησης και επισκευής μεταφορικών μέσων ξηράς γενικά"+"<br>";
y2+="Προμήθεια ειδών συντήρησης και επισκευής κάθε είδους λοιπού εξοπλισμού"+"<br>";
y2+="Προμήθεια καυσίμων και λιπαντικών"+"<br>";
y2+="Προμήθεια καυσίμων θέρμανσης και δαπάνες κοινοχρήστων"+"<br>";
y2+="Κατ΄αποκοπή χορήγημα διατροφής, περίθαλψης και λοιπών εξόδων σκύλων ανιχνευτών ναρκωτικών ουσιών"+"<br>";
y2+="Λοιπές προμήθειες (Σκύλοι ανιχνευτές)"+"<br>";
y2+="Λοιπές προμήθειες"+"<br>";
y2+="Προμήθεια επίπλων"+"<br>";
y2+="Προμήθεια συσκευών θέρμανσης και κλιματισμού"+"<br>";
y2+="Προμήθεια γραφομηχανών, μηχανημάτων φωτοαντιγραφής κλπ μηχανών γραφείου"+"<br>";
y2+="Προμήθεια ηλεκτρονικών υπολογιστών, προγραμμάτων και λοιπών υλικών"+"<br>";
y2+="Προμήθεια κάθε είδους τηλεπικοινωνιακού, μετεωρολογικού και λοιπού συναφούς ηλεκτρονικού εξοπλισμού"+"<br>";
y2+="Προμήθεια κάθε είδους μηχανικού & λοιπού εξοπλισμού"+"<br>";

return y2+"<br>"+"<br>";
}

function dupl_gridata(){

//var sel_model=grid.getSelectionModel();
//var rec=sel_model.selectRow(4).data;
//alert(row.get('KAE_ID'));
//var y1=grid.dataSource.data.items[1].get('KAE_SPENT');

var docx=window.frames[0].document.form_upload.kfile.value;

if (!docx){
alert("Παρακαλώ εισάγετε το διαβιβαστικό του αιτήματός σας!");
return;
}

display_received();
display_spent();
display_occasions();
display_requests();

var little=window.open("freport.cfm","_blank","menubar,toolbar,scrollbars,width=900,height=900,resizable");
little.moveTo(80,10);
little.focus();

document.form_grid.kon3.style.visibility="visible";

return false;
}

function display_it(){

dupl_gridata();
}

function display_date(){

var current=new Date();

var day=current.getDate();
var month=current.getMonth()+1;
var year=current.getFullYear();
var y1="Ημερομηνία: "+ day+"/"+month+"/"+year + "<br>" + "Ο Προϊστάμενος της Διεύθυνσης";
return y1;
}

function close_report(){

var my_parent=window.opener;

window.close();
my_parent.document.form_grid.kon3.style.visibility="hidden";

}

function new_closreport(){

var my_parent=window.opener;
my_parent.document.form_grid.kon3.style.visibility="hidden";

}

function toggle_klist(){

var x=document.getElementById("klist").style.visibility;

if (x=="hidden")
document.getElementById("klist").style.visibility="visible";
else
document.getElementById("klist").style.visibility="hidden";

}

function perif_load(){

var evt=document.createEvent("MouseEvents");
evt.initMouseEvent("click",true,true,window,0,0,0,0,0,false,false,false,false,0,null);
var kon=document.getElementById("kon_new");
kon.dispatchEvent(evt);
}

function perif_datasp(){

var evt=document.createEvent("MouseEvents");
evt.initMouseEvent("click",true,true,window,0,0,0,0,0,false,false,false,false,0,null);
var kon=document.getElementById("kon_sp");
kon.dispatchEvent(evt);
}

function perif_dataoc(){

var evt=document.createEvent("MouseEvents");
evt.initMouseEvent("click",true,true,window,0,0,0,0,0,false,false,false,false,0,null);
var kon=document.getElementById("kon_oc");
kon.dispatchEvent(evt);
}

function amount_received(y){

jsreceived=new remotereceived();

var grid=ColdFusion.Grid.getGridObject('kae_grid');
var n=grid.dataSource.data.items.length;

for(var i=0;i<n;i++){

var z=grid.dataSource.data.items[i].get('KCODE');
var x=jsreceived.perif_received(y,z);
if (x)
grid.dataSource.data.items[i].set('KAE_RECEIVED',parseFloat(x));
else 
grid.dataSource.data.items[i].set('KAE_RECEIVED',parseFloat(0));
}
}

function amount_spent(y){

jsspent=new remotespent();

var grid=ColdFusion.Grid.getGridObject('kae_grid');
var n=grid.dataSource.data.items.length;

for(var i=0;i<n;i++){

var z=grid.dataSource.data.items[i].get('KCODE');
var x=jsspent.perif_spent(y,z);
if (x)
grid.dataSource.data.items[i].set('KAE_SPENT',parseFloat(x));
else 
grid.dataSource.data.items[i].set('KAE_SPENT',parseFloat(0));
}
}

function amount_occasions(y){

jsoccasions=new remoteoccasions();

var grid=ColdFusion.Grid.getGridObject('kae_grid');
var n=grid.dataSource.data.items.length;

for(var i=0;i<n;i++){

var z=grid.dataSource.data.items[i].get('KCODE');
var x=jsoccasions.perif_occasions(y,z);
if (x)
grid.dataSource.data.items[i].set('KAE_OCCASIONS',parseFloat(x));
else 
grid.dataSource.data.items[i].set('KAE_OCCASIONS',parseFloat(0));
}
}

function show_spent(y){

if ((y)||(!y)){
document.getElementById("kon").value="hello";
document.getElementById("kon_save").style.visibility="visible";
perif_datasp();
}
}