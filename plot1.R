# Plot 1


# Loading Data
path = "household_power_consumption.txt"
my_data <- read.table(path, sep = ";", h=T, colClasses = c("character", "character", rep("numeric",7)), na.strings = "?")
# Creating DateTime column
my_data$DateTime <- strptime(paste(my_data$Date, my_data$Time), "%d/%m/%Y %H:%M:%S")

# Subseting Data based on criteria

subset_data = subset(my_data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))


# Plotting

png("plot1.png", height=480, width=480)

hist(subset_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

