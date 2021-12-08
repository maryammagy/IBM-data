diseases <- c("ACC", "BLCA", "BRCA",
              #"GBMLGG", 
              "HNSC", "KIPAN",
              #"KIRC",
              #"KIRP",
              #"LGG",
              "LIHC", "LUAD", "LUSC",
              #"MESO",
              "PAAD","THYM", "UCEC","UVM")
tcgaDir <- '/Users/maryammaghsoudi/R/maryam-random/VsigINT/'
Vsig<-c()
for (d in diseases){
   message('----------------------------')
   message(paste("loading data for",d))
   load(paste0(tcgaDir,"/",d,'vSIGint.rData'))
   Vsig=c(Vsig,VsigINT)
}
all_int=as.data.frame(sort(table(Vsig),decreasing = TRUE),stringsAsFactors=F)
geness=all_int$Vsig
remove(VsigINT)
m=c()
n=c()


for (k in diseases){
  load(paste0(tcgaDir,"/",k,'vSIGint.rData'))
  for (j in 1:length(geness)) {
    if(as.logical(sum(geness[j]==VsigINT))){
      n[j]=1
      }else{
        n[j]=0
      m+=1
        }
  }
  m=rbind(m,n)
}
row.names(m)=diseases  
colnames(m)=geness
m=as.data.frame(m)
write.xlsx(m,row.names=TRUE,file = '/Users/maryammaghsoudi/R/maryam-random/VsigINT/cancersVSgenes.xlsx')
