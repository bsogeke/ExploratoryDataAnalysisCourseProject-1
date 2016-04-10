# Plot3

dataFile <- "household_power_consumption.txt"

## Check if file exist in directory
if (file.exists(dataFile)) {
  data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  getSubSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

  #Date-time Conversion Functions to and from Character
  getDatetime <- strptime(paste(getSubSetData$Date, getSubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  
  #Convert data to numeric
  globalActivePower <- as.numeric(getSubSetData$Global_active_power)
  getSubMetering1 <- as.numeric(getSubSetData$Sub_metering_1)
  getSubMetering2 <- as.numeric(getSubSetData$Sub_metering_2)
  getSubMetering3 <- as.numeric(getSubSetData$Sub_metering_3)

  # Plot graph
  png("plot3.png", width=480, height=480)
  plot(getDatetime, getSubMetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(getDatetime, getSubMetering2, type="l", col="red")
  lines(getDatetime, getSubMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  
  # shuts down the specified (by default the current) device
  dev.off()
} else {
  stop("File household_power_consumption.txt cannot be found")
}

# List content of directory
dir()
