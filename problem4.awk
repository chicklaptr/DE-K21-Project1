BEGIN{
   FS="\\";
   OFS="\\"; 
 sum=0;  
}
function sol4(col){
    if(col!="0"){
    col=col + 0;
    sum=sum+col;
    }
}
NR > 1{
  sol4($3);
}
END {

   printf("Tong doanh thu: %.0f",sum);
}
