#Week 1: Project 1
#
# Looks like we are making plots this week
#Plot3
setwd("/Users/tonie.vandam/Downloads/data_science/exp_data_analy/week_1/project")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data => we only want two days
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#Plot the data
with(data,plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" "))
with(data,lines(datetime,Sub_metering_2,type="l",col="red"))
with(data,lines(datetime,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#output the plot
dev.copy(png, file = "plot3.png")
dev.off()