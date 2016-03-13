dataFile <- "./household_power_consumption.txt" 
fulldataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
fulldataset$Date <- as.Date(fulldataset$Date, format="%d/%m/%Y") 

## Subsetting the data 
data <- subset(fulldataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(fulldataset)

## Converting dates 
 datetime <- paste(as.Date(data$Date), data$Time) 
 data$Datetime <- as.POSIXct(datetime) 
 
 x <- as.numeric(data$Global_active_power)
 hist(x, main="Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency", col="red")
 ## Saving to file 
   dev.copy(png, file="plot1.png", height=480, width=480) 
  dev.off() 
 


