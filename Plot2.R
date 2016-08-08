## Set working directory to the local directory
setwd("D:\\DataScienceCoursera\\Exploratory Data Analysis")

## Read full data into a file
FullData <- read.table("household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors=FALSE, dec=".")

## get the subset of data required for analysis
ReqData <- FullData[FullData$Date %in% c("1/2/2007","2/2/2007") ,]

## Code to develop plot 2.png and save the file.

str(ReqData) ## check the structure of the data in order to understand the formatting.

## segregate the datetime variable and Global Active Power
datetime <- strptime(paste(ReqData$Date, ReqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(ReqData$Global_active_power)

## Set the png file to be plotted
png("plot2.png", width=480, height=480)

## Develop the plot as shown in the project description
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Disconnect
dev.off()