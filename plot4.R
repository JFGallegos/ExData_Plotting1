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

###Format variables for the figures

datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


global_active_power<- as.numeric(subsetdata$Global_active_power)

global_reactive_power<-as.numeric(subsetdata$Global_reactive_power)

voltage<-as.numeric(subsetdata$Voltage)

sub_metring_1 <- as.numeric(subsetdata$Sub_metering_1)

sub_metring_2 <- as.numeric(subsetdata$Sub_metering_2)

sub_metring_3 <- as.numeric(subsetdata$Sub_metering_3)

### Create the figures

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub_metring_1, type="l", ylab="Energy sub metering", xlab="")

lines(datetime, sub_metring_2, type="l", col="red")

lines(datetime, sub_metring_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

