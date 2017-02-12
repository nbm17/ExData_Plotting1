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

#Change class for required fields
dt1$Global_active_power<- as.numeric(as.character(dt1$Global_active_power))
dt1$Voltage<-as.numeric(as.character(dt1$Voltage)) 
dt1$Sub_metering_1<-as.numeric(as.character(dt1$Sub_metering_1)) 
dt1$Sub_metering_2<-as.numeric(as.character(dt1$Sub_metering_2)) 
dt1$Sub_metering_3<-as.numeric(as.character(dt1$Sub_metering_3)) 
dt1$Global_reactive_power<-as.numeric(as.character(dt1$Global_reactive_power)) 

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#plot 1
plot(dt1$timestamp,dt1$Global_active_power,type = "l", xlab="", ylab="Global Activer Power (kilowatts)")
#plot 2
plot(dt1$timestamp, dt1$Voltage, type="l", xlab="datetime", ylab="Voltage")
#plot 3
plot(dt1$timestamp,dt1$Sub_metering_1,type = "l", xlab="", ylab="Energy sub metering")
lines(dt1$timestamp,dt1$Sub_metering_2, type = "l", col = "red")
lines(dt1$timestamp,dt1$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
#plot 4
plot(dt1$timestamp, dt1$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()