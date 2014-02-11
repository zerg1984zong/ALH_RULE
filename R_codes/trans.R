trans <- function(n,d){ 
	mth=unique(d$mth)
	region=unique(d$region)
	
	res=NULL

	for (i in region){
		res_tmp=NULL
		res_tmp[['mth']]=mth
		res_n=NULL

		tmp=d[ which(d$region==i) , ]
		
		rule=unique(tmp$rule)

		for(j in rule){
			res_n[[j]] = tmp[ which(tmp$rule==j),which(names(tmp)==n) ]
			}
		res_tmp[[n]]=res_n
		res[[i]] = res_tmp
		cat(toJSON(res_tmp),file=paste("/Users/glory/Sites/data/",n,"_",i,".json",sep=""))
	}


return(res)
}
