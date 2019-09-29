library("plyr")
library(igraph)
root=c("D:/北邮文献/北邮");
files=list.files(root);
files1=paste(root,files,sep="/")
for (i in (1:length(files1)))
{
  files2=list.files(files1[i])
  files3=paste(files1[i],files2,sep="/")
  files4=paste(files3,"AU.csv",sep="/")
  files5=paste(files3,"时间.csv",sep="/")
  files6=paste(files3,"AF.csv",sep="/")
  files7=paste(files3,"beiyin.csv",sep="/")
  files8=paste(files3,"TC.csv",sep="/")
  files9=paste(files3,"PY.csv",sep="/")
  files10=paste(files3,"时间1",sep="/")
  files11=paste(files3,"时间3",sep="/")
  files16=paste(files3,"时间4",sep="/")
  for (j in (1:length(files3)))
  {
    files12=list.files(files10[j])
    files13=list.files(files11[j])
    files17=list.files(files16[j])
    files14=paste(files10[j],files12,sep="/")
    files15=paste(files11[j],files13,sep="/")
    files18=paste(files16[j],files17,sep="/")
    for (p in (1:length(files13)))
    {
    a=read.csv(files4[j])
    a1=read.csv(files14[p])
    b=read.csv(files15[p])
    b1=read.csv(files9[j])
    d=read.csv(files8[j])
    e=read.csv(files18[p])
    f=rbind.fill(e,d)
    f=as.matrix(f)
    b2=as.matrix(read.csv(files8[j]))
    b=rbind.fill(b,b1)
    b=as.matrix(b)
    ys=c("2011"="black","2012"="grey","2013"="red","2014"="yellow","2015"="orange","2016"="brown","2017"="blue","2018"="green","2019"="purple","2020"="violet","2021"="tan")
    a2=rbind.fill(a1,a)
    a3=as.matrix(a2)
    a3[a3=="Gp Ieee"]=""
    a3[is.na(a3)]=""
    c=a3
    dx=matrix(4,1,dim(c)[1])#表示源点跟引文点的大小区别
    dx[dim(c)[1]]=8#源点大小为8
    d=matrix(0,dim(c)[1],dim(c)[1])#初始化邻接矩阵
    for (l in 1:(dim(c)[1]))
    {
      d[l,dim(c)[1]]=2020
      d[dim(c)[1],l]=2020}
    d[dim(c)[1],dim(c)[1]]=0#表示引用关系
    for ( J in (1:(dim(c)[1])))
    {
      for(J1 in (1:dim(c)[2]))
      {
        for (K in (1:dim(c)[1]))
        {
          for (K1 in(1:dim(c)[2]))
          {
            if(J!=K&c[J,J1]!=''&c[J,K1]!=""&c[J,J1]==c[K,K1])
            {
              if(b[J]==b[K])
              {
               d[J,K]=b[K]
               d[K,J]=b[K]
              }
              if(b[J]<b[K])
              {
                d[J,K]=b[K]
                d[K,J]=b[K]
              }
              if(b[J]>b[K])
              {
                d[J,K]=b[J]
                d[K,J]=b[J]
              }
              T=1
              if(J==dim(c)[1]||K==dim(c)[1])
              {
                d[J,K]=2011
                d[K,J]=2011
              }
            }
            }
          }
        }
        
    }
    o=graph_from_adjacency_matrix(d,mode="undirected",weighted=TRUE)
    pdf(file=paste(files3[j],"时间演化图集2",paste(substring(files13[p],8,11),".pdf",sep=""),sep="/"),family="GB1")
    par(cex.main=0.6)
    plot(o,edge.color=ys[as.character(E(o)$weight)],edge.arrow.size=0,vertex.color=ys[as.character(b)],vertex.size=dx,layouy=layout.fruchterman.reingold,vertex.label=f,vertex.label.cex=0.6,vertex.label.dist=0.7,edge.width=0.3,weighted=TRUE,directed=FALSE,main=paste(files2[j],b2[1],sep="  "),sub=(as.matrix(a[1])[1]))
    legend(x=-1.3,y=1,c(unique(b),"引用","自引"),fill=ys[as.character(c(unique(b),2020,2021))],col=ys[as.character(c(unique(b),2020,2021))],pt.cex=2,cex=0.5)
    dev.off()
    }
  }
}
      

  