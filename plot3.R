## reads the entire dataset
dataSet <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                    na.strings = "?", nrows = 2075259, check.names = F, 
                    stringsAsFactors = F, comment.char = "", quote = '\"')
## changes the date column into datetype. 
dataSet$Date <- as.Date(dataSet$Date, format = "%d/%m/%Y")
## subsets the values for only 2 dates specified. 
dataSet <- subset(dataSet, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
## combines the date and time column into one. 
datetime <- paste(as.Date(dataSet$Date), dataSet$Time)
dataSet$Datetime <- as.POSIXct(datetime)
png("plot3.png", width=480, height=480)
## plots the line graph of 3 columns sub_metering 1,2,3
with(dataSet, {
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()