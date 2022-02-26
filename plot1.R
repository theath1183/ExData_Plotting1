## dplyr and lubridate packages necessary to run the following script
## install.packages("dpylr")
## install.packages("lubridate")
library("dplyr")
library("lubridate")

## Imports the data and pulls out on the Feb. 1, and Feb 2 data from 2007 for 
## Global Active Power
data <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";")
data <- select(data, Date, Global_active_power)
data <- data[grep("^[1-2]/2/2007", data$Date),]

## Format data
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Date <- dmy(data$Date)

## Construct and display histogram directly into R Studio
## hist(data$Global_active_power, col = "red", main = "Global Active Power",
##    xlab = "Global Active Power (kilowatts)")

## Constructs the histogram and saves it to wd as a png file
png(file="./plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()