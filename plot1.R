dat <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
x <- subset(dat, Date =="1/2/2007" | Date == "2/2/2007")

x[,3] <- as.double(lapply(x[,3], toString))
hist(x[,3], col = "red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.copy(png, "plot1.png")
dev.off()