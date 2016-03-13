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
globalActivePower <- as.numeric(data$Global_active_power)

#Generate plot
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
