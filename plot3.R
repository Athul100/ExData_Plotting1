# Plot 1


# Loading Data
path = "household_power_consumption.txt"

my_data <- read.table(path, sep = ";", h=T, colClasses = c("character", "character", rep("numeric",7)), na.strings = "?")
# Creating DateTime column
my_data$DateTime <- strptime(paste(my_data$Date, my_data$Time), "%d/%m/%Y %H:%M:%S")

# Subseting Data based on criteria

subset_data = subset(my_data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))


# Plotting

png("plot3.png", height=480, width=480)

plot(subset_data$DateTime, subset_data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(subset_data$DateTime, subset_data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")

lines(subset_data$DateTime, subset_data$Sub_metering_1)
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

