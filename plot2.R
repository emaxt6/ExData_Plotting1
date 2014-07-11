#Read provided data file
data <- read.csv(file="household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactor=F)
wdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
wdata$timestamp <- strptime(paste(wdata$Date, wdata$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(wdata$timestamp, wdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=NA)
dev.off()