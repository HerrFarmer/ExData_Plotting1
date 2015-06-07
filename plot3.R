# Plot 3

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
png(filename = "plot3.png",width = 480, height = 480, units = "px", bg = "white")

plot(dfData$DateTime, dfData$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(dfData$DateTime, dfData$Sub_metering_2, type = "l", col = "red")
lines(dfData$DateTime, dfData$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = NA, lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close PNG device
dev.off()





