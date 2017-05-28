#Week 1: Project 1
#
# Looks like we are making plots this week
#Plot4

###Please NOTE: after hours (and i mean hours) working on this plot, i could not get the legend to
#appear correctly!

setwd("/Users/tonie.vandam/Downloads/data_science/exp_data_analy/week_1/project")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data => we only want two days
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#Plot the data
dev.off()
par(mfrow=c(2,2))
#plot (1,1)
with(data,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=" "))
#plot (1,2)
with(data,plot(datetime,Voltage,type="l",ylab="Voltage"))
#plot (2,1)
with(data, plot(datetime, Sub_metering_1, type = "n", ann = F))
with(data, lines(datetime, Sub_metering_1, col="black"))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))
title(ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)
#plot(2,2)
with(data,plot(datetime,Global_reactive_power,type="l",ylab="Global_reactive_power"))
#output the plot
dev.copy(png, file = "plot4.png")
dev.off()
