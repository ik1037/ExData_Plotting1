# Importing the data
data <- read.table("household_power_consumption.txt",skip=1,sep=";")

## Renaming the columns
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Subsetting the data
sub.data <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")

## Converting date and time to the correct format 
sub.data$Date <- as.Date(sub.data$Date, format="%d/%m/%Y")
sub.data$Time <- strptime(sub.data$Time, format="%H:%M:%S")
sub.data[1:1440,"Time"] <- format(sub.data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub.data[1441:2880,"Time"] <- format(sub.data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Plot 2
plot(sub.data$Time,as.numeric(as.character(sub.data$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating the plot
title(main="Global Active Power Vs Time")
