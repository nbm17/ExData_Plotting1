#open required libraries
library("dplyr")
#Read dataset
tempfile<-"data.zip"
if(!file.exists(tempfile)){
  fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,tempfile)
}
if(!file.exists("household_power_consumption.txt")){
  unzip(tempfile)
}
Date1<-as.Date(c("2007-02-01"))
Date2<-as.Date(c("2007/02/02"))
dt1<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
dt1<-mutate(dt1, Date= as.Date(dt1$Date,"%d/%m/%Y"))  
dt1<-dt1[dt1$Date>=Date1 & dt1$Date<=Date2,]
mutate(dt1, timestamp = paste(dt1$Date, dt1$Time))