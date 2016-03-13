#Download Data
if (!file.exists("data.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="data.zip",)
  unzip("data.zip")  
}

#Read only the subset data
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))

#Convert variables
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)
globalReactivePower <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

#Generate plot framework
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#Generate top left plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

#Generate top right plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Generate bottom left plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="o")

#Generate bottom right plot
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()