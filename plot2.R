#Coursera Exploratory Data Analysis
#Week 1: Project 1
#
# Looks like we are making plots this week
#Plot 2
setwd("/Users/tonie.vandam/Downloads/data_science/exp_data_analy/week_1/project")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data => we only want two days
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#Plot the data
with(data,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=" "))
#output the plot
dev.copy(png, file = "plot2.png")
dev.off()