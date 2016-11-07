
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

household_power$DateTime <- as.POSIXct(paste(household_power$Date, household_power$Time)
                                       , format="%Y-%m-%d %H:%M:%S")
#Subset

household_power_subset <- subset(household_power, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

#Plot2

par(mfrow = c(1,1), mar=c(4,4,2,2))

plot( household_power_subset$DateTime,household_power_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, "plot2.png",width = 480, height = 480)

dev.off()
