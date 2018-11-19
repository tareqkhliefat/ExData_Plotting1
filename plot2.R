
setwd("c:/Users/DELL/Desktop")
library("data.table")
tareqkh<-read.csv("household_power_consumption.txt") 
tareqkh<-data.table::fread(input = "household_power_consumption.txt",na.strings = "?")
tareqkh[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
tareqkh[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
tareqkh <- tareqkh[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot2.png", width=480, height=480)
plot(x=tareqkh[,dateTime],y=tareqkh[,Global_active_power],xlab = "",ylab = "Global Active Power (kilowatts)",type = "l")
dev.off()


