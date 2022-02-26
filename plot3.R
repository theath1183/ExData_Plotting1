## dplyr, tidyr and lubridate packages necessary to run the following script
## install.packages("dpylr")
## install.packages("lubridate")
library("dplyr")
library("lubridate")

## Import data and extract date, time, and global active data for Feb 1st 
## and 2nd, 2007
data <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";")
data <- select(data, Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3)
data <- data[grep("^[1-2]/2/2007", data$Date), ]
## Combines date and time into a single variable and reformats it to "date" class.
data$Date <- paste(data$Date, " ", data$Time)
data <- select(data, Date, Sub_metering_1, Sub_metering_2, Sub_metering_3)

## Format data
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Date <- dmy_hms(data$Date)

## Construct and display time-series directly into R Studio
# plot(data$Date, data$Sub_metering_1, type = "l", xlab = "", 
#      ylab = "Energy sub metering")
# lines(data$Date, data$Sub_metering_2, type = "l", col = "Red")
# lines(data$Date, data$Sub_metering_3, type = "l", col = "Blue")
# legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
#        col = c("Black", "Red", "Blue"), lty = 1)

## Constructs the time-series plot and saves it to wd as a png file
png(file="./plot3.png", width = 480, height = 480)
    plot(data$Date, data$Sub_metering_1, type = "l", xlab = "", 
        ylab = "Energy sub metering")
    lines(data$Date, data$Sub_metering_2, type = "l", col = "Red")
    lines(data$Date, data$Sub_metering_3, type = "l", col = "Blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col = c("Black", "Red", "Blue"), lty = 1)
dev.off()
