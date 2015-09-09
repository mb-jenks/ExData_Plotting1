## Load In Data
dat <- read.csv("household_power_consumption.txt", sep = ";")

## Convert the dates to the proper dateformat
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")

## Subset Data between the specified dates
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
dat <- dat[dat$Date >= date1 & dat$Date <= date2,]

## Convert the Global Active Power to numeric
dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))
dat$Sub_metering_1 <- as.numeric(as.character(dat$Sub_metering_1))
dat$Sub_metering_2 <- as.numeric(as.character(dat$Sub_metering_2))
dat$Sub_metering_3 <- as.numeric(as.character(dat$Sub_metering_3))

## Create new Date/Time column
dat$DateTime <- strptime(paste(dat$Date, dat$Time), format="%Y-%m-%d %H:%M:%S")

par(bg = "transparent")

## Create the plots
plot(dat$DateTime, dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_2, col = "red")
lines(dat$DateTime, dat$Sub_metering_3, col = "blue")

## Add the legend to the top right corner
legend("topright", lwd = 1, pt.cex = 2, cex = .5, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copy the plot to a png file and close it
dev.copy(png, "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
dev.off()
