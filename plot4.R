# Plot 4

# Load required libraries
library(dplyr)

# Load text file
dfDataTemp =  read.table("./downloads/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt", 
                         sep = ";", 
                         header = TRUE, 
                         stringsAsFactors = FALSE, 
                         na.strings=c("?","NA"), 
                         colClasses = c("character", "character", rep("numeric",7)))

# Filter for required days 
dfData = filter(dfDataTemp, Date == "1/2/2007" | Date == "2/2/2007")

# Clean-up workspace
rm(dfDataTemp)

# Create date/time column
dfData$DateTime = strptime(paste(dfData$Date, dfData$Time), "%d/%m/%Y %H:%M:%S")

# Open PNG device
png(filename = "plot4.png",width = 480, height = 480, units = "px", bg = "transparent")

# Set layout for plot
par(mfrow=c(2,2))

# Quandrant 1 - Global Active Power
plot(dfData$DateTime, dfData$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# Quandrant 2 - Voltage
plot(dfData$DateTime, dfData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# Quadrant 3 - Energy sub metering
plot(dfData$DateTime, dfData$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(dfData$DateTime, dfData$Sub_metering_2, type = "l", col = "red")
lines(dfData$DateTime, dfData$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = NA, lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# Quadrant 4 - Global Reactive Power
plot(dfData$DateTime, dfData$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", ylim = c(0,0.5))

# Close PNG device
dev.off()





