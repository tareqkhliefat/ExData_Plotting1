setwd("c:/Users/DELL/Desktop")
library(data.table)
tareqkh<- data.table::fread(input = "household_power_consumption.txt", na.strings="?" )
tareqkh[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
tareqkh[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
tareqkh <- tareqkh[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(x=tareqkh[,dateTime],y=tareqkh[,Global_active_power],xlab = "",ylab = "Global Active Power (kilowatts)",type = "l")


plot(tareqkh$dateTime,tareqkh$Voltage,type = "l",xlab = "datetime",ylab = "voltage")

plot(tareqkh$dateTime,tareqkh$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(tareqkh$dateTime,tareqkh$Sub_metering_2,col="red")
lines(tareqkh$dateTime,tareqkh$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue"),c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3"),lty = c(1,1),lwd = c(1,1))

plot(tareqkh$dateTime,tareqkh$Global_reactive_power,type = "l",xlab = "datetime",ylab = "global reactive power")

dev.off()
