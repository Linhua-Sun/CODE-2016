#compute the tree-tree distance between three kinds of consensus tree (MB/ML/PB) 
#for the simplility of comp,change the trees' name by namechanger batchly. Maybe make a new dir!
#make the filelist.txt file anyway you can! And copy it to here.
setwd("/Users/sunlinhua/Desktop/distance/new_compute/")
library("ape")
library("phangorn")
ID<-scan(file="filelist.txt")
for (i in ID) {
  tr1_filename<-paste(i,".nex.t",sep = "")
  tr2_filename<-paste(i,"_sample.treelist",sep = "")
  tr3_filename<-paste("RAxML_bootstrap.",i,sep = "")
  tr1<-read.tree(tr1_filename)
  tr1$edge.length<-NULL
  #tr1$node.label<-character(0)
  #tr1$tip.label<-gsub("_","",tr1$tip.label)
  tr2<-read.tree(tr2_filename)
  tr2$edge.length<-NULL
  tr2$node.label<-character(0)
  #tr2$tip.label<-gsub("_","",tr2$tip.label)
  tr3<-read.tree(tr3_filename)
  tr3$edge.length<-NULL
  tr3$node.label<-character(0)
  #tr3$tip.label<-gsub("_","",tr3$tip.label)
  MB_PB_dist_tr1_tr2<-RF.dist(tr1,tr2,check.labels = T,rooted = F)
  PB_ML_dist_tr2_tr3<-RF.dist(tr2,tr3,check.labels = T,rooted = F)
  MB_ML_dist_tr1_tr3<-RF.dist(tr1,tr3,check.labels = T,rooted = F)
  dist<-c(MB_PB_dist_tr1_tr2,PB_ML_dist_tr2_tr3,MB_ML_dist_tr1_tr3)
  #colname<-c("MB_PB_dist","PB_ML_dist","MB_ML_dist")
  #rowname<-ID
  write(dist,file="corr_trees_distance.txt",append = T)
  print(ID)
}
## shell:paste filelist.txt trees_distance.txt > newfiles.txt




