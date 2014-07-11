rawfile <- "household_power_consumption.txt"
rawfilez <- "household_power_consumption.zip"
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists(rawfile)) {
  download.file(url=url, destfile=rawfilez)
  unzip(rawfilez)
}
#Read provided data file
data <- read.csv(file="household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactor=F)
wdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
wdata$timestamp <- strptime(paste(wdata$Date, wdata$Time), "%d/%m/%Y %H:%M:%S")

#Write to disk
png("plot3.png", width=480, height=480)
plot(wdata$timestamp, wdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=NA, col="black", )
lines(wdata$timestamp, wdata$Sub_metering_2, type="l", col="red")
lines(wdata$timestamp, wdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), col=c("black", "red", "blue"), lwd=1)
dev.off()