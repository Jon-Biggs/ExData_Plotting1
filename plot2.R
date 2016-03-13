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

#Generate plot
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()