
file <- file("household_power_consumption.txt")
## reads the data only for the specified 2 dates  
dataSet <- read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE), 
                      col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                    "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                      sep = ";", header = TRUE , na.strings = "?" ) 
## combines the 2 dates time wise.
dataSet$unixTime = strptime(paste(dataSet$Date, dataSet$Time), "%d/%m/%Y %H:%M:%S") 

## Plot 2 
png(filename = 'plot2.png', width = 480, height = 480, units='px')

plot(dataSet$unixTime, dataSet$Global_active_power, type = "l", ylab = 'Global Active Power (kilowatts)', xlab='')
lines(dataSet$unixTime, dataSet$Global_active_power)

dev.off()