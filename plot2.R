# Plot 2

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
png(filename = "plot2.png",width = 480, height = 480, units = "px", bg = "white")

plot(dfData$DateTime, dfData$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Close PNG device
dev.off()





