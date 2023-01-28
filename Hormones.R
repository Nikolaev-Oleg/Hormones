#Import data M####
library(readxl)
Hormones_M <- read_excel("Hormones_22.8_9_10.xlsx",
sheet = "22_M_8_9_10")
View(Hormones_M)
#Mutate data frame M####
Sp<-c()
fulldate<-c()
time<-c()
for(i in 1:nrow(Hormones_M)){
  spl<-strsplit(Hormones_M$info[i], split=' ')
  Sp[i]<-paste0(spl[[1]][1],spl[[1]][2])
  fulldate[i]<-spl[[1]][4]
  time[i]<-spl[[1]][5]}
fulldate.split<-strsplit(fulldate, split = '/')
month<-c()
day<-c()
for(i in 1:length(fulldate.split)){
 month[i]<-paste0(fulldate.split[[i]][3],fulldate.split[[i]][2])
 day[i]<-fulldate.split[[i]][1]}
id<-Hormones_M$ID
sex<-rep('m', length(id))
Hormones<-data.frame(id, sex, Sp, month, day, time)
for(i in 1:length(Hormones_M$testo_ng_by_ml)){
  if(Hormones_M$testo_ng_by_ml[i]=='свыше 28,8'){Hormones$horm[i]<-'over28.8'}
  else{Hormones$test[i]<-Hormones_M$testo_ng_by_ml[i]}}
write.csv(Hormones, 'Hormones_M_test_22.8_9_10')
#Import data F####
Hormones_F <- read_excel("Hormones_22.8_9_10.xlsx",
                         sheet = "23_F_8_9_10") # must rename list and change code
View(Hormones_F)
#Mutate data frame F####
Sp<-c()
fulldate<-c()
time<-c()
for(i in 1:nrow(Hormones_F)){
  spl<-strsplit(Hormones_F$info[i], split=' ')
  Sp[i]<-paste0(spl[[1]][1],spl[[1]][2])
  fulldate[i]<-spl[[1]][4]
  time[i]<-spl[[1]][5]}
fulldate.split<-strsplit(fulldate, split = '/')
month<-c()
day<-c()
for(i in 1:length(fulldate.split)){
  month[i]<-paste0(fulldate.split[[i]][3],fulldate.split[[i]][2])
  day[i]<-fulldate.split[[i]][1]}
id<-Hormones_F$ID
sex<-rep('f', length(id))
Hormones<-data.frame(id, sex, Sp, month, day, time)
for(i in 1:length(Hormones_F$prog_ng_by_ml)){
  if(Hormones_F$prog_ng_by_ml[i]=='свыше 31,4'){Hormones$horm[i]<-'over31.4'}
  else{Hormones$prog[i]<-Hormones_M$testo_ng_by_ml[i]}}
write.csv(Hormones, 'Hormones_F_prog_22.8_9_10')