#setwd("~/Documents/MATH-DRP-23/Data/Stocks")
mypath <- "~/Downloads/GitHub/MATH-DRP-23/Data/Stocks"
setwd(mypath)
#library(tidyverse)
#install.packages("data.table")
library(readr)
library(data.table)

# create list of text files, length(file_list)= 7195
file_list <- list.files (path=mypath, pattern="*.txt",full.names =TRUE, recursive=FALSE)
# create an empty data frame 
df_final = data.frame(matrix(nrow=0,ncol= 1))
colnames(df_final) = "Date"

# loop
for (file in file_list)
{
  df <- fread(file)
    df$Return_Percent <- ((df$Close-df$Open)/df$Open)*100
  str_match <- '\\w+'
  name <-regmatches(file, regexec('\\w+', file))
  c_name <- c("Date", name)
  df_new <- data.frame(df$Date, df$Return_Percent)
  colnames(df_new) <- c_name
  df_final <- merge(df_new, df_final, by ="Date")
  rm(df,df_new)
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
