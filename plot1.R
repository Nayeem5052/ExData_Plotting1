power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrow = 70000)
power_data[["Date"]] <- as.Date(power_data[["Date"]], format = "%d/%m/%Y")
power_data <- power_data[power_data$Date == "2007-02-01" | power_data$Date == "2007-02-02", ]
power_data[["Time"]] <- strptime(power_data[["Time"]], format = "%H:%M:%S")
power_data[["Global_active_power"]] <- as.numeric(power_data$Global_active_power)

names(power_data)
class(power_data[[3]])
dim(power_data)


hist(power_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")


