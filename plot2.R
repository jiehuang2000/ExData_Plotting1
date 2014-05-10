#setwd("~/Desktop/Exploratory_Data_Analysis/PA1")

filename <- "household_power_consumption.txt"
df <- read.table(filename, header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
subset <- subset(df, df$Date == "2/2/2007" | df$Date == "1/2/2007")

subset[,1] <- as.Date(subset[,1], "%d/%m/%Y")

       
DateTime <- strptime(paste(subset[,1], subset[,2]), "%d/%m/%Y %H:%M:%OS")

subset$DateTime <- DateTime


png(file = "plot2.png")
plot(subset$DateTime, subset$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)",type = 'l')
dev.off()
