getmode <- function(v) {
       uniqv <- unique(v)
       uniqv[which.max(tabulate(match(v, uniqv)))]
}#求众数
  root=c("D:/北邮文献/北邮");
files=list.files(root);
files1=paste(root,files,sep="/")
for (i in (1:length(files1)))
{
  files2=list.files(files1[i])
  files3=paste(files1[i],files2,sep="/")
  files4=paste(files3,"beiyin.csv",sep="/")
  files5=paste(files3,"TC.csv",sep="/")
  for(j in 1:length(files3))
  {
   a=read.csv(files4)
   a1=read.csv(files5)
   b=as.matrix(a)
   b1=as.matrix(a1)
   A=0
   B=0
   C=0
   D=0

   