
## Read only the dates 2007-02-01 and 2007-02-02
hpc <- read.csv("~/R/household_power_consumption.txt", sep=";", skip = 66636, nrows = 2880)
names(hpc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Combine Date and Time. Format to datetime
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S")

# Set up for four graphs of 2x2.
par(mfrow = c(2, 2))

## Plot line graph of Global Active Power over time. Rename axis label.
plot(hpc$DateTime, hpc$Global_active_power, type = "lines", ylab = "Global Active Power", xlab = "")

## Plot line graph of Voltage over time. Rename axis labels.
plot(hpc$DateTime, hpc$Voltage, type = "lines", ylab = "Voltage", xlab = "datetime")

## Plot line graph of sub meterings over time. Rename axis label. Add legend.
plot(hpc$DateTime, hpc$Sub_metering_1, type = "lines", ylab = "Energy sub metering", xlab = "")
with(hpc, lines(hpc$DateTime, hpc$Sub_metering_2, col = "red"))
with(hpc, lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)

## Plot line graph of Global reactive power over time. Rename axis labels.
plot(hpc$DateTime, hpc$Global_reactive_power, type = "lines", ylab = "Global_reactive_power", xlab = "datetime")

# Make a png copy
dev.copy(png, file = "plot4.png") 
dev.off()
