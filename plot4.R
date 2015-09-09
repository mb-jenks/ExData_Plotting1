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
dat$Global_reactive_power <- as.numeric(as.character(dat$Global_reactive_power))
dat$Voltage <- as.numeric(as.character(dat$Voltage))
dat$Sub_metering_1 <- as.numeric(as.character(dat$Sub_metering_1))
dat$Sub_metering_2 <- as.numeric(as.character(dat$Sub_metering_2))
dat$Sub_metering_3 <- as.numeric(as.character(dat$Sub_metering_3))

## Create new Date/Time column
dat$DateTime <- strptime(paste(dat$Date, dat$Time), format="%Y-%m-%d %H:%M:%S")

## Setup plotting the environment
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0), bg = "transparent")
plot(dat$DateTime, dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(dat$DateTime, dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dat$DateTime, dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_2, col = "red")
lines(dat$DateTime, dat$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, pt.cex = 2, cex = .25, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dat$DateTime, dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## Copy the plot to a png file and close it
dev.copy(png, "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
dev.off()


