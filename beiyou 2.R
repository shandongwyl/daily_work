library("plyr")
library(igraph)
root=c("D:/北邮文献/北邮");
files=list.files(root);
files1=paste(root,files,sep="/")
for (i in (1:length(files1)))
{
  r=0
  files2=list.files(files1[i])
  files3=paste(files1[i],files2,sep="/")
  files4=paste(files3,"AU.csv",sep="/")
  #files5=paste(files3,"DI.csv",sep="/")
  files6=paste(files3,"AF.csv",sep="/")
  files7=paste(files3,"beiyin.csv",sep="/")
  files8=paste(files3,"TC.csv",sep="/")
  r=matrix(NA,length(files3)+1,2)
  r[1,1]="最大联通子团数目"
  r[1,2]="被引次数"
  for( J in (1:length(files3))){
  a=read.csv(files6[J])
  a1=read.csv(files4[J])
  p=as.matrix(a1)
  a2=rbind.fill(a,a1)
  #a1=read.csv(files4[J],sep="\t")
  #a2=read.csv(files5[J],sep="\t")
  #a3=rbind(a1,a2)r'
  a4=read.csv(files7[J])
  a5=read.csv(files8[J])
  a6=rbind(a4,a5)
  L=as.matrix(a6)
  b=matrix(0,dim(a2)[1],dim(a2)[1])
  b1=as.matrix(a2)
  b1[is.na(b1)]=""
  matrix=matrix(NA,6,2)
  dx=matrix(4,1,dim(a2)[1])
  dx[dim(a2)[1]]=8
 # matrix[1,2]="计数"
  #matrix[1,1]="被引次数"
 # matrix[2,1]="transitivity"
 # matrix[3,1]="网络直径"
 # matrix[4,1]="平均度"
 # matrix[5,1]="子团数目"
  #matrix[6,1]="最大连通子团成员"
  for (l in 1:(dim(a2)[1]))
  {
    b[l,dim(a2)[1]]=1
    b[dim(a2)[1],l]=1}
  b[dim(a2)[1],dim(a2)[1]]=0
  for ( j in (1:(dim(a2)[1])))
  {
    for(j1 in (1:dim(a2)[2]))
    {
      for (k in (1:dim(a2)[1]))
      {
        for (k1 in(1:dim(a2)[2]))
        {
          if(j!=k&b1[j,j1]!=''&b1[k,k1]!=""&b1[j,j1]==b1[k,k1])
          {
            b[j,k]=2
            b[k,j]=2
            T=1
            if(j==dim(a2)[1]||k==dim(a2)[1])
          {
              b[j,k]=3
              b[k,j]=3
            }
            if(b1[j,j1]=="Gp Ieee"&b1[k,k1]=="Gp Ieee")
          {
              b[j,k]=0
              b[k,j]=0
          }
          }
          }
        }

      }

    }
  

  o=graph_from_adjacency_matrix(b,mode="undirected",weighted=TRUE)
  r[J+1,1]=max(components(o)$csize)
  r[J+1,2]=L[length(L)]
  #matrix[1,2]=L[length(L)]
  #matrix[2,2]=transitivity(o)
 # matrix[3,2]=diameter(o)
  #matrix[4,2]=mean(degree(o))
 # matrix[5,2]=components(o)$no
 # matrix[6,2]=max(components(o)$csize)
  #write.table(matrix,file=paste(files3[J],"tongjishuju.csv",sep="/"),row.names = FALSE,col.names = FALSE)
  pdf(file=paste(files3[J],"tu3.pdf",sep="/"))
  par(cex.main=0.5)
  plot(o,edge.color=E(o)$weight,edge.arrow.size=0,vertex.color=b2,main="Recent Advances in Underlay Heterogeneous Networks Interference Control, Resource Allocation, and Self-Organization",vertex.size=dx,layouy=layout.fruchterman.reingold,vertex.label=b2,vertex.label.cex=0.4,sub="2015 83(81)",vertex.label.dist=0.7,edge.width=0.3,weighted=TRUE,directed=FALSE)
  #legend("bottom",c("引用关系","合作关系","自引关系"),edge.color=c(1,2,25))
  dev.off()
  }
  #write.table(r,file=paste(files1[i],"tongjishuju1.csv",sep="/"),row.names = FALSE,col.names = FALSE)
}
  
      