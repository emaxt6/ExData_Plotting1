#Read provided data file
data <- read.csv(file="household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactor=F)
wdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
wdata$timestamp <- strptime(paste(wdata$Date, wdata$Time), "%d/%m/%Y %H:%M:%S")


#Write to disk
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(wdata$timestamp, wdata$Global_active_power, type="l", ylab="Global Active Power", xlab=NA)
plot(wdata$timestamp, wdata$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(wdata$timestamp, wdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=NA, col="black", )
lines(wdata$timestamp, wdata$Sub_metering_2, type="l", col="red")
lines(wdata$timestamp, wdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), col=c("black", "red", "blue"), lwd=1, bty="n")
plot(wdata$timestamp, wdata$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()