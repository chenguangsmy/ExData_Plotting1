## this script only for reading the data and plot2

# reading and cleaning data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
idx <- which(dmy(data$Date)==ymd("2007-02-01")|dmy(data$Date)==ymd("2007-02-02"))
data <- data[idx,]

# plotting
data$datetime <- paste(data$Date, data$Time)
data$day <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width=480, height=480)
with(data, plot(day, Global_active_power, type = "l"))
dev.off()