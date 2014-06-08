power.cons.df <- read.table(file="./household_power_consumption.txt", header = TRUE, na.strings="?", sep = ";", stringsAsFactors=FALSE)
twodays.power.cons.df = power.cons.df[power.cons.df$Date == "1/2/2007" | power.cons.df$Date == "2/2/2007", ]
twodays.power.cons.df$Date.Time.str <- paste(twodays.power.cons.df$Date, twodays.power.cons.df$Time)
twodays.power.cons.df$Date.Time.posix <- strptime(twodays.power.cons.df$Date.Time.str, format = "%d/%m/%Y %H:%M:%S")

png(file="./figure/plot4.png", width=1008, height=1008)
par(mfcol=c(2, 2))
plot(twodays.power.cons.df$Date.Time.posix, twodays.power.cons.df$Global_active_power, type ='n', ylab = "Global Active Power (killowats)")
lines(twodays.power.cons.df$Date.Time.posix, twodays.power.cons.df$Global_active_power)


plot(twodays.power.cons.df$Date.Time.posix, twodays.power.cons.df$Sub_metering_1, type = 'n', ylab = 'Energy Sub Metering')
lines(twodays.power.cons.df$Date.Time.posix, twodays.power.cons.df$Sub_metering_1, col = 'gray')
lines(twodays.power.cons.df$Date.Time.posix, twodays.power.cons.df$Sub_metering_2, col = 'red')
lines(twodays.power.cons.df$Date.Time.posix, twodays.power.cons.df$Sub_metering_3, col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = 20, col = c("gray", "red", "blue"))


plot(twodays.power.cons.df$Date.Time.posix, twodays.power.cons.df$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(twodays.power.cons.df$Date.Time.posix, twodays.power.cons.df$Voltage)


plot(twodays.power.cons.df$Date.Time.posix, twodays.power.cons.df$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(twodays.power.cons.df$Date.Time.posix, twodays.power.cons.df$Global_reactive_power)

dev.off()
