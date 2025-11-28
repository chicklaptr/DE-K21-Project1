BEGIN{
  FS="\\";
  OFS="\\";	
}
function sol5(col1,col2){
	col2=col2 + 0;
	col1= col1 + 0;
	col_moi=col2-col1;
	return col_moi;
}
NR == 1 {
  print($0," profit");  
}
NR > 1 {
      col6=sol5($3,$4);
      print($0," "col6);
}
