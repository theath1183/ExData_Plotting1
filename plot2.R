## dplyr, tidyr and lubridate packages necessary to run the following script
## install.packages("dpylr")
## install.packages("lubridate")
library("dplyr")
library("lubridate")

## Import data and extract date, time, and global active data for Feb 1st 
## and 2nd, 2007
data <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";")
data <- select(data, Date, Time, Global_active_power)
data <- data[grep("^[1-2]/2/2007", data$Date), ]
## Combines date and time into a single variable and reformats it to "date" class.
data$Date <- paste(data$Date, " ", data$Time)
data <- select(data, Date, Global_active_power)

## Format data
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Date <- dmy_hms(data$Date)

## Construct and display time-series directly into R Studio
# plot(data$Date, data$Global_active_power, type = "l", xlab = "", 
#      ylab = "Global Active Power (kilowatts)")

## Constructs the time-series plot and saves it to wd as a png file
png(file="./plot2.png", width = 480, height = 480)
plot(data$Date, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()