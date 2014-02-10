require(rjson)

source("./data_clean.R")


setwd("/Users/glory/Codes/R_scripts/")

x=read.table(file="./data/alh_rule_perf.csv",header=TRUE,sep=";",na.string="N/A",stringsAsFactors=FALSE)


x$gloss_rate=round(x$gloss/x$txn_amt*100,2)

x=x[which(x$rule_type=="Newbie"),]

df=x[,c(6,8,1,9,13,14,16)]

name=c("region","rule","mth","cust_num","amt","gloss","gloss_rate")
names(df)=name

rule=unique(df$rule)
mth=unique(df$mth)

for(i in rule){
	tmp=df[which(df$rule==i),c(1:3)]
	tmp_mth=unique(tmp$mth)
	for( j in mth  ){
		if(length(tmp_mth[tmp_mth==j])==0){
		 	tmp_insert=c(unique(tmp[c(1,2)]),j,rep(NaN,4))
		 	names(tmp_insert)=name
		 	df=rbind(df,tmp_insert)	
		}
	}
}

df=df[order(df$region,df$rule,df$mth),]

data_clean("gloss_rate",df)
data_clean("cust_num",df)
data_clean("amt",df)
