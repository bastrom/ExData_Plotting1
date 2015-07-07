# Read data, parse into R date/time format, subset the days of interest
pc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
pc <- transform(pc, Date = as.Date(Date, "%d/%m/%Y"))
pc <- transform(pc, Time = strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"))
pc1 <- subset(pc, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

# Create plot #3: Line charts of each Sub_metering var over Time, with legend
png(filename = "plot3.png", width = 480, height= 480)
with(pc1, plot(Time, Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering"))
with(pc1, lines(Time, Sub_metering_1, col = "black"))
with(pc1, lines(Time, Sub_metering_2, col = "red"))
with(pc1, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
