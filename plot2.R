# Read data, parse into R date/time format, subset the days of interest
pc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
pc <- transform(pc, Date = as.Date(Date, "%d/%m/%Y"))
pc <- transform(pc, Time = strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"))
pc1 <- subset(pc, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

# Create plot #2: Line graph of Global Active Power by Time
png(filename = "plot2.png", width = 480, height= 480)
with(pc1, plot(Time, Global_active_power, type="n", xlab="", ylab = "Global Active Power (kilowatts)"))
lines(pc1$Time, pc1$Global_active_power)
dev.off()