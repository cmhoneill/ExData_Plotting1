dataFile <- "./household_power_consumption.txt" 
fulldataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
fulldataset$Date <- as.Date(fulldataset$Date, format="%d/%m/%Y") 

## Subsetting the data 
data <- subset(fulldataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
 rm(fulldataset)
 
 # change the date format 
 data$Date <- as.Date(data$Date, format = "%d/%m/%Y") 

 
 data$DateTime <- as.POSIXct(paste(data$Date, data$Time)) 
 
 # creating Plot3 
 

 plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="") 
 

 lines(data$DateTime, data$Sub_metering_2, type="l", col="red") 
 

 lines(data$DateTime, data$Sub_metering_3, type="l", col="blue") 


legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue")) 
 

dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 
