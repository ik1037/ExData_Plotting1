#Importing the data into R
data <- read.table("household_power_consumption.txt",skip=1,sep=";")

# Naming the columns
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Subsetting the data
sub.data <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Histogram of Global Active Power
hist(as.numeric(as.character(sub.data$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
