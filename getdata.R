library(dplyr)

ensureAndGetData <- function(){
  groomed <- NULL

    ## create a dir for our data 
    if(!file.exists("data")){
      dir.create("data")
    }
  
  ## Pull down data and unzip to our data dir
  if(!file.exists("data/household_power_consumption.txt")){
    if(!file.exists("data/raw-power-data.zip")){
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                    "data/raw-power-data.zip", method='curl')
     
    }
  
    unzip("data/raw-power-data.zip", exdir = "./data/")
  }
  ##Read in the data
  df <- read.table("./data/household_power_consumption.txt", header=TRUE, 
                 colClasses=c("character","character","double","double","double","double","double","double","numeric"),
                 sep=";",na.string="?")
  
  df$DateTime <- paste(df$Date, df$Time)
  df$DateTime <- as.POSIXlt(df$DateTime, format="%d/%m/%Y %H:%M:%S")
  df$Date <- NULL
  df$Time <- NULL

  groomed <- subset(df, DateTime$year == 107 & DateTime$mon == 1 & (DateTime$mday == 1 | DateTime$mday == 2))
  rm(df)
  groomed
}

clean <- function(){
  unlink("./data", recursive = TRUE)
}