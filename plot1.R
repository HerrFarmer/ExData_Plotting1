# Plot 1

# Load required libraries
library(dplyr)

# Load text file
dfDataTemp =  read.table("./downloads/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt", 
                         sep = ";", 
                         header = TRUE, 
                         stringsAsFactors = FALSE, 
                         na.strings=c("?","NA"), 
                         colClasses = c("character", "character", rep("numeric",7)))

# Restrict the data
dfData = filter(dfDataTemp, Date == "1/2/2007" | Date == "2/2/2007")

# Clean-up workspace
rm(dfDataTemp)

# Open PNG device
png(filename = "plot1.png",width = 480, height = 480, units = "px", bg = "white")

# Plot histogram
hist(dfData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", breaks = 12, ylim = c(0,1200))

# Close PNG device
dev.off()









