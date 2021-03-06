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

# Set data parameters as variables, convert relevant factors to dates and times, and filter
Date1<-as.Date(c("2007-02-01"))
Date2<-as.Date(c("2007-02-02"))
dt1$Date<- as.Date(dt1$Date,"%d/%m/%Y")
dt1<-dt1[dt1$Date>=Date1 & dt1$Date<=Date2,]
dt1$timestamp <- strptime(paste(dt1$Date, dt1$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

dt1$Global_active_power<- as.numeric(as.character(dt1$Global_active_power)) 
png("plot2.png", width=480, height=480)
plot(dt1$timestamp,dt1$Global_active_power,type = "l", xlab="", ylab="Global Activer Power (kilowatts)")
dev.off()
