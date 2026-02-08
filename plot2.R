power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrow = 70000)
power_data[["Date"]] <- as.Date(power_data[["Date"]], format = "%d/%m/%Y")
power_data <- power_data[power_data$Date == "2007-02-01" | power_data$Date == "2007-02-02", ]
power_data[["Time"]] <- strptime(power_data[["Time"]], format = "%H:%M:%S")
power_data[["Global_active_power"]] <- as.numeric(power_data$Global_active_power)

power_data[["Weekday"]] <- weekdays(power_data$Date)        ## Adding another column containing the Weekdays of the entries
last_index <- nrow(power_data)                              ## Index of the last entry i.e. 2880

date <- as.Date("2007-02-01")                               
days <- c(weekdays(date, abbreviate = TRUE), weekdays(date + 1, abbreviate = TRUE), weekdays(date + 2, abbreviate = TRUE))   ## Character vector containing the name of Weekdays of the entries (will be used for labeling the x-axis)
days_index <- c(1, match(a[2], power_data$Weekday), last_index)     ## Numeric vector containing the indexes where the weekdays labeling will be done



png(file = "plot2.png")
plot(power_data$Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type  = "l", xaxt = "n")
axis(side = 1, at = days_index, labels = days)          ## Adding the weekdays at appropriate positions
dev.off()

