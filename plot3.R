setwd("c:/Users/DELL/Desktop")
library(data.table)
tareqkh<- data.table::fread(input = "household_power_consumption.txt", na.strings="?" )
tareqkh[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
tareqkh[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
tareqkh <- tareqkh[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot3.png", width=480, height=480)
plot(tareqkh$dateTime,tareqkh$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(tareqkh$dateTime,tareqkh$Sub_metering_2,col="red")
lines(tareqkh$dateTime,tareqkh$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue"),c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3"),lty = c(1,1),lwd = c(1,1))
dev.off()
