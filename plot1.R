
## Read only the dates 2007-02-01 and 2007-02-02
hpc <- read.csv("~/R/household_power_consumption.txt", sep=";", skip = 66636, nrows = 2880)
names(hpc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Combine Date and Time. Format to datetime
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S")

## Plot histogram of Global Active Power. Rename title and axis label.
hist(hpc$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
