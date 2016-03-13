## Getting full dataset 
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",  
                                           nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y") 


## Subsetting the data 
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
 rm(data_full) 
 

 ## Converting dates 
 datetime <- paste(as.Date(data$Date), data$Time) 
 data$Datetime <- as.POSIXct(datetime) 
 
 ## setup margins
 par(mar=c(4,4,2,2))
 ## four plots
 par(mfrow=c(2,2)) 
 ## plot 1
 plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
 
 ##plot 2
 plot(data$Voltage ~ data$Datetime, type="l", ylab="voltage", xlab="datetime") 
 
 
 ## Plot 3 
 with(data, { 
       plot(Sub_metering_1~Datetime, type="l", 
              ylab="Global Active Power (kilowatts)", xlab="") 
       lines(Sub_metering_2~Datetime,col='Red') 
       lines(Sub_metering_3~Datetime,col='Blue') 
   }) 
 legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  
             legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
 
 ## plot 4
 plot(data$Global_reactive_power~data$Datetime, type="l", ylab="Global Reactive Power (kilowatts)", xlab="datetime") 
 ## Saving to file 
 dev.copy(png, file="plot4.png", height=480, width=480) 
 dev.off() 
