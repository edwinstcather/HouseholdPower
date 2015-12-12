setwd("C:/Users/Edwin/Documents/R/HPower")
fileurl <- "C:/Users/Edwin/Documents/R/HPower/household_power_consumption.txt"
setClass('myDate')
setClass('myTime')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
setAs("character","myTime", function(from) strptime(from, format="%H:%M", tz="GMT"))
Plot_dat <- read.csv(fileurl, sep = ";", na.strings = "?", colClasses=c('myDate','myTime','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
t1 <- as.Date("2007-02-01")
t2 <- as.Date("2007-02-02")
plt1 <- Plot_dat[Plot_dat$Date %in% t1:t2, ]
png(file = "plot1.png", width = 480, height = 480)
hist(plt1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()