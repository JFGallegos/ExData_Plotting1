### Set directory
setwd('/data/Stata/francisco_data/coursera/course_project_1')

##Load necessary libraries
library('data.table')
library('dplyr')

### Read the data

data<-fread('household_power_consumption.txt')

### Subset desired dates

subsetdata <- data %>%
              filter(Date %in% c("1/2/2007","2/2/2007"))


datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subsetdata$Global_active_power)

A <- as.numeric(subsetdata$Sub_metering_1)

B <- as.numeric(subsetdata$Sub_metering_2)

C <- as.numeric(subsetdata$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datetime, A, type="l", ylab="Energy sub metering", col = "black", xlab="")

lines(datetime, B, type="l", col="red")

lines(datetime, C, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
