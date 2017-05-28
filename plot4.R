#Week 1: Project 1
#
# Looks like we are making plots this week
#Plot4
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
with(data,plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" "))
with(data,lines(datetime,Sub_metering_2,type="l",col="red"))
with(data,lines(datetime,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.6,y.intersp=0.25)
#plot(2,2)
with(data,plot(datetime,Global_reactive_power,type="l",ylab="Global_reactive_power"))
#output the plot
dev.copy(png, file = "plot4.png")
dev.off()