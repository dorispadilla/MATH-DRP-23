mypath<- "~/Documents/MATH-DRP-23/Data/Stocks"
#mypath <- "~/Downloads/GitHub/MATH-DRP-23/Data/Stocks"
setwd(mypath)
#library(tidyverse)
#install.packages("data.table")
library(readr)
library(data.table)
library(stringr)

# create list of text files, length(file_list)= 7195
file_list <- list.files (path=mypath, pattern="*.txt",full.names =TRUE, recursive=FALSE)
# create an empty data frame 
df_final = data.table(matrix(nrow=0,ncol= 1))
setnames(df_final,names(df_final),'Date')
df_final$Date <- as.Date(df_final$Date)
count = 0
# loop
for (file in file_list)
{
  df <- fread(file)
  if(length(df)==0){
    match_string <- '[\\w]+?(?=\\.us.txt)'
    name <-regmatches(file, regexec(match_string, file,perl=TRUE))
    print(paste0("Excluding Item ", count,": ",name))
    count = count+1
    next()
  }
  df$Return_Percent <- ((df$Close-df$Open)/df$Open)*100
  #match_string <- '^\\/(.+\\/)([\\w]+)'
  match_string <- '[\\w\\-\\_]+?(?=\\.us.txt)'
  name <-regmatches(file, regexec(match_string, file,perl=TRUE))
  #print(name)
  #c_name <- c("Date", name)
  df_new <- data.table(df$Date, df$Return_Percent)
  cols<-names(df_new)
  setnames(df_new,cols,c('Date',paste(name)))
  #colnames(df_new) <- c_name
  df_final <- merge(df_new, df_final, by ="Date",all=TRUE)
  rm(df,df_new)
  if(count %% 100 ==0){
    print(count)
  }
  count = count+1
}






##########################################
# Read all the files in
## all_file_df <- lapply(all_file_list, function(x) {fread(x)})
# Change the lists into data frames
## all_file_asdf <- lapply (all_file_df, function(x) {as.data.frame(x)})
# combine all the txt files into 1 data frame
## combined_df <- do.call("rbind", lapply(all_file_df, as.data.frame))
# write into 1 txt
## write.table(combined_df, "~/Downloads/GitHub/MATH-DRP-23/Data/combData.txt")
