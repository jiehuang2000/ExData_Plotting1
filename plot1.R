#setwd("~/Desktop/Exploratory_Data_Analysis/PA1")

filename <- "household_power_consumption.txt"
df <- read.table(filename, header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
subset <- subset(df, df$Date == "2/2/2007" | df$Date == "1/2/2007")

subset[,1] <- as.Date(subset[,1], "%d/%m/%Y")

png(file = "plot1.png")
hist(subset[,3], col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatt)")
dev.off()