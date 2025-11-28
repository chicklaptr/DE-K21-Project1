function split_fields_in_line (line,arr,
			       i,c,in_state,out_state,
			       append_state,state,n,buffer){

in_state =1;
out_state=2;
append_state=3;
state=out_state;
buffer= "";
n=0;
for (i=1;i<=length(line);i++){
  c=substr(line,i,1);
  # ban dau la trang thai out
  if(state==out_state){
   if(c=="\"") { # chuyen trang thai
   state=in_state;
   buffer=buffer c;
   }
   else if(c==","){
    n++;arr[n]=buffer;
   buffer ="";
     }
    else buffer =buffer c;
   } else if (state ==in_state){
   # xet ve trang thai ben trong
   if(c=="\""){
    state=append_state;
    buffer= buffer c;
    }
    else 
	buffer=buffer c ;    
 } else if (state == append_state){
 # th ben ngoai khi ket thuc " 
       if(c=="\"") {
   # kha nang van la ben trong	       
        buffer=buffer c;
	state=in_state;
      }else if (c==","){
      #ket thuc mot field
       n++;arr[n]=buffer;
       buffer="";
       state=out_state;
      }else {
      # sai dinh dang 
      n++;arr[n]=buffer;
      buffer =c;
      state=out_state;
      }

}	
}
# 
n++;arr[n]=buffer;
return n;
}
{
   n=split_fields_in_line($0,field);
   for(i=1;i<=n;i++) printf ("%s \\ ", field[i]) ;
   print("");
 
}

