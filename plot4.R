## this script only for reading the data and plot4

# reading and cleaning data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
idx <- which(dmy(data$Date)==ymd("2007-02-01")|dmy(data$Date)==ymd("2007-02-02"))
data <- data[idx,]

# plotting
data$datetime <- paste(data$Date, data$Time)
data$day <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(data, plot(day, Global_active_power, type = "l"))  #plot1
with(data, plot(day, Voltage, type="l"))                #plot2
with(data, plot(day, Sub_metering_1, type = "l", ylab="Energy sub metering"))#plot3
with(data, points(day, Sub_metering_2, type = "l", col="red"))
with(data, points(day, Sub_metering_3, type = "l", col="blue"))
legend("topright",pch="-", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), bty="n", cex = 0.8)
with(data, plot(day, Global_reactive_power, type = "l"))#plot4
dev.off()