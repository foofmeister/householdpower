
#library

library("dplyr");
library("ggplot2");
library("plyr");

#set working directory

setwd("C:/Users/summers.forest/R/Coursera/3. Exploratory_Data_Analysis")

#Download, unzip file and bring file data frame into environment

download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip" , "household_power_consumption.zip");
unzip("household_power_consumption.zip");

household_power <- read.delim(file = "household_power_consumption.txt", sep = ";" ,header = TRUE, stringsAsFactors = FALSE)

#Format and subset Date type

household_power$Date <- as.Date(household_power$Date, format = "%d/%m/%Y")

household_power_subset <- subset(household_power, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

#Build Plot1

par(mfrow = c(2,2), mar=c(4,4,1,1))


#Plot2


plot( household_power_subset$DateTime,household_power_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


#Plot 3

plot( household_power_subset$Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub Metering")

lines(household_power_subset$Sub_metering_1, col = "black")
lines(household_power_subset$Sub_metering_2, col = "red")
lines(household_power_subset$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), c("black","red","blue"),cex = .3
       , lwd=c(1,1),col=c("black","blue","red"))


plot(household_power_subset$DateTime, household_power_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(household_power_subset$DateTime, household_power_subset$Voltage, type = "l", xlab = "datetime", ylab = "Global Reactive Power")


dev.copy(png, "plot4.png",width = 480, height = 480)

dev.off()
