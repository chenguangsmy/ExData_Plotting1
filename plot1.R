## this script only for reading the data and plot1

# reading and cleaning data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
idx <- which(dmy(data$Date)==ymd("2007-02-01")|dmy(data$Date)==ymd("2007-02-02"))
data <- data[idx,]

# plotting
gap <- as.numeric(as.character(household_power_sub$Global_active_power))
png(filename = "plot1.png", width=480, height=480)
hist(gap, col = "red", main = "Global Active Power")
dev.off()