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
  files5=paste(files3,"时间",sep="/")
  files6=paste(files3,"时间综合",sep="/")
  files11=paste(files3,"PY.csv",sep="/")
  files12=paste(files3,"TC.csv",sep="/")
  for (j in (1:length(files3)))
  {
    files7=list.files(files5[j])
    files8=list.files(files6[j])
    files9=paste(files5[j],files7,sep="/")
    files10=paste(files6[j],files8,sep="/")
    a2=read.csv(files11[j])
    a3=read.csv(files12[j])
    for (k in (1:length(files7)))
    {
      a=read.csv(files4[j])
      a1=read.csv(files10[k])
      b=read.csv(files9[k])
      c=rbind.fill(b,a)
      c=as.matrix(c)
      c[c=="Gp Ieee"]=""
      c[is.na(c)]=""
      dx=matrix(4,1,dim(c)[1])#表示源点跟引文点的大小区别
      dx[dim(c)[1]]=8#源点大小为8
      d=matrix(0,dim(c)[1],dim(c)[1])#初始化邻接矩阵
      for (l in 1:(dim(c)[1]))
      {
        d[l,dim(c)[1]]=1
        d[dim(c)[1],l]=1}
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
                d[J,K]=2
                d[K,J]=2
                T=1
                if(J==dim(c)[1]||K==dim(c)[1])
                {
                  d[J,K]=3
                  d[K,J]=3
                }
              }
            }
          }
          
        }
        
      }
      o=graph_from_adjacency_matrix(d,mode="undirected",weighted=TRUE)
      pdf(file=paste(files3[j],"时间演化图集",paste(substring(files7[k],8,11),".pdf",sep=""),sep="/"))
      par(cex.main=0.6)
      plot(o,edge.color=E(o)$weight,edge.arrow.size=0,vertex.color=c(a1[,8],a3[1,1]),main=paste(files2[j],substring(files7[k],8,11),sep="\n"),sub=c(a2[1,1]),vertex.size=dx,layouy=layout.fruchterman.reingold,vertex.label=c(a1[,8],a3[1,1]),vertex.label.cex=0.6,vertex.label.dist=0.7,edge.width=0.3,weighted=TRUE,directed=FALSE)
      dev.off()
      }
    
  }
}
  