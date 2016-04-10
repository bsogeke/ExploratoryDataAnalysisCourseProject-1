# Plot4.R

dataFile <- "household_power_consumption.txt"

## Check if file exist in directory
if (file.exists(dataFile)) {
  data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  getSubSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

  #Date-time Conversion Functions to and from Character
  getDatetime <- strptime(paste(getSubSetData$Date, getSubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  globalActivePower <- as.numeric(getSubSetData$Global_active_power)
  globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
  getVoltage <- as.numeric(getSubSetData$Voltage)
  getSubMetering1 <- as.numeric(getSubSetData$Sub_metering_1)
  getSubMetering2 <- as.numeric(getSubSetData$Sub_metering_2)
  getSubMetering3 <- as.numeric(getSubSetData$Sub_metering_3)

  # Plot graph
  png("plot4.png", width=480, height=480)
  par(mfrow = c(2, 2)) 

  plot(getDatetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  plot(getDatetime, getVoltage, type="l", xlab="datetime", ylab="Voltage")
  plot(getDatetime, getSubMetering1, type="l", ylab="Energy Submetering", xlab="")
  
  lines(getDatetime, getSubMetering2, type="l", col="red")
  lines(getDatetime, getSubMetering3, type="l", col="blue")
  
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

  plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

  # shuts down the specified (by default the current) device
  dev.off()
} else {
  stopStringTxt <- paste("File ",dataFile, " cannot be found")
  stop(stopStringTxt)
}

# List content of directory
dir()

