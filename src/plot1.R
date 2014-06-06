all.data <- read.table("../data/household_power_consumption.txt", sep = ";", na.strings="?",
                       header = TRUE, colClasses = c(rep("character",2), rep("numeric", 7)))
#Convert the date
all.data$Date <- as.Date(all.data$Date, format = "%d/%m/%Y")
#Get the relevant data
firstFeb <- as.Date("01/02/2007", "%d/%m/%Y")
secondFeb <- as.Date("02/02/2007", "%d/%m/%Y")
feb.data <- subset(all.data, Date == firstFeb | Date == secondFeb)

#Draw the histogram
png(file = "../figure/plot1.png")
with(feb.data, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
                    main = "Global Active Power"))
dev.off()
