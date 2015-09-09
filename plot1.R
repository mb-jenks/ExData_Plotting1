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

## Create png file for the graphics
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

## Create histogram of Global Active Power
hist(dat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Close png file
dev.off()
