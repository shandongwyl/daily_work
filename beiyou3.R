root=c("D:/北邮文献/北邮");
files=list.files(root);
files1=paste(root,files,sep="/")
a=read.csv("D:/北邮文献/北邮/北邮chemistry/One-step synthesis of easy-recycling TiO2-rGO nanocomposite photocatalysts with enhanced photocatalytic activity/ziyin.csv")
p=read.csv("D:/北邮文献/北邮/北邮chemistry/One-step synthesis of easy-recycling TiO2-rGO nanocomposite photocatalysts with enhanced photocatalytic activity/PY.csv")
a=a[-1,]
b=as.matrix(a)
pdf(file="D:/北邮文献/自引分布.pdf",family="GB1")
plot(b[,1],b[,2],main=c("86篇文章自引随时间分布"),xlim=c(2010,2019),pch=1,lwd=1,cex=0.5,lty=1,ylim=c(0,30),xlab=c("时间"),ylab=("被引次数"),col=p[1,1])
lines(b[,1],b[,2])
legend(2010,30,c(2011,2012,2013,2014,2015,2016,2017,2018,2019),fill=c(2011,2012,2013,2014,2015,2016,2017,2018,2019),col=c(2011,2012,2013,2014,2015,2016,2017,2018,2019))
legend(2012,30,c("化学","计算机","工程","材料","数学","物理","社会科学"),lty=c(1,2,3,4,5,6,7))
A=NA
A1=NA
Cov=0
for (i in (1:length(files1)))
{
  Cov1=0
  files2=list.files(files1[i])
  files3=paste(files1[i],files2,sep="/")
  files4=paste(files3,"t.csv",sep="/")
  files5=paste(files3,"ziyin.csv",sep="/")
  files6=paste(files3,"PY.csv",sep="/")
  for( J in (1:length(files3))){
    a=read.csv(files4[J])
    a1=read.csv(files5[J])
    a2=read.csv(files6[J])
    #cov=(a1[1,2]-a[1,2])/a1[1,2]
   b=as.matrix(a[-1,])
   b1=as.matrix(a1[-1,])
   if(length(b1)==0)
     break
   b2=as.matrix(a2)
    #pdf(file=paste(files3[J],"tongji.pdf",sep="/"),family="GB1")
   # plot(b[,1],b[,2],main=c("去除自引前后的对比"),xlab=c("时间"),ylab=("被引次数"),col="red")
    lines(spline(b1[,1],b1[,2],n=1000),col=b2[1],lwd=1,lty=i)
    points(b1[,1],b1[,2],col=b2[1],pch=2,cex=0.5)
    #lines(b1[,1],b1[,2],col="green",pch=4)
    #points(spline(b1[,1],b1[,2]),col="green",pch=4)
    #legend("bottom",c("去除自引后","去除自引前"),fill=c("blue","green"),col=c("blue","green"))
    #dev.off() 
    #Cov=c(Cov,cov)
   #Cov1=c(Cov1,cov)
   # A=bind_cols(A,a)
  
  }
  #pdf(file=paste(files1[i],"tongji1.pdf",sep="/"),family="GB1")
  #hist(Cov1,col="red",xlab="自引所占比例",ylab="频次分布",main=files[i])
  #dev.off()
  
}
#legend(2010,140,c(2011,2012,2013,2014,2015,2016,2017,2018,2019),fill=c(2011,2012,2013,2014,2015,2016,2017,2018,2019),col=c(2011,2012,2013,2014,2015,2016,2017,2018,2019))
dev.off()