BEGIN{
   FS="\\";
  OFS="\\";   
}

function sol7(col){
	gsub(/^ +| +$/, "", col);
	n=split(col,g,"\\|");
	for(i =1;i<=n;i++){
        luong_phim_cua_the_loai[g[i]]+=1;
      }
   }
{
  sol7($1);		
}
END{
  for(i in luong_phim_cua_the_loai){
     printf("Voi the loai %s ta co so luong: %d\n",
       i,luong_phim_cua_the_loai[i]);
   }
  	
}
