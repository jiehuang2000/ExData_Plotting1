#setwd("~/Desktop/Exploratory_Data_Analysis/PA1")

filename <- "household_power_consumption.txt"
df <- read.table(filename, header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
subset <- subset(df, df$Date == "2/2/2007" | df$Date == "1/2/2007")

subset[,1] <- as.Date(subset[,1], "%d/%m/%Y")


DateTime <- strptime(paste(subset[,1], subset[,2]), "%d/%m/%Y %H:%M:%OS")

subset$DateTime <- DateTime


png(file = "plot3.png")
plot(subset$DateTime, subset$Sub_metering_1, xlab = "", ylab = "Energy sub metering",type = 'l')
points(subset$DateTime, subset$Sub_metering_2,type = 'l', col = "Red")
points(subset$DateTime, subset$Sub_metering_3,type = 'l', col = "Blue")
legend("topright", pch = "-", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"))
dev.off()