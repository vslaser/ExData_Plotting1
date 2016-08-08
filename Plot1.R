## Set working directory to the local directory
setwd("D:\\DataScienceCoursera\\Exploratory Data Analysis")

## Read full data into a file
FullData <- read.table("household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors=FALSE, dec=".")

## get the subset of data required for analysis
ReqData <- FullData[FullData$Date %in% c("1/2/2007","2/2/2007") ,]

## Code to develop plot 1.png and save the file.

## Segregate the Global Active Power into numeric data
GlobalActivePower <- as.numeric(ReqData$Global_active_power)

##Set png file to save with required width and height
png("plot1.png", width=480, height=480)

## plot the required histogram
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Important to disconnect
dev.off()
