#open required libraries

#Read dataset
tempfile<-"data.zip"
if(!file.exists(tempfile)){
  fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,tempfile)
}
if(!file.exists("household_power_consumption.txt")){
  unzip(tempfile)
}
  dt1<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
  a<-hist(as.numeric(dt1$Global_active_power)/1000
          , breaks = 12
          , col="red"
          , main = "Global Active Power"
          , xlab = "Global Active Power (kilowatts)"
          , ylab = "Frequency"
          , xlim = c(0,6) #range(as.numeric(dt1$Global_active_power)/1000)
          , xaxt = "n"
          )
  axis(1, at=seq(0,6,by=2), labels=seq(0,6,by=2))
  print(a)
  