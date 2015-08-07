dat <- read.table("household_power_consumption.txt", header = TRUE, 
                  sep=";", colClasses = "character")
x <- subset(dat, Date =="1/2/2007" | Date == "2/2/2007")

x[,3] <- as.double(x[,3])
x[,4] <- as.double(x[,4])
x[,5] <- as.double(x[,5])
x[,7] <- as.double(x[,7])
x[,8] <- as.double(x[,8])
x[,9] <- as.double(x[,9])
time <- paste(x[,1], x[,2])
time <- strptime(time, "%d/%m/%Y %H:%M:%S")
time <- as.POSIXct(time)

png("plot4.png")
par(mfrow=c(2,2))
plot(time, x[,3], xlab="", ylab="Global Active Power", type ="l")
plot(time, x[,5], xlab="datetime", ylab="Voltage", type="l")
plot(time, x[,7], type="l", col="black", 
     xlab="", ylab="Energy sub metering", 
     lty=1, lwd=1)
lines(time, x[,8], col="red", lty=1, lwd=1)
lines(time, x[,9], col="blue", lty=1, lwd=1)
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black","red","blue"), bty="n")
plot(time, x[,4], xlab="datetime", ylab="Global_reactive_power", 
     type="l")
dev.off()