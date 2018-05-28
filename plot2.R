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

###Create Plot

time <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

gap <- as.numeric(subsetdata$Global_active_power)

png("plot2.png", width=480, height=480)

plot(time, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
