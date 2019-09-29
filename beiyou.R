root=c("D:/±±” Œƒœ◊/±±” ");
files=list.files(root);
files1=paste(root,files,sep="/")
for (i in (1:length(files1)))
{
  files2=list.files(files1[i])
  files3=paste(files1[i],files2,sep="/")
  files4=paste(files3,"AU.csv",sep="/")
  files5=paste(files3,"AU1.csv",sep="/")
  files6=paste(files3,"TC.csv",sep="/")
  #files7=paste(files3,"DI.csv",sep="/")
  for( j in (1:length(files3)))
  {
  a=read.csv(files4[j])
  b=read.csv(files5[j])
  t=read.csv(files6[j])
 # k=read.csv(files7[j],header=FALSE)
 #k1=as.matrix(k)
  t=as.matrix(t)
  b1=as.matrix(b)
  a1=graph_from_data_frame(a,directed=FALSE)
  a2=as_adjacency_matrix(a1)
  a3=graph_from_adjacency_matrix(a2,weighted=TRUE)
  c=as_ids(V(a3))
  d=matrix(NA,ncol=length(c),nrow=1)
  d1=matrix(2,ncol=length(c),nrow=1)
  for(k in (1:length(c)))
  {
    for(h in (1:length(b1)))
      if(b1[h]==c[k])
      {
        
      
        d[k]=c[k]
        d1[k]=4
      }
      
  }
  z=components(a3)$no
  z1=max(components(a3)$csize)
  z2=transitivity(a3)
  pdf(file=paste(files3[j],"tu.pdf",sep="/"))
  par(cex.main=0.5)
plot(a3,edge.color=E(a3)$weight,edge.arrow.size=0,vertex.color=degree(a3),vertex.size=d1,layouy=layout_with_kk,vertex.label=d,vertex.label.cex=0.4,vertex.label.dist=0.7,edge.width=0.2,main=paste(files2[j],t[2]),sub=paste(z,z1,z2,sep=" "),weighted=TRUE,directed=FALSE)
dev.off() 
  }
}


