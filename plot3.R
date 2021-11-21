# Importing the data
data <- read.table("household_power_consumption.txt",skip=1,sep=";")

## Renaming the columns
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Subsetting the data
sub.data <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Transforming date and time to correct format
sub.data$Date <- as.Date(sub.data$Date, format="%d/%m/%Y")
sub.data$Time <- strptime(sub.data$Time, format="%H:%M:%S")
sub.data[1:1440,"Time"] <- format(sub.data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub.data[1441:2880,"Time"] <- format(sub.data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


## Plot 3
plot(sub.data$Time,sub.data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(sub.data,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(sub.data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(sub.data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")
