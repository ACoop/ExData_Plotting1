powerData <- read.table("household_power_consumption.txt",na.strings = "?",sep = ";",nrows = 69519,comment.char = "", header = TRUE,stringsAsFactors = FALSE)
powerData$Date <- as.Date( powerData$Date, "%d/%m/%Y")
powerData <- subset(powerData, Date >= as.Date("2007-2-1"),Date <= as.Date("2007-2-2") )
powerData$Date <- as.POSIXct(paste(powerData$Date, powerData$Time), format="%Y-%m-%d %H:%M:%S")



png(filename="plot2.png", width = 480, height = 480)
plot(powerData$Date,powerData$Global_active_power, type="s",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()

