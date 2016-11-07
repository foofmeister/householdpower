
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

par(mfrow = c(1,1), mar=c(4,4,1,1))

global_active_power <- as.numeric(household_power_subset$Global_active_power)

global_active_power <- round_any(global_active_power, accuracy = .5)

global_active_power <- global_active_power[!is.na(global_active_power)]

barplot(table(global_active_power), xlab = "Global Active Power (kilowatts)", col = "red",ylab = "Frequency", main = "Global Active Power")

dev.copy(png, "plot1.png",width = 480, height = 480)

dev.off()

