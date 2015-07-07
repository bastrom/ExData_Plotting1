# Read data, parse into R date/time format, subset the days of interest
pc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
pc <- transform(pc, Date = as.Date(Date, "%d/%m/%Y"))
pc <- transform(pc, Time = strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"))
pc1 <- subset(pc, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

# Create plot #4, with four subplots

png(filename = "plot4.png", width = 480, height= 480)
par(mfrow = c(2,2))

# Subplot 1: Line graph of Global active power over time
with(pc1, plot(Time, Global_active_power, type="n", xlab="", ylab = "Global Active Power"))
lines(pc1$Time, pc1$Global_active_power)

# Subplot 2: Line graph of Voltage over time
with(pc1, plot(Time, Voltage, type="n", xlab="datetime", ylab="Voltage"))
lines(pc1$Time, pc1$Voltage)

# Subplot 3: Sub_metering detail over time, with legend
with(pc1, plot(Time, Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering"))
with(pc1, lines(Time, Sub_metering_1, col = "black"))
with(pc1, lines(Time, Sub_metering_2, col = "red"))
with(pc1, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty="n")

# Subplot 4: Global Reactive Power over time
with(pc1, plot(Time, Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power"))
lines(pc1$Time, pc1$Global_reactive_power)

dev.off()