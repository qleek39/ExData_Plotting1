power.cons.df <- read.table(file="./household_power_consumption.txt", header = TRUE, na.strings="?", sep = ";", stringsAsFactors=FALSE)
twodays.power.cons.df = power.cons.df[power.cons.df$Date == "1/2/2007" | power.cons.df$Date == "2/2/2007", ]

png(file="./figure/plot1.png", width=504, height=504)
hist(twodays.power.cons.df$Global_active_power, main = "Global Active Power", col = 'red', xlab="Global Active Power (killowats)")
dev.off()
