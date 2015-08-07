dat <- read.table("household_power_consumption.txt", header = TRUE, 
                  sep=";", colClasses = "character")
x <- subset(dat, Date =="1/2/2007" | Date == "2/2/2007")

x[,3] <- as.double(x[,3])
time <- paste(x[,1], x[,2])
time <- strptime(time, "%d/%m/%Y %H:%M:%S")
time <- as.POSIXct(time)

plot(time, x[,3], type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.copy(png, "plot2.png")
dev.off()