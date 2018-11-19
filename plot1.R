setwd("c:/Users/DELL/Desktop")
library("data.table")
tareqkh<-read.csv("household_power_consumption.txt") 
tareqkh<-data.table::fread(input = "household_power_consumption.txt",na.strings = "?")
tareqkh[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
png("plot1.png", width=480, height=480)
hist(tareqkh$Global_active_power,main = "Global Active Power",col = "red",xlab = "Global Active Power(Kilowatts)",ylab = "Frequency",freq = FALSE,probability = TRUE,xlim = c(0,6))
dev.off()


