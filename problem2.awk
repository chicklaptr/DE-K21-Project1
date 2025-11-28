BEGIN{
	FS="\\";
	OFS="\\";	
}
function sol2(col){
   if(col>7.5) return 1;
   else return 0;
}
{
	
   if(sol2($3)) print($0);   
}
