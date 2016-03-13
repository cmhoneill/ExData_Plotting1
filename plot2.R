dataFile <- "./household_power_consumption.txt" 
fulldataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
fulldataset$Date <- as.Date(fulldataset$Date, format="%d/%m/%Y") 
 
## Subsetting the data 
data <- subset(fulldataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(fulldataset)

## Converting dates 
 datetime <- paste(as.Date(data$Date), data$Time) 
 data$Datetime <- as.POSIXct(datetime) 
  
 plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
 ## Saving to file 
 dev.copy(png, file="plot2.png", height=480, width=480) 
 dev.off() 
 


