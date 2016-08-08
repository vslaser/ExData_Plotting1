## Set working directory to the local directory
setwd("D:\\DataScienceCoursera\\Exploratory Data Analysis")

## Read full data into a file
FullData <- read.table("household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors=FALSE, dec=".")

## get the subset of data required for analysis
ReqData <- FullData[FullData$Date %in% c("1/2/2007","2/2/2007") ,]

## Code to develop plot 4.png and save the file.

str(ReqData) ## check the structure of the data in order to understand the formatting.

## Reading data
datetime <- strptime(paste(ReqData$Date, ReqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(ReqData$Global_active_power)
globalReactivePower <- as.numeric(ReqData$Global_reactive_power)
voltage <- as.numeric(ReqData$Voltage)
subMetering1 <- as.numeric(ReqData$Sub_metering_1)
subMetering2 <- as.numeric(ReqData$Sub_metering_2)
subMetering3 <- as.numeric(ReqData$Sub_metering_3)

## set plotting to png file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

## Plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

## Disconnect
dev.off()