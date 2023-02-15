#setwd("~/Documents/MATH-DRP-23/Data/Stocks")
setwd("~/Downloads/GitHub/MATH-DRP-23/Data/Stocks")
#library(tidyverse)
install.packages("data.table")
library(readr)


file_list <- list.files(pattern="*.txt",full.names =TRUE, recursive=FALSE)
n = 1
df_1<-fread(file_list[n])
df_1$Return_Percent<- ((df_1$Close-df_1$Open)/df_1$Open)*100
str_match<-'\\w+'
name<-regmatches(file_list[n],regexec('\\w+',file_list[n]))
c_name <-c('date',name)
df_new_1 = data.frame(df_1$Date,df_1$Return_Percent)
colnames(df_new_1)<-c_name


n=100
df_100<-fread(file_list[n])
df_100$Return_Percent<- ((df_100$Close-df_100$Open)/df_100$Open)*100
str_match<-'\\w+'
name<-regmatches(file_list[n],regexec('\\w+',file_list[n]))
c_name <-c('date',name)
df_new_100 = data.frame(df_100$Date,df_100$Return_Percent)

colnames(df_new_100)<-c_name

df_merge_test_1<- merge(df_new_1,df_new_100,by="date")