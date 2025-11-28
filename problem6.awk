BEGIN{
 FS="\\";
 OFS="\\"; 
}
function sol6(col1,col2){
    #mang ket hop
    luong_phim_dao_dien[col1]+=1;
    gsub(/^ +| +$/, "", col2);
    n=split(col2,a,"\\|");
    for(i=1;i<=n;i++){
     luong_phim_dien_vien[a[i]]+=1;
    }
}
{
   sol6($2,$1);
}
END{ 
  max_dao_dien=0;
  max_dien_vien=0;
   for (i in luong_phim_dao_dien){
	   if(max_dao_dien<luong_phim_dao_dien[i]){
               max_dao_dien=luong_phim_dao_dien[i];
	       key_dao_dien=i;
	     }
     }
   for (i in luong_phim_dien_vien){
           if(max_dien_vien<luong_phim_dien_vien[i]){
               max_dien_vien=luong_phim_dien_vien[i];
               key_dien_vien=i;
             }
     }
     printf("Dao dien dong nhieu nhat:%s\n",key_dao_dien);
     printf("Dien vien dong nhieu nhat: %s\n", key_dien_vien);
}
