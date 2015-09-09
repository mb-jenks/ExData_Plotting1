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

## Create new Date/Time column
dat$DateTime <- strptime(paste(dat$Date, dat$Time), format="%Y-%m-%d %H:%M:%S")

## Set transparent background
par(bg = "transparent")

## Plot the line graph
plot(dat$DateTime, dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Copy to png file and close
dev.copy(png, "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
dev.off()


