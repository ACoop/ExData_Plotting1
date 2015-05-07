powerData <- read.table("household_power_consumption.txt",na.strings = "?",sep = ";",nrows = 69519,comment.char = "", header = TRUE,stringsAsFactors = FALSE)
powerData$Date <- as.Date( powerData$Date, "%d/%m/%Y")
powerData <- subset(powerData, Date >= as.Date("2007-2-1"),Date <= as.Date("2007-2-2") )
powerData$Date <- as.POSIXct(paste(powerData$Date, powerData$Time), format="%Y-%m-%d %H:%M:%S")



png(filename="plot3.png", width = 480, height = 480)
plot(powerData$Date,powerData$Sub_metering_1, type="s",xlab = "",ylab = "Energy sub metering")
points(powerData$Date,powerData$Sub_metering_2, type= "s", col="red")
points(powerData$Date,powerData$Sub_metering_3, type= "s", col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1, 1, 1),col = c("black", "red", "blue"))
dev.off()



