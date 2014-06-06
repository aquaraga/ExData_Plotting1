all.data <- read.table("../data/household_power_consumption.txt", sep = ";", na.strings="?",
                       header = TRUE, colClasses = c(rep("character",2), rep("numeric", 7)))
#Convert the date
all.data$DateTime <- strptime(paste(all.data$Date, all.data$Time), format = "%d/%m/%Y %H:%M:%S")
all.data$Date <- as.Date(all.data$Date, format = "%d/%m/%Y")
#Get the relevant data
firstFeb <- as.Date("01/02/2007", "%d/%m/%Y")
secondFeb <- as.Date("02/02/2007", "%d/%m/%Y")
feb.data <- subset(all.data, Date == firstFeb | Date == secondFeb)

#Draw the plot
png(file = "../figure/plot3.png")
with(feb.data, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
with(feb.data, points(DateTime, Sub_metering_1, type = "l"))
with(feb.data, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(feb.data, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()