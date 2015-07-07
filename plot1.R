# Read data, parse into R date/time format, subset the days of interest
pc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
pc <- transform(pc, Date = as.Date(Date, "%d/%m/%Y"))
pc <- transform(pc, Time = strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"))
pc1 <- subset(pc, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

# Create plot #1: Histogram of Global Active Power
png(filename = "plot1.png", width = 480, height= 480)
with(pc1, hist(Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()