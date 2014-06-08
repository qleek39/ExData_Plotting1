power.cons.df <- read.table(file="./household_power_consumption.txt", header = TRUE, na.strings="?", sep = ";", stringsAsFactors=FALSE)
twodays.power.cons.df = power.cons.df[power.cons.df$Date == "1/2/2007" | power.cons.df$Date == "2/2/2007", ]
twodays.power.cons.df$Date.Time.str <- paste(twodays.power.cons.df$Date, twodays.power.cons.df$Time)
twodays.power.cons.df$Date.Time.posix <- strptime(twodays.power.cons.df$Date.Time.str, format = "%d/%m/%Y %H:%M:%S")

png(file="./figure/plot2.png", width=504, height=504)
plot(twodays.power.cons.df$Date.Time.posix, twodays.power.cons.df$Global_active_power, type ='n', ylab = "Global Active Power (killowats)")
lines(twodays.power.cons.df$Date.Time.posix, twodays.power.cons.df$Global_active_power)
dev.off()
