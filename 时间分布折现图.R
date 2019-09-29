library(igraph)
root=c("D:/北邮文献/北邮");
files=list.files(root);
files1=paste(root,files,sep="/")
for (i in (1:length(files1) ))
     {
       o=0
       pdf(file=paste("C:/Users/linzizhan/Documents/时间分布折线图",paste(files[i],"总分布.pdf",sep=""),sep="/"),family="GB1")
       files2=list.files(files1[i])
       files3=paste(files1[i],files2,sep="/")
       files4=paste(files3,"dt.csv",sep="/")
       files5=paste(files3,"PY.csv",sep="/")
       a=read.csv(files4[1])
       p=read.csv(files5[1])
       a=a[-1,]
       b=as.matrix(a)
       plot(b[,1],b[,2],main=paste(files[i],"随时间分布",sep=""),xlim=c(2010,2019),pch=1,lwd=1,cex=0.5,lty=1,ylim=c(0,350),xlab=c("时间"),ylab=("被引次数"),col=p[1,1])
       lines(b[,1],b[,2],col=p[1,1])
       o=c(o,p[1,1])
       if(length(files4)>1){
       for ( j in (2:length(files4)))
       {
         a1=read.csv(files4[j])
         p1=read.csv(files5[j])
         a1=a1[-1,]
         b1=as.matrix(a1)
         lines(b1[,1],b1[,2],col=p1[1,1])
         points(b1[,1],b1[,2],col=p1[1,1])
         o=c(o,p1[1,1])
         
       }}
       legend(2010,350,c(unique(o)[2:length(unique(o))]),fill=c(unique(o)[2:length(unique(o))]),col=c(unique(o)[2:length(unique(o))]))
       dev.off()
           }
